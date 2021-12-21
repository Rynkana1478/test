repeat wait() until game:IsLoaded()
wait(10)
if not game.PlaceId == 2990100290 then
syn.queue_on_teleport([[loadstring(game:HttpGet('https://raw.githubusercontent.com/Rynkana1478/test/main/Raid.lua'))()]])
setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
setfflag("CrashPadUploadToBacktraceToBacktraceBaseUrl", "")
setfflag("CrashUploadToBacktracePercentage", "0")
setfflag("CrashUploadToBacktraceBlackholeToken", "")
setfflag("CrashUploadToBacktraceWindowsPlayerToken", "")
_G.x = true
function noclip()
    local hmn = game.Players.LocalPlayer.Character.Humanoid
    _G.a = game:GetService("RunService").RenderStepped:connect(function()
        if _G.x then
                hmn:ChangeState(11)
        else
            _G.a:Disconnect()
        end
    end)
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
                noclip()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame* CFrame.new(0,-15,0)* CFrame.Angles(math.rad(90), 0, 0)
                game:GetService("ReplicatedStorage").Events.attack:FireServer("Slash")
            until _G.x == false or v.Humanoid.health == 0
            if type(v) == nil then
                game:GetService("ReplicatedStorage").Events.drink:FireServer()
            end
        end
    end

end)
end
