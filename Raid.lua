repeat wait() until game:IsLoaded()
wait(10)
_G.x = true
_G.NoCIP = _G.x
_G.co = true
if _G.con == true then 
	syn.queue_on_teleport([[loadstring(game:HttpGet('https://raw.githubusercontent.com/Rynkana1478/test/main/Raid.lua'))()]])
	else break
	end
--//Variabl//--
setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
setfflag("CrashPadUploadToBacktraceToBacktraceBaseUrl", "")
setfflag("CrashUploadToBacktracePercentage", "0")
setfflag("CrashUploadToBacktraceBlackholeToken", "")
setfflag("CrashUploadToBacktraceWindowsPlayerToken", "")
local vi = game:service'VirtualInputManager'
local LocalPlayer = game.Players.LocalPlayer
local hrp = LocalPlayer.Character.HumanoidRootPart
--//function//--
local function NoclipLoop()
        if game.Players.LocalPlayer.Character ~= nil and _G.NoCIP == true then
            for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide == true then
                    child.CanCollide = false
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end
        end
end
local togNoclip = function()
if _G.CNOCLIP then
    _G.CNOCLIP:Disconnect()
end
_G.CNOCLIP = game:GetService('RunService').Stepped:Connect(NoclipLoop)
end
local AutoSkill = function()
	coroutine.resume(coroutine.create(function()
		wait(1)
		vi:SendKeyEvent(true, "Q", false, game)
		vi:SendKeyEvent(true, "E", false, game)
		vi:SendKeyEvent(true, "R", false, game)
	end))
end
function swing()
    game:GetService("ReplicatedStorage").Events.attack:FireServer("Slash")
    game:GetService("ReplicatedStorage").Events.attack:FireServer("T") 
    game:GetService("ReplicatedStorage").Events.attack:FireServer("E")
end
--//Main//--
local farm = function()
	for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
		pcall(function()
			repeat wait(.1)
				togNoclip()
				hrp.CFrame = v.HumanoidRootPart.CFrame* CFrame.new(4,0,4)* CFrame.Angles(math.rad(0), math.rad(45), 0)
				swing()
			until _G.x == false or v.Humanoid.health == 0
		end)
	end
end
game.Players.LocalPlayer.CharacterAdded:connect(function()
    wait(1)
	if _G.farm then
		_G.farm:Disconnect()
	end
    _G.farm = game:GetService('RunService').Stepped:Connect(farm)
end)
