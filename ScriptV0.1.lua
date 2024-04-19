-- Gui to Lua
-- Version: 3.2

-- Instances:

local Cheat = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local DragFrame = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local TextButton = Instance.new("TextButton")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

--Properties:

Cheat.Name = "Cheat"
Cheat.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Cheat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Cheat
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.250
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.435937494, 0, 0.471733093, 0)
Frame.Size = UDim2.new(0.28321144, 0, 0.277542174, 0)

UICorner.CornerRadius = UDim.new(0.00999999978, 8)
UICorner.Parent = Frame

DragFrame.Name = "DragFrame"
DragFrame.Parent = Cheat
DragFrame.AnchorPoint = Vector2.new(0.5, 0.5)
DragFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DragFrame.BackgroundTransparency = 0.200
DragFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
DragFrame.BorderSizePixel = 0
DragFrame.Position = UDim2.new(0.435937494, 0, 0.354958296, 0)
DragFrame.Size = UDim2.new(0.28321144, 0, 0.0447617881, 0)

UICorner_2.CornerRadius = UDim.new(0.0799999982, 8)
UICorner_2.Parent = DragFrame

TextLabel.Parent = DragFrame
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.288727134, 0, 0.517620087, 0)
TextLabel.Size = UDim2.new(0.552872777, 0, 1.03524017, 0)
TextLabel.Font = Enum.Font.Oswald
TextLabel.Text = "Blox Fruits Hub v0.1"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 37.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint.Parent = TextLabel
UITextSizeConstraint.MaxTextSize = 37

TextButton.Parent = DragFrame
TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.945259571, 0, 0.517620087, 0)
TextButton.Size = UDim2.new(0.105074175, 0, 1.03524017, 0)
TextButton.Font = Enum.Font.Arial
TextButton.Text = "X"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 36.000
TextButton.TextWrapped = true

UITextSizeConstraint_2.Parent = TextButton
UITextSizeConstraint_2.MaxTextSize = 36

UIAspectRatioConstraint.Parent = Cheat
UIAspectRatioConstraint.AspectRatio = 1.779

-- Scripts:

local function FVRW_fake_script() -- Cheat.DragScript 
	local script = Instance.new('LocalScript', Cheat)

	--Not made by me, check out this video: https://www.youtube.com/watch?v=z25nyNBG7Js&t=22s
	--Put this inside of your Frame and configure the speed if you would like.
	--Enjoy! Credits go to: https://www.youtube.com/watch?v=z25nyNBG7Js&t=22s
	
	local UIS = game:GetService('UserInputService')
	local frame = script.Parent.DragFrame
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	
end
coroutine.wrap(FVRW_fake_script)()
local function CANA_fake_script() -- TextButton.Close 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(CANA_fake_script)()
