local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "JmHub"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- FRAME PRINCIPAL
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,300,0,200)
frame.Position = UDim2.new(0.5,-150,0.5,-100)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)

-- BORDA ROXA
local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Color = Color3.fromRGB(170,0,255)
stroke.Thickness = 3

-- TOP BAR
local top = Instance.new("TextLabel")
top.Parent = frame
top.Size = UDim2.new(1,0,0,30)
top.BackgroundColor3 = Color3.fromRGB(35,35,35)
top.Text = "JM Scripts Hub"
top.TextColor3 = Color3.fromRGB(255,255,255)

-- TEXTO DE STATUS
local status = Instance.new("TextLabel")
status.Parent = frame
status.Size = UDim2.new(1,0,0,25)
status.Position = UDim2.new(0,0,0,35)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(255,255,255)
status.Text = ""

-- BOTÃO FREEZE
local freeze = Instance.new("TextButton")
freeze.Parent = frame
freeze.Size = UDim2.new(0.8,0,0,40)
freeze.Position = UDim2.new(0.1,0,0.35,0)
freeze.Text = "Freeze Trade"
freeze.BackgroundColor3 = Color3.fromRGB(60,60,60)
freeze.TextColor3 = Color3.fromRGB(255,255,255)

-- BOTÃO AUTO ACCEPT
local accept = Instance.new("TextButton")
accept.Parent = frame
accept.Size = UDim2.new(0.8,0,0,40)
accept.Position = UDim2.new(0.1,0,0.6,0)
accept.Text = "Auto Accept"
accept.BackgroundColor3 = Color3.fromRGB(60,60,60)
accept.TextColor3 = Color3.fromRGB(255,255,255)

-- MARCA DAGUA
local watermark = Instance.new("TextLabel")
watermark.Parent = gui
watermark.AnchorPoint = Vector2.new(0.5,0.5)
watermark.Position = UDim2.new(0.5,0,0.5,0)
watermark.Size = UDim2.new(0,400,0,100)
watermark.BackgroundTransparency = 1
watermark.Text = "Desenvolvido por:\nJm Scripts"
watermark.TextScaled = true
watermark.TextTransparency = 0.7
watermark.TextColor3 = Color3.fromRGB(255,255,255)

-- FUNÇÕES VISUAIS
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

-- GUI ARRASTÁVEL
local UIS = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

top.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
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
