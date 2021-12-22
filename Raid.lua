repeat wait() until game:IsLoaded()
wait(10)
syn.queue_on_teleport([[loadstring(game:HttpGet('https://raw.githubusercontent.com/Rynkana1478/test/main/Raid.lua'))()]])
_G.x = true
_G.NoCIP = _G.x
setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
setfflag("CrashPadUploadToBacktraceToBacktraceBaseUrl", "")
setfflag("CrashUploadToBacktracePercentage", "0")
setfflag("CrashUploadToBacktraceBlackholeToken", "")
setfflag("CrashUploadToBacktraceWindowsPlayerToken", "")
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
spawn(function()
    while _G.x do wait(1)
        local args = {
            [1] = "Skill",
            [2] = "Skill1",
            [3] = ""
        }
        local args1 = {
            [1] = "Skill",
            [2] = "Skill2",
            [3] = "Attack"
        }

        game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args))
        wait(1)
        game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args1))
    end
end)
pcall(function()
    while _G.x do wait()
        for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
            repeat wait(.1)
                togNoclip()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame* CFrame.new(0,-9,0)* CFrame.Angles(math.rad(90), 0, 0)
                game:GetService("ReplicatedStorage").Events.attack:FireServer("Slash")
            until _G.x == false or v.Humanoid.health == 0
        end
    end
end)
