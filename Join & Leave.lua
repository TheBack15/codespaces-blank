local activeBillboards = {}
local highest = 0
local p = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
local join = game:GetService("Players").PlayerAdded
local leave = game:GetService("Players").PlayerRemoving
local screen = Instance.new("ScreenGui", p.PlayerGui)
local kill = false
local frame = Instance.new("Frame", screen)
local button = Instance.new("TextButton", frame)
local drag = Instance.new("UIDragDetector", frame)
local shockwaveFolder = Instance.new("Folder")
shockwaveFolder.Parent = workspace
shockwaveFolder.Name = "shockwaveFolder"
frame.Position = UDim2.fromScale(0.83,0.748)
frame.Size = UDim2.fromScale(0.037,0.07)
frame.Transparency = 0.75
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
button.Position = UDim2.fromScale(0.5, 0.5)
button.AnchorPoint = Vector2.new(0.5, 0.5)
button.Size = UDim2.fromScale(0.75, 0.75)
button.BackgroundColor3 = Color3.fromRGB(127.5,0,0)
button.BackgroundTransparency = 0.75
button.Text = "DESTROY"
button.MouseButton1Click:Connect(function()
	for _, v in ipairs(activeBillboards[p.Name]) do
		v:Destroy()
	end	
	kill = true
	activeBillboards = nil
	p = nil
	join = nil
	leave = nil
	screen:Destroy()
	tweenService:Destroy()
	highest = nil
	join:Wait(nil)
	leave:Wait(nil)
end)

for _, v in ipairs(game:GetService("Players"):GetChildren()) do
	if v.Name ~= "BitManipulator" and v.ClassName == "Player" then
		if v.Character then
			local keepBill = Instance.new("BillboardGui", v.Character:WaitForChild("Head"), 30)
			local ageText = Instance.new("TextLabel", keepBill)
			local rarityText = Instance.new("TextLabel", keepBill)

			keepBill.Size = UDim2.fromScale(4,0.83333)
			keepBill.AlwaysOnTop = true
			keepBill.Adornee = v.Character.Head
			keepBill.StudsOffset = Vector3.new(0,3,0)

			rarityText.BackgroundTransparency = 1
			rarityText.AnchorPoint = Vector2.new(0.5,0)
			rarityText.Position = UDim2.fromScale(0.5,0)
			rarityText.Size = UDim2.fromScale(1,0.5)
			rarityText.Font = Enum.Font.Arimo
			rarityText.TextColor3 = Color3.fromRGB(255,255,255)
			rarityText.TextScaled = true
			local rand = 100 / (math.random()*100)
			rand = string.format("%.3f", rand)
			rarityText.Text = "1 in " .. rand

			ageText.BackgroundTransparency = 1
			ageText.AnchorPoint = Vector2.new(0.5,1)
			ageText.Position = UDim2.fromScale(0.5,1)
			ageText.Size = UDim2.fromScale(1,0.5)
			ageText.Font = Enum.Font.Arimo
			ageText.TextColor3 = Color3.fromRGB(255,255,255)
			ageText.TextScaled = true
			ageText.Name = "Age"
			local function daysToYMD(days)
				local years = math.floor(days / 365)
				days = days % 365
				local months = math.floor(days / 30)
				local remainingDays = days % 30

				return string.format("%dy %dm %dd", years, months, remainingDays)
			end
			local accountAge = v.AccountAge
			local ageString = daysToYMD(accountAge)
			ageText.Text = ageString

			local gradient = Instance.new("UIGradient", rarityText) 
			gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(163, 163, 163)), ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))}
			gradient.Rotation = 90
			local stroke = Instance.new("UIStroke", rarityText)
			stroke.Thickness = 3
			stroke.Color = Color3.fromRGB(rand * (255 / 1000),0,0)

			local gradient = Instance.new("UIGradient", ageText)
			gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(163, 163, 163)), ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))}
			gradient.Rotation = 90
			local stroke1 = Instance.new("UIStroke", ageText)
			stroke1.Thickness = 3
			stroke1.Color = Color3.fromRGB(v.AccountAge * (255 / 6789),0,0)
			
		end
	end
