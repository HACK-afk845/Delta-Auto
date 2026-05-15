local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local StartButton = Instance.new("TextButton")
local StopButton = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "AUTO CHAT V3"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

TextBox.Parent = MainFrame
TextBox.PlaceholderText = "Type Message..."
TextBox.Position = UDim2.new(0.1, 0, 0.3, 0)
TextBox.Size = UDim2.new(0.8, 0, 0, 35)
TextBox.Text = ""

StartButton.Parent = MainFrame
StartButton.Text = "START"
StartButton.BackgroundColor3 = Color3.fromRGB(0, 160, 0)
StartButton.Position = UDim2.new(0.1, 0, 0.65, 0)
StartButton.Size = UDim2.new(0.35, 0, 0, 35)

StopButton.Parent = MainFrame
StopButton.Text = "STOP"
StopButton.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
StopButton.Position = UDim2.new(0.55, 0, 0.65, 0)
StopButton.Size = UDim2.new(0.35, 0, 0, 35)

local running = false

-- This function sends the message to the ACTUAL Game Chat
local function GlobalSend(msg)
    -- System 1: New Roblox
