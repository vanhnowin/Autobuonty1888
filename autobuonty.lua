_G.AutoFarmBounty = true
AimSkillNearest = true
_G.NoClip = true
_G.AutoRejoin = true

--src

	task.spawn(function()
		while wait() do
			if _G.AutoRejoin then
				_G.AutoRejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
					if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
						game:GetService("TeleportService"):Teleport(game.PlaceId)
					end
				end)
			end
		end
	end)


		spawn(function()
			while task.wait() do
				pcall(function()
					sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
				end)
			end
		end)

		spawn(function()
			while task.wait() do
				pcall(function()
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "SlashTail" then
							v:Destroy()
						end
					end
				end)
			end
		end)

		local CharParts = {}
		game:GetService("RunService").Stepped:connect(function()
			pcall(function()
				if _G.NoClip then
					for i = 1, #CharParts do
						CharParts[i].CanCollide = false
					end
				else
					for i = 1, #CharParts do
						CharParts[i].CanCollide = true
					end
				end
			end)
		end)

		function SetupCharCollide(Char)
			CharParts = {}
			Char:WaitForChild("Head")
			for i, v in pairs(Char:GetChildren()) do
				if v:IsA("BasePart") then
					table.insert(CharParts, v)
				end
			end
		end

		if game.Players.LocalPlayer.Character then
			SetupCharCollide(game.Players.LocalPlayer.Character)
		end
		game.Players.LocalPlayer.CharacterAdded:connect(function(Ch)
			SetupCharCollide(Ch)
		end)

		spawn(function()
			pcall(function()
				local vu = game:GetService("VirtualUser")
				game:GetService("Players").LocalPlayer.Idled:connect(function()
					vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
					task.wait(0.5)
					vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
				end)
			end)
		end)

    function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/310, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        if Distance <= 350 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end

spawn(function()
	while wait(.1) do
		pcall(function()
			local MaxDistance = math.huge
			for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name ~= game.Players.LocalPlayer.Name then
					local Distance = v:DistanceFromCharacter(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
					if Distance < MaxDistance then
						MaxDistance = Distance
						TargetPlayerAim = v.Name
					end
				end
			end
		end)
	end
end)

spawn(function()
	pcall(function()
		game:GetService("RunService").RenderStepped:connect(function()
			if AimSkillNearest and TargetPlayerAim ~= nil and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name]:FindFirstChild("MousePos") then
				local args = {
					[1] = game:GetService("Players"):FindFirstChild(TargetPlayerAim).Character.HumanoidRootPart.Position
				}
				game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(args))
			end
		end)
	end)
end)


spawn(function()
while wait() do
pcall(function()
if _G.AutoFarmBounty then
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
if v:IsA("Shirt") then
v:Destroy()
end
if v:IsA("Pants") then
v:Destroy()
end
if v:IsA("Accessory") then
v:Destroy()
end
end
end
end)
end
end)

spawn(function()
pcall(function()
if _G.AutoFarmBounty then
while wait() do
if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
end
end
end
end)
end)

spawn(function()
while wait() do
pcall(function()
if _G.AutoFarmBounty then
if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
end
end
end)
end
end)

spawn(function()
while task.wait() do
pcall(function()
if _G.AutoFarmBounty then
game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].Cooldown.Value = 0
spawn(function()
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = false
game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = false
game.Players.LocalPlayer.Character.Animate.Disabled = true
end)
end
end)
end
end)
CastlePostoMansion = CFrame.new(-5084.8447265625, 316.48101806641, -3145.3752441406)
MansiontoCastlePos = CFrame.new(-12464.596679688, 376.30590820312, -7567.2626953125)
Castletophydra = CFrame.new(-5095.33984375, 316.48101806641, -3168.3134765625)
HydratoCastle = CFrame.new(5741.869140625, 611.94750976562, -282.61154174805)
spawn(function()
while wait() do
pcall(function()
if _G.AutoFarmBounty then
for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
if v.Name ~= game.Players.LocalPlayer.Name then
if v:WaitForChild("Humanoid").Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 17000 then
plyselecthunthelpold = v.Humanoid.Health
repeat task.wait()
					for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Blox Fruit" then -- "Blox Fruit" , "Sword" , "Wear" , "Agility"
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
NameTarget = v.Name
if tostring(game.Players.LocalPlayer.Team) == "Pirates" then
topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,15))
					game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
			topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,-20))				
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)elseif tostring(game.Players.LocalPlayer.Team) == "Marines" then
if game.Players[NameTarget].Team ~= game.Players.LocalPlayer.Team then
topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,15))
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
                topos(v.HumanoidRootPart.CFrame * CFrame.new(0,20,-20))				
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
wait(.2)
				game:GetService("VirtualInputManager"):SendKeyEvent(true,"V",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"V",false,game)
end
end
spawn(function()
if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 150 then
StartCheckTarget = true
end
end)
v.HumanoidRootPart.CanCollide = false
spawn(function()
pcall(function()
local args = {
[1] = v.HumanoidRootPart.Position,
[2] = v.HumanoidRootPart
}
game:GetService("Players").LocalPlayer.Character[SelectWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
end)
end)
TargetSelectHunt = v.Humanoid
until _G.AutoFarmBounty == false or v.Humanoid.Health == 0 or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or not v.Parent or NextplySelect == true
NextplySelect = false
StartCheckTarget = false
end
end
end
end
end)
end
end)

spawn(function()
pcall(function()
while task.wait() do
if _G.AutoFarmBounty then
game:GetService("Players").LocalPlayer.PlayerGui.Main.InCombat.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.Main.SafeZone.Visible = false
end
end
end)
end)

spawn(function()
pcall(function()
while wait() do
if _G.AutoFarmBounty then
if TargetSelectHunt ~= nil then
if StartCheckTarget then
wait(6.5)
if TargetSelectHunt.Health == TargetSelectHunt.MaxHealth or TargetSelectHunt.Health >= plyselecthunthelpold then
NextplySelect = true
TargetSelectHunt = nil
end
end
end
end
end
end)
end)

spawn(function()
pcall(function()
while wait(.1) do
if _G.AutoFarmBounty then
if game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
end
end
end
end)
end)

spawn(function()
while wait() do
if _G.AutoFarmBounty then
if _G.AutoFarmBounty_Hop then
pcall(function()
wait(120)
Hop()
end)
end
end
end
end)
