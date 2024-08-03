return function(playername)
	local bindable = Instance.new("BindableFunction")
	local ts = game:GetService("TweenService")
	local accepted = false
	local waitingfor=false

	game:GetService("StarterGui"):SetCore("ResetButtonCallback", false)

	local player = game.Players:FindFirstChild(playername)
	if player then
		script.Parent = player.PlayerGui
	else
		error("Player not found :(")
	end

	function bindable.OnInvoke(response)
		waitingfor = true
		if response == "Decline" then
			accepted = false
		else
			accepted = true
		end
		wait(0.5)
		if accepted then
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title="Good boy."
				,Text="ain't no party like a diddy party!"
				,Icon="http://www.roblox.com/asset/?id=18507316751"
				,Duration = 3
			} 
			)
		else
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title="You're so done."
				,Text="You didn't accept diddy's request"
				,Icon="http://www.roblox.com/asset/?id=18507316751"
				,Duration = 6
			} 
			)
			local sound = Instance.new("Sound", script)
			sound.Name = "ST"
			sound.SoundId = "rbxassetid://9046435309"
			local decal = Instance.new("Decal", script)
			decal.Texture = "http://www.roblox.com/asset/?id=18507316751"
			ts:Create(game.Lighting, TweenInfo.new(1), {Ambient = Color3.fromRGB(150,0,0), OutdoorAmbient = Color3.fromRGB(150,0,0), Brightness = 0, EnvironmentDiffuseScale = 0, EnvironmentSpecularScale = 0}):Play()
			wait(15)
			sound:Play()
			for _, v in game.Workspace:GetDescendants() do
				if v:IsA("BasePart") or v:IsA("UnionOperation") then
					local fire = Instance.new("Fire", v)
					fire.Size = 30
					fire.Heat= 25
					local d1 = script.Decal:Clone()
					d1.Parent = v
					d1.Face = Enum.NormalId.Top
					local d2 = script.Decal:Clone()
					d2.Parent = v
					d2.Face = Enum.NormalId.Bottom
					local d3 = script.Decal:Clone()
					d3.Parent = v
					d3.Face = Enum.NormalId.Left
					local d4 = script.Decal:Clone()
					d4.Parent = v
					d4.Face = Enum.NormalId.Right
					local d5 = script.Decal:Clone()
					d5.Parent = v
					d5.Face = Enum.NormalId.Front
					local d6 = script.Decal:Clone()
					d5.Parent = v
					d5.Face = Enum.NormalId.Back
				end
			end
			game.Lighting.Sky.SkyboxBk = script.Decal.Texture
			game.Lighting.Sky.SkyboxFt = script.Decal.Texture
			game.Lighting.Sky.SkyboxLf = script.Decal.Texture
			game.Lighting.Sky.SkyboxRt = script.Decal.Texture
			game.Lighting.Sky.SkyboxDn = script.Decal.Texture
			game.Lighting.Sky.SkyboxUp = script.Decal.Texture
			local blur = Instance.new("BlurEffect", game.Lighting)
			blur.Size = 0
			ts:Create(blur, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = 45}):Play()
			local ply = game:GetService("Players").LocalPlayer
			ply.Character:FindFirstChild("Humanoid").WalkSpeed = 0
			ply.Character:FindFirstChild("Humanoid").JumpPower = 0
			workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
			while true do
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title="Why didn't you accept it"
					,Text="Face your punishment"
					,Icon="http://www.roblox.com/asset/?id=18507316751"
					,Duration = 1
				} 
				)
				wait()
			end
		end
	end

	wait(math.random(5,15))
	local button2text = "Decline"
	if script:GetAttribute("onlyaccept") == true then
		button2text = "Accept"
	end
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title="Diddy"
		,Text="has sent you a friend request."
		,Icon="http://www.roblox.com/asset/?id=18507316751"
		,Duration = math.huge
		,Callback = bindable
		,Button1 = "Accept"
		,Button2 = button2text
	} 
	)

	wait(5)

	if waitingfor == false then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title="Diddy does not wait."
			,Text="accept NOW!"
			,Icon="http://www.roblox.com/asset/?id=18507316751"
			,Duration = 3
		} 
		)
	end

	wait(8)
	if waitingfor == false then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title="Do you think diddy is playing?"
			,Text="accept that request now..."
			,Icon="http://www.roblox.com/asset/?id=18507316751"
			,Duration = 3
		} 
		)
	end
	wait(5)
	if waitingfor == false then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title="You have 1 last chance"
			,Text="or else."
			,Duration = 3
		} 
		)
	end
	wait(5)
	if waitingfor == false then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title="5 seconds"
			,Text="..."
			,Duration = 3
		} 
		)
	end
	wait(5)
	if waitingfor == false then
		for i=0, 15 do
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title="You're dead."
				,Text="Run before diddy gets you."
				,Duration = 3
			} 
			)
		end
		wait(5)
		game:GetService("Players").LocalPlayer:Kick("Diddy is going to pay you a visit in 10 minutes")
	end
end
