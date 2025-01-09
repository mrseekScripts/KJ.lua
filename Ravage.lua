local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    local Debris = game:GetService("Debris")
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local ReplicatedFirst = game:GetService("ReplicatedFirst")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    
    local Thrown = workspace.Thrown
    local Replication = ReplicatedStorage.Replication
    
    local character = game.Players.LocalPlayer.Character
        local PrimaryPart = character.PrimaryPart
        local Humanoid = character.Humanoid
    
        for i,v in pairs(Humanoid:GetPlayingAnimationTracks()) do
            v:Stop()
        end
    
        local attacking = Instance.new("Accessory", character)
        attacking.Name = "attacking"
    
        local Freeze = Instance.new("Accessory", character)
        Freeze.Name = "Freeze"
        Freeze:SetAttribute("NoStop", true)
    
        local RavageStart = Instance.new("Animation")
    RavageStart.AnimationId = "rbxassetid://16945573694"
        local RavageStartTrack = Humanoid:LoadAnimation(RavageStart)
        RavageStart.AnimationId = "rbxassetid://0"
        RavageStartTrack:Play()
        RavageStartTrack:AdjustSpeed(1)
    local erm = shared.sfx({
        SoundId = "rbxassetid://16945495411",
        Volume = 1,
        Parent = character.Torso
    })
      erm:Resume()  
    
        local Hitted = nil
        local HitboxSize = Vector3.new(10, 10, 10)
    
        RavageStartTrack:GetMarkerReachedSignal("Hitbox"):Connect(function()
            local Hitbox = Instance.new("Part")
            Hitbox.Size = Vector3.new(5, 5, 5)
            Hitbox.CanCollide = false
            Hitbox.Transparency = 1
            Hitbox.Anchored = false
            Hitbox.Parent = workspace.Thrown
            Hitbox.Massless = true
            local weld = Instance.new("Weld", workspace.Thrown)
            weld.Part0 = Hitbox
            weld.Part1 = PrimaryPart
            Debris:AddItem(Hitbox, 5)
            Debris:AddItem(weld, 5)
            spawn(function()
            wait(0.5)
                Hitbox:Destroy()
                weld:Destroy()
            end)
    
            local hasHit = false
            Hitbox.Touched:Connect(function(hit)
                if Hitted ~= nil or hasHit then return end
                hasHit = true
                if hit.Parent and hit.Parent:FindFirstChild("Humanoid") and hit.Parent ~= character then
                    local fakeHitted = hit.Parent
                    Hitted = fakeHitted:Clone()
                    if Hitted:FindFirstChild("AbsoluteImmortal") then
                        return
                    end
                    if not Hitted:FindFirstChild("Humanoid") then
                        return
                    end
                    Hitted:SetAttribute('Ragdolled', false)
    
                    Hitbox:Destroy()
    Hitted.Parent = workspace.Live
    Hitted.PrimaryPart.CFrame = fakeHitted.PrimaryPart.CFrame
                    local HPrimaryPart = Hitted.PrimaryPart
                    local HHumanoid = Hitted.Humanoid
    PrimaryPart.Anchored = true
    local PAW = shared.sfx({
        SoundId = "rbxassetid://16945517708",
        Volume = 1,
        Parent = character.PrimaryPart
    })
    PAW:Resume() 
    local AIR = shared.sfx({
        SoundId = "rbxassetid://16945691441",
        Volume = 1,
        Parent = character.PrimaryPart
    })
    AIR:Resume() 
    local AIR2 = shared.sfx({
        SoundId = "rbxassetid://16945593216",
        Volume = 1,
        Parent = character.PrimaryPart
    })
    AIR2:Resume() 
                    Humanoid.AutoRotate = false
                    HHumanoid.AutoRotate = false
    
                    PrimaryPart.Anchored = true
                    spawn(function()
                        wait(.1)
                        HPrimaryPart.Anchored = true
                    end)
    
                    spawn(function()
                        local targetCFrame = PrimaryPart.CFrame * CFrame.new(0, 0, -2.15) * CFrame.Angles(0, math.rad(180), 0)
                        local alpha = 0.2
    
                        while (HPrimaryPart.CFrame.Position - targetCFrame.Position).Magnitude > 0.1 do
                            HPrimaryPart.CFrame = HPrimaryPart.CFrame:Lerp(targetCFrame, alpha)
                            wait(0)
                        end
                    end)
    
                    local RavageLanded = Instance.new("Animation")
                    RavageLanded.AnimationId = "rbxassetid://16945550029"
                    local RavageLandedTrack = Humanoid:LoadAnimation(RavageLanded)
                     RavageLanded.AnimationId = "rbxassetid://0"
                    RavageLandedTrack:Play()
                    RavageStartTrack:Stop()
    
                    local RavageVictim = Instance.new("Animation")
                     RavageVictim.AnimationId = "rbxassetid://16945557433"      
                    local RavageVictimTrack = HHumanoid:LoadAnimation(RavageVictim)
                     RavageVictim.AnimationId = "rbxassetid://0"     
                    RavageVictimTrack:Play()
    
                    RavageLandedTrack:AdjustSpeed(1)
                    RavageVictimTrack:AdjustSpeed(1)
    
    
    
                    
    
                    shared.repfire({
                        Effect = "KJJumpBack", 
                        Character = character
                    })
    
                    
    
                    local count = 0
    
                    RavageLandedTrack:GetMarkerReachedSignal("BodyStrike"):Connect(function()
                        HHumanoid:TakeDamage(0.15)
                        if count < 2 then
                            count += 1
                            
    
                            
                            
                            shared.repfire({
                                Effect = "KJPunch",
                                Character = character,
                                Start = HPrimaryPart.CFrame * CFrame.Angles(0, 0, math.rad(180)), 
                                MeshImpactOffset = Hitted.Torso.CFrame * CFrame.Angles(0, 0, math.rad(180)), 
                                DustOffset = PrimaryPart.CFrame
                            })
                            HHumanoid:TakeDamage(4)
                        end
                    end)
    
    
                        RavageLandedTrack:GetMarkerReachedSignal("BarageStart"):Connect(function()					
                            local barrage = ReplicatedStorage.Resources.KJEffects.barrage:Clone()
                            barrage.Parent = workspace.Thrown
                            barrage.CFrame = Hitted.Torso.CFrame
                            barrage.Anchored = false
    
                            local weld1 = Instance.new("ManualWeld",workspace.Thrown)
                            weld1.Part0 = Hitted.Torso
                            weld1.Part1 = barrage
                            weld1.C0 = CFrame.new(0,-0.5,0.5) * CFrame.Angles(35,math.rad(0),50)
    
                            for i, v in barrage:GetDescendants() do
                                if v:IsA("ParticleEmitter") then
                                    v.Enabled = true
                                end
                            end
                            wait(1.2)
    
                            for i, v in barrage:GetDescendants() do
                                if v:IsA("ParticleEmitter") then
                                    v.Enabled = false
                                end
                            end
    
                            wait(2)
                            barrage:Destroy()
                            weld1:Destroy()
                        end)
    
                        RavageLandedTrack:GetMarkerReachedSignal("Uppercut"):Connect(function()
                        
                            
                            shared.repfire({
                                Effect = "KJUppercut",
                                Character = character,
                                CF = HPrimaryPart.CFrame,
                                ShowaveCF = HPrimaryPart.CFrame * CFrame.new(0, 8, 0) * CFrame.Angles(0, 0, math.rad(90))
                            })
    HHumanoid:TakeDamage(3.25)
                        
                        end)
    
                        RavageLandedTrack:GetMarkerReachedSignal("DoSpin"):Connect(function()
                            
    
                            shared.repfire({
                                Effect = "KJSpin",
                                Character = character,
                                SpinParticlesOffset = PrimaryPart.CFrame,
                                BeamOffset = PrimaryPart.CFrame * CFrame.new(0, -2, 13.5)
                            })
                        end)
                        
                        spawn(function()
                            wait(4.34)
                            local LegLef = ReplicatedStorage.Resources.KJEffects["Left Leg"]:Clone()
                            LegLef.Parent = Thrown
                            LegLef.Transparency = 1
                            LegLef.CFrame = character["Left Leg"].CFrame
    
                            local LegLefweld = Instance.new("Weld", workspace)
                            LegLefweld.Part0 = LegLef
                            LegLefweld.Part1 = character["Left Leg"]
                            Debris:AddItem(LegLefweld, 0.7)
                            Debris:AddItem(LegLef, 0.7)
                        end)
    
                        RavageLandedTrack:GetMarkerReachedSignal("KickImpact"):Connect(function()
                            
                            
                            shared.repfire({
                                Effect = "KJKick",
                                Character = character,
                                ParticleOffset = HPrimaryPart.CFrame, 
                                MeshOffset = PrimaryPart.CFrame * CFrame.Angles(0, math.rad(-90), 0)
                            })
                            local BOOM = shared.sfx({
                                SoundId = "rbxassetid://16945723339",
                                Volume = 1,
                                Parent = character.PrimaryPart
                            })
                            BOOM:Resume() 
    HHumanoid:TakeDamage(6)
                        
                        end)
    
                        RavageLandedTrack:GetMarkerReachedSignal("Kick"):Connect(function()						
                            HHumanoid:TakeDamage(3.5)
    
                            
                            PrimaryPart.Anchored = false
                            HPrimaryPart.Anchored = false
    
                            Humanoid.AutoRotate = true
                            HHumanoid.AutoRotate = true
    
    
    
                            local BodyV = Instance.new("BodyVelocity", HPrimaryPart)
                            BodyV.MaxForce = Vector3.new(1, 1, 1) * 100_000_000
                            if Hitted.Humanoid.Health < 15 or Hitted.Humanoid.Health == 15 then
                                BodyV.Velocity = Humanoid.RootPart.CFrame.LookVector * 300 + Humanoid.RootPart.CFrame.UpVector * 100
                                shared.repfire({
                                    Effect = "Wall Collision", 
                                    root = Hitted.PrimaryPart, 
                                    NoCrater = "skysnatcher",
                                    nosound = false, 
                                    stronger = 100,
                                    Seed = math.random(100,500)
                                })
                                
                                Hitted.Humanoid.Health = 0
                                
                                
                            else
                                
                                BodyV.Velocity = Humanoid.RootPart.CFrame.LookVector * 55 + Humanoid.RootPart.CFrame.UpVector * 30
                            end
                            Debris:AddItem(BodyV, 0.1)
    
                            if attacking and Freeze then
                                attacking:Destroy()
                                Freeze:Destroy()
                                PrimaryPart.Anchored = false
                                wait(0.5)
                                Hitted:Destroy()
                            end
                        end)
                    end
                end)
        
        
    
    
        RavageStartTrack.Ended:Connect(function()
            attacking:Destroy()
            Freeze:Destroy()
            PrimaryPart.Anchored = false
        end)
    end)
