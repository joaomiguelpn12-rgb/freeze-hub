local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false

-- FRAME PRINCIPAL
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,190,0,120)
frame.Position = UDim2.new(0.5,-95,0.5,-60)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)

local corner = Instance.new("UICorner",frame)
corner.CornerRadius = UDim.new(0,12)

-- BORDA AMARELA (igual da imagem)
local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Color = Color3.fromRGB(255,200,0)
stroke.Thickness = 2

-- BORDA ROXA EXTRA
local stroke2 = Instance.new("UIStroke")
stroke2.Parent = frame
stroke2.Color = Color3.fromRGB(160,0,255)
stroke2.Thickness = 4
stroke2.Transparency = 0.5

-- TITULO
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "Freeze Hub"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true

-- STATUS
local status = Instance.new("TextLabel")
status.Parent = frame
status.Size = UDim2.new(1,0,0,18)
status.Position = UDim2.new(0,0,0,25)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255,255,255)
status.TextScaled = true

-- BOTÃO FREEZE
local freeze = Instance.new("TextButton")
freeze.Parent = frame
freeze.Size = UDim2.new(0.8,0,0,30)
freeze.Position = UDim2.new(0.1,0,0.4,0)
freeze.BackgroundColor3 = Color3.fromRGB(50,50,50)
freeze.Text = "Freeze Trade"
freeze.TextColor3 = Color3.new(1,1,1)

local fcorner = Instance.new("UICorner",freeze)
fcorner.CornerRadius = UDim.new(0,10)

-- BOTÃO AUTO ACCEPT
local accept = Instance.new("TextButton")
accept.Parent = frame
accept.Size = UDim2.new(0.8,0,0,30)
accept.Position = UDim2.new(0.1,0,0.7,0)
accept.BackgroundColor3 = Color3.fromRGB(50,50,50)
accept.Text = "Auto Accept"
accept.TextColor3 = Color3.new(1,1,1)

local acorner = Instance.new("UICorner",accept)
acorner.CornerRadius = UDim.new(0,10)

-- BOTAO FECHAR
local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(0,20,0,20)
close.Position = UDim2.new(1,-22,0,2)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(70,0,0)
close.TextColor3 = Color3.new(1,1,1)

local ccorner = Instance.new("UICorner",close)

-- BOLINHA REABRIR
local open = Instance.new("TextButton")
open.Parent = gui
open.Size = UDim2.new(0,40,0,40)
open.Position = UDim2.new(1,-50,0.5,-20)
open.BackgroundColor3 = Color3.fromRGB(160,0,255)
open.Visible = false
open.Text = ""

local ocorner = Instance.new("UICorner",open)
ocorner.CornerRadius = UDim.new(1,0)

-- MARCA DAGUA
local watermark = Instance.new("TextLabel")
watermark.Parent = gui
watermark.AnchorPoint = Vector2.new(0.5,0.5)
watermark.Position = UDim2.new(0.5,0,0.5,0)
watermark.Size = UDim2.new(0,400,0,120)
watermark.BackgroundTransparency = 1
watermark.Text = "Desenvolvido por:\nJm Scripts"
watermark.TextScaled = true
watermark.TextTransparency = 0.8
watermark.TextColor3 = Color3.new(1,1,1)

-- FUNÇÕES
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

-- ARRASTAR
local UIS = game:GetService("UserInputService")
local drag = false
local start
local pos

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		drag = true
		start = input.Position
		pos = frame.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - start
		frame.Position = UDim2.new(
			pos.X.Scale,
			pos.X.Offset + delta.X,
			pos.Y.Scale,
			pos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		drag = false
	end
end)
