local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false

-- FRAME PRINCIPAL
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,220,0,130)
frame.Position = UDim2.new(0.5,-110,0.5,-65)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local corner = Instance.new("UICorner")
corner.Parent = frame

-- BORDA ROXA
local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Color = Color3.fromRGB(160,0,255)
stroke.Thickness = 3

-- TITULO
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "Freeze Hub"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true

-- TEXTO STATUS
local status = Instance.new("TextLabel")
status.Parent = frame
status.Size = UDim2.new(1,0,0,20)
status.Position = UDim2.new(0,0,0,30)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(255,255,255)
status.TextScaled = true
status.Text = ""

-- BOTÃO FREEZE
local freeze = Instance.new("TextButton")
freeze.Parent = frame
freeze.Size = UDim2.new(0.8,0,0,30)
freeze.Position = UDim2.new(0.1,0,0.45,0)
freeze.Text = "Freeze Trade"
freeze.BackgroundColor3 = Color3.fromRGB(40,40,40)
freeze.TextColor3 = Color3.new(1,1,1)

local corner2 = Instance.new("UICorner")
corner2.Parent = freeze

-- BOTÃO AUTO ACCEPT
local accept = Instance.new("TextButton")
accept.Parent = frame
accept.Size = UDim2.new(0.8,0,0,30)
accept.Position = UDim2.new(0.1,0,0.7,0)
accept.Text = "Auto Accept"
accept.BackgroundColor3 = Color3.fromRGB(40,40,40)
accept.TextColor3 = Color3.new(1,1,1)

local corner3 = Instance.new("UICorner")
corner3.Parent = accept

-- MARCA DAGUA
local watermark = Instance.new("TextLabel")
watermark.Parent = gui
watermark.AnchorPoint = Vector2.new(0.5,0.5)
watermark.Position = UDim2.new(0.5,0,0.5,0)
watermark.Size = UDim2.new(0,400,0,120)
watermark.BackgroundTransparency = 1
watermark.Text = "Desenvolvido por:\nJm Scripts"
watermark.TextTransparency = 0.75
watermark.TextScaled = true
watermark.TextColor3 = Color3.new(1,1,1)

-- AÇÕES VISUAIS
freeze.MouseButton1Click:Connect(function()
	status.Text = "Trade congelada!"
	wait(2)
	status.Text = ""
end)

accept.MouseButton1Click:Connect(function()
	status.Text = "Aceitado Automaticamente!"
	wait(2)
	status.Text = ""
end)
