local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false
gui.Name = "FreezeHubJM"

-- FRAME
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,190,0,115)
frame.Position = UDim2.new(0.5,-95,0.5,-55)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)

local corner = Instance.new("UICorner",frame)
corner.CornerRadius = UDim.new(0,12)

-- BORDA DOURADA
local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Color = Color3.fromRGB(255,200,0)
stroke.Thickness = 2

-- BORDA ROXA
local stroke2 = Instance.new("UIStroke")
stroke2.Parent = frame
stroke2.Color = Color3.fromRGB(150,0,255)
stroke2.Thickness = 4
stroke2.Transparency = 0.5

-- TITULO
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,25)
title.BackgroundTransparency = 1
title.Text = "Freeze Hub"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- STATUS
local status = Instance.new("TextLabel")
status.Parent = frame
status.Size = UDim2.new(1,0,0,15)
status.Position = UDim2.new(0,0,0,22)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.new(1,1,1)
status.TextSize = 12

-- BOTÃO FREEZE
local freeze = Instance.new("TextButton")
freeze.Parent = frame
freeze.Size = UDim2.new(0.8,0,0,28)
freeze.Position = UDim2.new(0.1,0,0.38,0)
freeze.BackgroundColor3 = Color3.fromRGB(50,50,50)
freeze.Text = "Freeze Trade"
freeze.TextColor3 = Color3.new(1,1,1)
freeze.Font = Enum.Font.Gotham
freeze.TextSize = 14

local fcorner = Instance.new("UICorner",freeze)
fcorner.CornerRadius = UDim.new(0,10)

-- BOTÃO ACCEPT
local accept = Instance.new("TextButton")
accept.Parent = frame
accept.Size = UDim2.new(0.8,0,0,28)
accept.Position = UDim2.new(0.1,0,0.68,0)
accept.BackgroundColor3 = Color3.fromRGB(50,50,50)
accept.Text = "Auto Accept"
accept.TextColor3 = Color3.new(1,1,1)
accept.Font = Enum.Font.Gotham
accept.TextSize = 14

local acorner = Instance.new("UICorner",accept)
acorner.CornerRadius = UDim.new(0,10)

-- BOTÃO FECHAR
local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(0,18,0,18)
close.Position = UDim2.new(1,-20,0,3)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(70,0,0)
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextSize = 12

local ccorner = Instance.new("UICorner",close)

-- BOLINHA
local open = Instance.new("TextButton")
open.Parent = gui
open.Size = UDim2.new(0,40,0,40)
open.Position = UDim2.new(1,-50,0.5,-20)
open.BackgroundColor3 = Color3.fromRGB(150,0,255)
open.Text = ""
open.Visible = false

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

-- FUNÇÕES BOTÕES
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

-- FECHAR
close.MouseButton1Click:Connect(function()
	frame.Visible = false
	open.Visible = true
end)

-- ANIMAÇÃO ABRIR
open.MouseButton1Click:Connect(function()

	frame.Size = UDim2.new(0,0,0,0)
	frame.Visible = true
	open.Visible = false

	local tween = TweenService:Create(
		frame,
		TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
		{Size = UDim2.new(0,190,0,115)}
	)

	tween:Play()
end)

-- DRAG
local dragging = false
local dragStart
local startPos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then

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
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)
