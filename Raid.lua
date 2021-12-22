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
local vi = game:service'VirtualInputManager'
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
        vi:SendKeyEvent(true, "Q", false, game)
        vi:SendKeyEvent(true, "E", false, game)
        vi:SendKeyEvent(true, "R", false, game)
    end
end)
function swing()
    game:GetService("ReplicatedStorage").Events.attack:FireServer("Slash")
    game:GetService("ReplicatedStorage").Events.attack:FireServer("T") 
    game:GetService("ReplicatedStorage").Events.attack:FireServer("E")
end
pcall(function()
    while _G.x do wait()
        for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
            repeat wait(.1)
                togNoclip()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame* CFrame.new(0,-9,0)* CFrame.Angles(math.rad(90), 0, 0)
                swing()
            until _G.x == false or v.Humanoid.health == 0 or not v
        end
        local args = {
                        [1] = "Sell",
                        [2] = {
                            [1] = {
                                [1] = "21"
                            },
                            [2] = {
                                [1] = "21"
                            }
                        }
                    }
                    local args3 = {
                        [1] = "Sell",
                        [2] = {
                            [1] = {
                                [1] = "22"
                            }
                        }
                    }
                    game:GetService("ReplicatedStorage").Events.drink:FireServer()
                    wait(1)
                    game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
                    wait(1)
                    game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args3))
    end
end)