end
if join then
	while kill == true do
		task.wait()
		break
	end
	join:Connect(function(player)
		local rand = 100 / (math.random()*100)
		local function joinEffect()
			local highlight = Instance.new("Highlight")
			if player.Character then
				highlight.Parent = player.Character
				highlight.FillColor = player.Character:WaitForChild("Body Colors").TorsoColor3
			end
			local function keepBill()
				local keepBill = Instance.new("BillboardGui", player.Character:WaitForChild("Head"))
				local ageText = Instance.new("TextLabel", keepBill)
				local rarityText = Instance.new("TextLabel", keepBill)

				keepBill.Size = UDim2.fromScale(4,0.83333)
				keepBill.AlwaysOnTop = true
				keepBill.Adornee = player.Character:WaitForChild("Head")
				keepBill.StudsOffset = Vector3.new(0,3,0)

				rarityText.BackgroundTransparency = 1
				rarityText.AnchorPoint = Vector2.new(0.5,0)
				rarityText.Position = UDim2.fromScale(0.5,0)
				rarityText.Size = UDim2.fromScale(1,0.5)
				rarityText.Font = Enum.Font.Arimo
				rarityText.TextColor3 = Color3.fromRGB(255,255,255)
				rarityText.TextScaled = true
				rarityText.Text = "1 in " .. rand
				rarityText.Name = "Rarity"

				ageText.BackgroundTransparency = 1
				ageText.AnchorPoint = Vector2.new(0.5,1)
				ageText.Position = UDim2.fromScale(0.5,1)
				ageText.Size = UDim2.fromScale(1,0.5)
				ageText.Font = Enum.Font.Arimo
				ageText.TextColor3 = Color3.fromRGB(255,255,255)
				ageText.TextScaled = true
				ageText.Name = "Age"
				local function daysToYMD(days)
					local years = math.floor(days / 365)
					days = days % 365
					local months = math.floor(days / 30)
					local remainingDays = days % 30

					return string.format("%dy %dm %dd", years, months, remainingDays)
				end
				local accountAge = player.AccountAge
				local ageString = daysToYMD(accountAge)
				ageText.Text = ageString

				local gradient = Instance.new("UIGradient", rarityText)
				gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(163, 163, 163)), ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))}
				gradient.Rotation = 90
				local stroke = Instance.new("UIStroke", rarityText)
				stroke.Thickness = 3
				stroke.Color = Color3.fromRGB(rand * (255 / 1000),0,0)

				local gradient = Instance.new("UIGradient", ageText)
				gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(163, 163, 163)), ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))}
				gradient.Rotation = 90
				local stroke1 = Instance.new("UIStroke", ageText)
				stroke1.Thickness = 3
				stroke1.Color = Color3.fromRGB(player.AccountAge * (255 / 6789),0,0)
			end
			keepBill()
			player.Character:FindFirstChildOfClass("Humanoid").Died:Connect(function()
				keepBill()
			end)
			highlight.OutlineTransparency = 1
			highlight.FillTransparency = 1
			repeat
				task.wait()
				highlight.FillTransparency = highlight.FillTransparency - (5 / player.AccountAge)
				highlight.OutlineTransparency = highlight.OutlineTransparency - (5 / player.AccountAge)
				if highlight.OutlineTransparency <= 0 and highlight.FillTransparency <= 0 and player.Character then
					spawn(function()
						local shockwave = Instance.new("Part", workspace:WaitForChild("shockwaveFolder"))

						shockwave.Shape = Enum.PartType.Ball
						shockwave.TopSurface = Enum.SurfaceType.Smooth
						shockwave.BottomSurface = Enum.SurfaceType.Smooth
						shockwave.Size = Vector3.new(0.001,0.001,0.001)
						shockwave.Position = player.Character:WaitForChild("HumanoidRootPart").Position
						shockwave.Material = Enum.Material.Neon
						shockwave.Anchored = true
						shockwave.CanCollide = false
						shockwave.Transparency = 0
						shockwave.Color = highlight.FillColor
						shockwave.CastShadow = false
						repeat
							task.wait()
							shockwave.Size = shockwave.Size + Vector3.new(0.1,0.1,0.1)
							shockwave.Transparency = shockwave.Transparency + (5 / player.AccountAge)
							highlight.FillTransparency = highlight.FillTransparency + (50 / player.AccountAge)
							highlight.OutlineTransparency = highlight.OutlineTransparency + (50 / player.AccountAge)
							if highlight.OutlineTransparency >= 1 and highlight.FillTransparency >= 1 then
								highlight:Destroy()
							end
							if shockwave.Transparency >= 1 then
								shockwave:Destroy()
								break
							end
						until shockwave.Transparency >= 1
					end)
				end
			until highlight.FillTransparency >= 1
		end
		player.CharacterAdded:Connect(function()
			joinEffect()
		end)
		local bill = Instance.new("BillboardGui", p.Character.Head)
		local text = Instance.new("TextLabel", bill)
		local text2 = Instance.new("TextLabel", bill)
		local image = Instance.new("ImageLabel", bill)
		local text3 = Instance.new("TextLabel", image)
		activeBillboards[p.Name] = activeBillboards[p.Name] or {}

		local offsetCount = #activeBillboards[p.Name]

		bill.Size = UDim2.fromScale(0,0)
		bill.AlwaysOnTop = true
		bill.Adornee = p.Character.Head
		bill.StudsOffset = Vector3.new(0,1.5 + offsetCount,0)

		image.BackgroundTransparency = 1
		image.Position = UDim2.fromScale(0.105,0.5)
		image.AnchorPoint = Vector2.new(0.5,0.5)
		image.Size = UDim2.fromScale(0.187,0.898)
		image.Image = game:GetService("Players"):GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		image.ScaleType = Enum.ScaleType.Fit

		table.insert(activeBillboards[p.Name], bill)

		local stroke = Instance.new("UIStroke", text)
		stroke.Thickness = 3
		local gradient = Instance.new("UIGradient", text) 
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient.Rotation = 90

		local strokeIM = Instance.new("UIStroke", image)
		strokeIM.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		strokeIM.Color = Color3.fromRGB(player.AccountAge * (255 / 6789),0,0)
		strokeIM.Thickness = 2

		Instance.new("UIStroke", text2).Thickness = 3
		local gradient2 = Instance.new("UIGradient", text2)
		gradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient2.Rotation = 90

		Instance.new("UIStroke", text3).Thickness = 3
		local gradient3 = Instance.new("UIGradient", text3)
		gradient3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(108, 255, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient3.Rotation = 90

		text.BackgroundTransparency = 1
		text.AnchorPoint = Vector2.new(1,1)
		text.Position = UDim2.fromScale(1,1)
		text.Size = UDim2.fromScale(0.7915,0.749)
		text.Font = Enum.Font.Arimo
		text.TextColor3 = Color3.fromRGB(255,255,255)
		text.TextScaled = true

		text2.BackgroundTransparency = 1
		text2.AnchorPoint = Vector2.new(0.5,0)
		text2.Position = UDim2.fromScale(0.5,0)
		text2.Size = UDim2.fromScale(0.5,0.25)
		text2.Font = Enum.Font.Arimo
		text2.TextColor3 = Color3.fromRGB(255,255,255)
		text2.TextScaled = true
		text2.Text = player.DisplayName .. " (" .. "@" .. player.Name .. ")"


		text3.BackgroundTransparency = 1
		text3.Position = UDim2.fromScale(0,0)
		text3.Size = UDim2.fromScale(1,0.125)
		text3.Font = Enum.Font.Arimo
		text3.TextScaled = true
		text3.TextColor3 = Color3.fromRGB(255,255,255)
		local function daysToYMD(days)
			local years = math.floor(days / 365)
			days = days % 365
			local months = math.floor(days / 30)
			local remainingDays = days % 30

			return string.format("%dy %dm %dd", years, months, remainingDays)
		end
		local accountAge = player.AccountAge
		local ageString = daysToYMD(accountAge)
		text3.Text = ageString

		if rand >= 1000 and rand < 10000 then
			local audio = Instance.new("Sound", workspace)
			audio.SoundId = "rbxassetid://6783209805"
			audio:Play()
			audio.Ended:Connect(function()audio:Destroy()end)
		elseif rand >= 10000 then
			local audio = Instance.new("Sound", workspace)
			audio.SoundId = "rbxassetid://243702801"
			audio:Play()
			audio.Ended:Connect(function()audio:Destroy()end)
		end
		rand = string.format("%.3f", rand)
		text.Text = "1 in " .. rand

		local tweenStart = TweenInfo.new(3,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out)
		local properties1 = {Size = UDim2.fromScale(6,1.25)}
		tweenService:Create(bill,tweenStart, properties1):Play()

		wait(5)
		local tweenEnd = TweenInfo.new(3,Enum.EasingStyle.Quart,Enum.EasingDirection.In)
		local properties2 = {Size = UDim2.fromScale(0,0)}
		local play = tweenService:Create(bill,tweenEnd,properties2)
		play:Play()
		play.Completed:Connect(function()
			table.remove(activeBillboards[p.Name], table.find(activeBillboards[p.Name], bill))
			bill:Destroy() 
		end)
	end)
