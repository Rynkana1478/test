repeat wait() until game:IsLoaded()
for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
        repeat wait() until v
end
_G.x = true
_G.NoCIP = _G.x
syn.queue_on_teleport([[loadstring(game:HttpGet('https://raw.githubusercontent.com/Rynkana1478/test/main/Raid.lua'))()]])
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
function swing()
    game:GetService("ReplicatedStorage").Events.attack:FireServer("Slash")
    game:GetService("ReplicatedStorage").Events.attack:FireServer("T") 
    game:GetService("ReplicatedStorage").Events.attack:FireServer("E")
end
function totarget(Part,range)
    local y = range + Part.Size.Y/2
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Part.CFrame* CFrame.new(0,-y,0)*CFrame.Angles(math.rad(90),0,0)
end
function farm()
    for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
        if not v:FindFirstChild('Immune') then 
                        pcall(function()
            repeat wait(.1)
                totarget(v.hitbox,3)
                togNoclip()
                swing()
                vi:SendKeyEvent(true, "Q", false, game)
                vi:SendKeyEvent(true, "E", false, game)
                vi:SendKeyEvent(true, "R", false, game)
            until _G.x == false or v.Humanoid.health == 0 or v:FindFirstChild('Immune')
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame* CFrame.new(0,55,0)*CFrame.Angles(math.rad(0),0,0)
        end)
                        end
        game:GetService("ReplicatedStorage").Events.drink:FireServer()
        local args = {
            [1] = "Open",
            [2] = "6666"
        }
        game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
        local args = {
            [1] = "Sell",
            [2] = {
                [1] = {
                    [1] = "96"
                },
                [2] = {
                    [1] = "95"
                },
                [3] = {
                    [1] = "93"
                },
                [4] = {
                    [1] = "88"
                },
                [5] = {
                    [1] = "94"
                },
                [6] = {
                    [1] = "86"
                }
            }
        }
        game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))
    end
end
while wait() do 
        farm()
        wait(1)
end
