local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local StartButton = Instance.new("TextButton")
local StopButton = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "ULTIMATE AUTO CHAT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

TextBox.Parent = MainFrame
TextBox.PlaceholderText = "Type message..."
TextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
TextBox.Size = UDim2.new(0.8, 0, 0, 35)

StartButton.Parent = MainFrame
StartButton.Text = "START"
StartButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
StartButton.Position = UDim2.new(0.1, 0, 0.65, 0)
StartButton.Size = UDim2.new(0.35, 0, 0, 35)

StopButton.Parent = MainFrame
StopButton.Text = "STOP"
StopButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
StopButton.Position = UDim2.new(0.55, 0, 0.65, 0)
StopButton.Size = UDim2.new(0.35, 0, 0, 35)

local running = false

local function UniversalSend(msg)
    -- Method 1: New TextChatService (Loop through all channels)
    local tcs = game:GetService("TextChatService")
    if tcs.ChatVersion == Enum.ChatVersion.TextChatService then
        for _, channel in pairs(tcs:GetDescendants()) do
            if channel:IsA("TextChannel") then
                channel:SendAsync(msg)
            end
        end
    end

    -- Method 2: Legacy Chat (Remote Event)
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
    if remote and remote:FindFirstChild("SayMessageRequest") then
        remote.SayMessageRequest:FireServer(msg, "All")
    end

    -- Method 3: LocalPlayer Chat (Back-up)
    game:GetService("Players").LocalPlayer.Chatted:Connect(function() end) -- Keep alive
end

StartButton.MouseButton1Click:Connect(function()
    if running then return end
    running = true
    while running do
        if TextBox.Text ~= "" then
            UniversalSend(TextBox.Text)
        end
        task.wait(4)
    end
end)

StopButton.MouseButton1Click:Connect(function()
    running = false
end)