end
----------------------------------------------------------------------------------------------------------------
if leave then
	leave:Connect(function(player)
		local bill = Instance.new("BillboardGui", p.Character.Head)
		local text = Instance.new("TextLabel", bill)
		local text2 = Instance.new("TextLabel", bill)
		local image = Instance.new("ImageLabel", bill)
		local text3 = Instance.new("TextLabel", image)
		activeBillboards[p.Name] = activeBillboards[p.Name] or {}

		local offsetCount = #activeBillboards[p.Name]

		bill.Size = UDim2.fromScale(0,0)
		bill.AlwaysOnTop = true
		bill.Adornee = p.Character.Head
		bill.StudsOffset = Vector3.new(0,1.5 + offsetCount,0)

		image.BackgroundTransparency = 1
		image.Position = UDim2.fromScale(0.105,0.5)
		image.AnchorPoint = Vector2.new(0.5,0.5)
		image.Size = UDim2.fromScale(0.187,0.898)
		image.Image = game:GetService("Players"):GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		image.ScaleType = Enum.ScaleType.Fit

		table.insert(activeBillboards[p.Name], bill)

		local stroke = Instance.new("UIStroke", text)
		stroke.Thickness = 3

		local strokeIM = Instance.new("UIStroke", image)
		strokeIM.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		strokeIM.Color = Color3.fromRGB(player.AccountAge * (255 / 6789),0,0)
		strokeIM.Thickness = 2

		local gradient = Instance.new("UIGradient", text)
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient.Rotation = 90

		Instance.new("UIStroke", text2).Thickness = 3

		local gradient2 = Instance.new("UIGradient", text2)
		gradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient2.Rotation = 90

		Instance.new("UIStroke", text3).Thickness = 2

		local gradient3 = Instance.new("UIGradient", text3)
		gradient3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 108, 108)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))}
		gradient3.Rotation = 90

		text.BackgroundTransparency = 1
		text.AnchorPoint = Vector2.new(1,1)
		text.Position = UDim2.fromScale(1,1)
		text.Size = UDim2.fromScale(0.7915,0.749)
		text.Font = Enum.Font.Arimo
		text.TextColor3 = Color3.fromRGB(255,255,255)
		text.TextScaled = true

		text2.BackgroundTransparency = 1
		text2.AnchorPoint = Vector2.new(0.5,0)
		text2.Position = UDim2.fromScale(0.5,0)
		text2.Size = UDim2.fromScale(0.5,0.25)
		text2.Font = Enum.Font.Arimo
		text2.TextColor3 = Color3.fromRGB(255,255,255)
		text2.TextScaled = true
		text2.Text = player.DisplayName .. " (" .. "@" .. player.Name .. ")"

		text3.BackgroundTransparency = 1
		text3.Position = UDim2.fromScale(0,0)
		text3.Size = UDim2.fromScale(1,0.125)
		text3.Font = Enum.Font.Arimo
		text3.TextColor3 = Color3.fromRGB(255,255,255)
		text3.TextScaled = true
		local function daysToYMD(days)
			local years = math.floor(days / 365)
			days = days % 365
			local months = math.floor(days / 30)
			local remainingDays = days % 30

			return string.format("%dy %dm %dd", years, months, remainingDays)
		end
		local accountAge = player.AccountAge
		local ageString = daysToYMD(accountAge)
		text3.Text = ageString

		local rand = 100 / (math.random()*100)
		if rand >= 1000 and rand < 10000 then
			local audio = Instance.new("Sound", workspace)
			audio.SoundId = "rbxassetid://6783209805"
			audio:Play()
			audio.Ended:Connect(function()audio:Destroy()end)
		elseif rand >= 10000 then
			local audio = Instance.new("Sound", workspace)
			audio.SoundId = "rbxassetid://243702801"
			audio:Play()
			audio.Ended:Connect(function()audio:Destroy()end)
		end
		rand = string.format("%.3f", rand)
		text.Text = "1 in " .. rand

		local tweenStart = TweenInfo.new(3,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out)
		local properties1 = {Size = UDim2.fromScale(6,1.25)}
		tweenService:Create(bill,tweenStart, properties1):Play()

		wait(5)
		local tweenEnd = TweenInfo.new(3,Enum.EasingStyle.Quart,Enum.EasingDirection.In)
		local properties2 = {Size = UDim2.fromScale(0,0)}
		local play = tweenService:Create(bill,tweenEnd,properties2)
		play:Play()
		play.Completed:Connect(function()
			table.remove(activeBillboards[p.Name], table.find(activeBillboards[p.Name], bill))
			bill:Destroy() 
		end)
	end)
end
activeBillboards[p.Name] = activeBillboards[p.Name] or {}
while true do
	wait(0.1)
	if activeBillboards then
		for index, gui in ipairs(activeBillboards[p.Name]) do
			local scroll = TweenInfo.new(5,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out)
			local propertiesSC = {StudsOffset = Vector3.new(0,0.5 + (index * 1.25), 0)}
			tweenService:Create(gui,scroll,propertiesSC):Play()
		end
	end
end




