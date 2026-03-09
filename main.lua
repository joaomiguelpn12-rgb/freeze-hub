local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false
gui.Name = "Freeze Hub"

-- FRAME PRINCIPAL
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,220,0,140)
frame.Position = UDim2.new(0.5,-110,0.5,-70)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0,12)
frameCorner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Color = Color3.fromRGB(160,0,255)
stroke.Thickness = 3

-- TITULO
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,-30,0,30)
title.Position = UDim2.new(0,10,0,0)
title.BackgroundTransparency = 1
title.Text = "Freeze Hub"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true

-- BOTAO FECHAR
local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(0,25,0,25)
close.Position = UDim2.new(1,-30,0,5)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(60,0,0)
close.TextColor3 = Color3.new(1,1,1)

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0,8)
closeCorner.Parent = close

-- STATUS
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
freeze.BackgroundColor3 = Color3.fromRGB(45,45,45)
freeze.TextColor3 = Color3.new(1,1,1)

local freezeCorner = Instance.new("UICorner")
freezeCorner.CornerRadius = UDim.new(0,10)
freezeCorner.Parent = freeze

-- BOTÃO AUTO ACCEPT
local accept = Instance.new("TextButton")
accept.Parent = frame
accept.Size = UDim2.new(0.8,0,0,30)
accept.Position = UDim2.new(0.1,0,0.7,0)
accept.Text = "Auto Accept"
accept.BackgroundColor3 = Color3.fromRGB(45,45,45)
accept.TextColor3 = Color3.new(1,1,1)

local acceptCorner = Instance.new("UICorner")
acceptCorner.CornerRadius = UDim.new(0,10)
acceptCorner.Parent = accept

-- MARCA DAGUA
local watermark = Instance.new("TextLabel")
watermark.Parent = gui
watermark.AnchorPoint = Vector2.new(0.5,0.5)
watermark.Position = UDim2.new(0.5,0,0.5,0)
watermark.Size = UDim2.new(0,400,0,120)
watermark.BackgroundTransparency = 1
watermark.Text = "Desenvolvido por:\nJm Scripts"
watermark.TextScaled = true
watermark.TextTransparency = 0.75
watermark.TextColor3 = Color3.new(1,1,1)

-- BOTAO REABRIR
local open = Instance.new("TextButton")
open.Parent = gui
open.Size = UDim2.new(0,50,0,50)
open.Position = UDim2.new(1,-60,0.5,-25)
open.Text = ""
open.BackgroundColor3 = Color3.fromRGB(160,0,255)
open.Visible = false

local openCorner = Instance.new("UICorner")
openCorner.CornerRadius = UDim.new(1,0)
openCorner.Parent = open

-- AÇÕES
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

close.MouseButton1Click:Connect(function()
	frame.Visible = false
	open.Visible = true
end)

open.MouseButton1Click:Connect(function()
	frame.Visible = true
	open.Visible = false
end)

-- ARRASTAR GUI
local UIS = game:GetService("UserInputService")
local dragging
local dragStart
local startPos

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)
