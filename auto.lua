-- سكربت أوتو شات خاص بـ Delta
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local StartButton = Instance.new("TextButton")
local StopButton = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "DeltaAutoChat"

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Auto Chat - Delta"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

TextBox.Parent = MainFrame
TextBox.PlaceholderText = "اكتب النص هنا..."
TextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
TextBox.Size = UDim2.new(0.8, 0, 0, 30)

StartButton.Parent = MainFrame
StartButton.Text = "بدء"
StartButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
StartButton.Position = UDim2.new(0.1, 0, 0.6, 0)
StartButton.Size = UDim2.new(0.35, 0, 0, 30)

StopButton.Parent = MainFrame
StopButton.Text = "توقف"
StopButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
StopButton.Position = UDim2.new(0.55, 0, 0.6, 0)
StopButton.Size = UDim2.new(0.35, 0, 0, 30)

local running = false
StartButton.MouseButton1Click:Connect(function()
    if running then return end
    running = true
    while running do
        local message = TextBox.Text
        if message ~= "" then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        end
        task.wait(2.5)
    end
end)

StopButton.MouseButton1Click:Connect(function()
    running = false
end)
