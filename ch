local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")

local playerGui = player:WaitForChild("PlayerGui")
local hotbar = playerGui:FindFirstChild("Hotbar")
local backpack = hotbar:FindFirstChild("Backpack")
local hotbarFrame = backpack:FindFirstChild("Hotbar")

local ts = game:GetService("TweenService")

local markgui = Instance.new("ScreenGui", playerGui)
markgui.Name = "gui for watermark"
local watermark = Instance.new("TextLabel", markgui)
watermark.Text = "credits to aggiealledge on discord"
watermark.Size = UDim2.new(0.3, 0, 0.05, 0)
watermark.BackgroundTransparency = 1
watermark.TextTransparency = 0.5
watermark.TextScaled = true

local buttonData = {
    {name = "1", text = "Afterimage Lunge"},
    {name = "2", text = "Chainsaw Kick"},
    {name = "3", text = "Saw Rush"},
    {name = "4", text = "Chain-Whiplash"},
}

for _, data in pairs(buttonData) do
    local baseButton = hotbarFrame:FindFirstChild(data.name).Base
    local ToolName = baseButton.ToolName
    ToolName.Text = data.text
end

hotbarFrame:WaitForChild("3").Base.Reuse.Visible = true
hotbarFrame["3"].Base.Reuse.Text = "1 + 3 VARIANT"
hotbarFrame["3"].Base.Reuse.Reuse.Text = "1 + 3 VARIANT"

hotbarFrame:WaitForChild("2").Base.Reuse.Visible = true
hotbarFrame["2"].Base.Reuse.Text = "AIR VARIANT"
hotbarFrame["2"].Base.Reuse.Reuse.Text = "AIR VARIANT"

local function waitForGui()
    while true do
        local screenGui = playerGui:FindFirstChild("ScreenGui")
        if screenGui then
            local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
            if magicHealthFrame then
                local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
                if textLabel then
                    textLabel.Text = "HERO OF HELL: 「CHAINSAW MAN」"
                end
                local healthBar = magicHealthFrame:FindFirstChild("Health").Bar.Bar
                if healthBar then
                    healthBar.ImageColor3 = Color3.fromRGB(110, 0, 38) 
                end
                return
            end
        end
        wait(1)
    end
end

waitForGui()

local replacementAnimations = {
    --m1
    ["13370310513"] = {id = "rbxassetid://13532562418", speed = 1.0},  
    ["13390230973"] = {id = "rbxassetid://13532600125", speed = 1.0},  
    ["13378751717"] = {id = "rbxassetid://13532604085", speed = 1.0},  
    ["13378708199"] = {id = "rbxassetid://13294471966", speed = 1.0},
    --extras
    ["13377153603"] = {id = "rbxassetid://", speed = 1.0},
    --attacks
    ["13376869471"] = {id = "rbxassetid://12296882427", speed = 0.8},
    ["13309500827"] = {id = "rbxassetid://12296882427", speed = 0.8},
    ["13294790250"] = {id = "rbxassetid://17858997926", speed = 0.8},
    --ult attacks
    ["13723174078"] = {id = "rbxassetid://15334974550", speed = 1.2},
    ["13881335713"] = {id = "rbxassetid://14900168720", speed = 1.7},
}

local function setupstuff()
game.Players.LocalPlayer.Character["#NinjaKATANA"]:Destroy()
game.Players.LocalPlayer.Character.Sheathed:Destroy()

local headpart = Instance.new("Part", character)
headpart.Name = "chainsawhead"
headpart.Size = Vector3.new(1, 1, 1)
headpart.CFrame = character:WaitForChild("Head").CFrame * CFrame.Angles(0, 90, 0)
headpart.Anchored = false
headpart.Massless = true
headpart.CanCollide = false

character.Head.Transparency = 1
character.Head.Mesh.Scale = Vector3.new(0, 0, 0)

local weld = Instance.new("Weld", headpart)
weld.Part0 = character.Head
weld.Part1 = headpart
weld.C0 = CFrame.new(0, 0.9, -0.4) * CFrame.Angles(-0.23, 0, 0)

local mesh = Instance.new("SpecialMesh", headpart)
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://131674786436093"
mesh.TextureId = "rbxassetid://113967554500373"
mesh.Offset = Vector3.new(0, 0, 0)
mesh.Scale = Vector3.new(0.85, 1, 1)

local armpart1 = Instance.new("Part", character)
armpart1.Name = "chainsawleftarm"
armpart1.Size = Vector3.new(1, 1, 1)
armpart1.CFrame = character:WaitForChild("Left Arm").CFrame * CFrame.Angles(0, 90, 0)
armpart1.Anchored = false
armpart1.Massless = true
armpart1.CanCollide = false
local armmesh1 = Instance.new("SpecialMesh", armpart1)
armmesh1.MeshType = Enum.MeshType.FileMesh
armmesh1.MeshId = "rbxassetid://128306184055581"
armmesh1.TextureId = "rbxassetid://125323146593602"
armmesh1.Offset = Vector3.new(0, 0, 0)
armmesh1.Scale = Vector3.new(1, 1.7, 1)
local weld1 = Instance.new("Weld", armpart1)
weld1.Part0 = character["Left Arm"]
weld1.Part1 = armpart1
weld1.C0 = CFrame.new(0, -1, 0)

local armpart2 = Instance.new("Part", character)
armpart2.Name = "chainsawrightarm"
armpart2.Size = Vector3.new(1, 1, 1)
armpart2.CFrame = character:WaitForChild("Right Arm").CFrame * CFrame.Angles(0, 90, 0)
armpart2.Anchored = false
armpart2.Massless = true
armpart2.CanCollide = false
local armmesh2 = Instance.new("SpecialMesh", armpart2)
armmesh2.MeshType = Enum.MeshType.FileMesh
armmesh2.MeshId = "rbxassetid://128306184055581"
armmesh2.TextureId = "rbxassetid://125323146593602"
armmesh2.Offset = Vector3.new(0, 0, 0)
armmesh2.Scale = Vector3.new(1, 1.7, 1)
local weld2 = Instance.new("Weld", armpart2)
weld2.Part0 = character["Right Arm"]
weld2.Part1 = armpart2
weld2.C0 = CFrame.new(0, -1, 0)

for i,v in pairs(character:GetChildren()) do
      if v:IsA("Accessory") then
             for y,b in pairs(v:GetDescendants()) do
                   if b:IsA("Attachment") and b.Name == "HairAttachment" or b.Name == "HatAttachment" then
                         b.Parent.Parent:Destroy()
                   end
             end
      end
end
end

local function sendMessage(text)
    ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
end

local function mangatext(text1, text2)
local Dialogue = Instance.new("BillboardGui")
local Chat1 = Instance.new("Frame")
local Sub1 = Instance.new("TextLabel")

local Dialogue2 = Instance.new("BillboardGui")
local Chat2 = Instance.new("Frame")
local Sub2 = Instance.new("TextLabel")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Dialogue 1 ("KOKUSEN!!") Change Me
Dialogue.Active = true
Dialogue.Size = UDim2.new(15, 0, 15, 0)
Dialogue.StudsOffset = Vector3.new(0, 0, 2)
Dialogue.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Dialogue.Name = "Dialogue"
Dialogue.Parent = humanoidRootPart

Chat1.AnchorPoint = Vector2.new(0.5, 0.5)
Chat1.BackgroundColor3 = Color3.new(1, 1, 1)
Chat1.BorderColor3 = Color3.new(0, 0, 0)
Chat1.BorderSizePixel = 2
Chat1.Position = UDim2.new(0.600000024, 0, -0.2, 0)
Chat1.Size = UDim2.new(0.100000001, 0, 0.200000003, 0)
Chat1.Name = "Chat1"
Chat1.BackgroundTransparency = 1
Chat1.Parent = Dialogue

Sub1.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
Sub1.Text = text1
Sub1.TextColor3 = Color3.new(0, 0, 0)
Sub1.TextScaled = true
Sub1.TextSize = 14
Sub1.TextWrapped = true
Sub1.AnchorPoint = Vector2.new(0.5, 0.5)
Sub1.BackgroundColor3 = Color3.new(1, 1, 1)
Sub1.TextTransparency = 1
Sub1.BorderColor3 = Color3.new(0, 0, 0)
Sub1.BorderSizePixel = 0
Sub1.Position = UDim2.new(0.5, 0, 0.5, 0)
Sub1.Size = UDim2.new(0.850000024, 0, 0.349999994, 0)
Sub1.Name = "Sub1"
Sub1.Parent = Chat1
Sub1.BackgroundTransparency = 1

-- Dialogue 2 ("Yummy") change me
Dialogue2.Active = true
Dialogue2.Size = UDim2.new(15, 0, 15, 0)
Dialogue2.StudsOffset = Vector3.new(0, 0, 2)
Dialogue2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Dialogue2.Name = "Dialogue2"
Dialogue2.Parent = humanoidRootPart

Chat2.AnchorPoint = Vector2.new(0.5, 0.5)
Chat2.BackgroundColor3 = Color3.new(1, 1, 1)
Chat2.BorderColor3 = Color3.new(0, 0, 0)
Chat2.BorderSizePixel = 2
Chat2.Position = UDim2.new(0.400000006, 0, 0.8, 0) -- Position at the bottom
Chat2.Size = UDim2.new(0.100000001, 0, 0.200000003, 0)
Chat2.Name = "Chat2"
Chat2.BackgroundTransparency = 1
Chat2.Parent = Dialogue2

Sub2.FontFace = Font.new("rbxassetid://12187375716", Enum.FontWeight.Bold, Enum.FontStyle.Italic)
Sub2.Text = text2
Sub2.TextColor3 = Color3.new(0, 0, 0)
Sub2.TextScaled = true
Sub2.TextSize = 14
Sub2.TextWrapped = true
Sub2.AnchorPoint = Vector2.new(0.5, 0.5)
Sub2.BackgroundColor3 = Color3.new(1, 1, 1)
Sub2.TextTransparency = 1
Sub2.BorderColor3 = Color3.new(0, 0, 0)
Sub2.BorderSizePixel = 0
Sub2.Position = UDim2.new(0.5, 0, 0.5, 0)
Sub2.Size = UDim2.new(0.850000024, 0, 0.349999994, 0)
Sub2.Name = "Sub2"
Sub2.Parent = Chat2
Sub2.BackgroundTransparency = 1

-- Define the tweenProperty function
local function tweenProperty(object, properties, time)
    local tweenInfo = TweenInfo.new(time)
    local tween = ts:Create(object, tweenInfo, properties)
    tween:Play()
end

game.Debris:AddItem(Dialogue, 25)
game.Debris:AddItem(Chat1, 25)
game.Debris:AddItem(Sub1, 25)

game.Debris:AddItem(Dialogue2, 25)
game.Debris:AddItem(Chat2, 25)
game.Debris:AddItem(Sub2, 25)

-- Apply tweens for Dialogue 1 ("KOKUSEN!!") change me
tweenProperty(Chat1, {BackgroundTransparency = 0}, 1)
tweenProperty(Sub1, {TextTransparency = 0}, 1)
tweenProperty(Chat1, {Position = UDim2.new(0.6, 0, 0.4, 0)}, 1)

-- Apply tweens for Dialogue 2 ("Yummy") change me
tweenProperty(Chat2, {BackgroundTransparency = 0}, 1)
tweenProperty(Sub2, {TextTransparency = 0}, 1)
tweenProperty(Chat2, {Position = UDim2.new(0.4, 0, 0.5, 0)}, 1) -- Slightly lower than "KOKUSEN!!"

task.wait(2)

-- Fade out both dialogues
tweenProperty(Chat1, {BackgroundTransparency = 1}, 2)
tweenProperty(Sub1, {TextTransparency = 1}, 2)

tweenProperty(Chat2, {BackgroundTransparency = 1}, 2)
tweenProperty(Sub2, {TextTransparency = 1}, 2)
end

local cam = workspace.CurrentCamera
local openanim = ts:Create(cam, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {FieldOfView = 90})
local closeanim = ts:Create(cam, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {FieldOfView = 70})
local intoanim = ts:Create(cam, TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {FieldOfView = 40})

local function spawnanim()
       local spanim = Instance.new("Animation", character.Humanoid)
       spanim.AnimationId = "rbxassetid://17292505729"
       local actanim = character.Humanoid:LoadAnimation(spanim)
       actanim:Play()
       local sawsound = Instance.new("Sound", hrp)
       sawsound.SoundId = "rbxassetid://3352260042"
       sawsound.Volume = 3
       sawsound.TimePosition = 0.45
       sawsound:Play()
       intoanim:Play()
       
       actanim.Ended:Connect(function()
              closeanim:Play()
       end)
       
       wait(0.5)
       
       openanim:Play()
local Test = game:GetService("ReplicatedStorage").Resources.BloodSplatter.Attachment
local test = Test:Clone()
test.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]

for _, child in ipairs(test:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(25)
        child.Enabled = true
        child.Enabled = false
    end
end
       
       setupstuff()
       
       mangatext("When I fight a dude...", "...it's nuts or nothin'!")
       wait(3)
       spanim:Destroy()
       sawsound:Destroy()
       test:Destroy()
end

local function impactframe()
      local light = Instance.new("Highlight", character)
      local cc = Instance.new("ColorCorrectionEffect", game.Lighting)
      light.OutlineTransparency = 1
      light.FillTransparency = 0
      light.FillColor = Color3.new(0, 0, 0)
      cc.Brightness = 1
      wait(0.1)
      light.FillColor = Color3.new(255, 255, 255)
      cc.Brightness = -1
      wait(0.2)
      cc:Destroy()
      light:Destroy()
end

local teleportDistance = 50
local function findClosestPlayer()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return nil end

    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(workspace:GetDescendants()) do
        if otherPlayer ~= character and otherPlayer:FindFirstChild("HumanoidRootPart") and otherPlayer:IsA("Model") then
            local otherHumanoidRootPart = otherPlayer.HumanoidRootPart
            local distance = (humanoidRootPart.Position - otherHumanoidRootPart.Position).magnitude

            if (not teleportDistance or distance <= teleportDistance) and distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end
    return closestPlayer, shortestDistance
end

local function tptoplayer()
    local humanoid = character:WaitForChild("Humanoid")
    local closestPlayer, distance = findClosestPlayer()

    if closestPlayer and closestPlayer:FindFirstChild("HumanoidRootPart") then
        local closestHumanoidRootPart = closestPlayer:FindFirstChild("HumanoidRootPart")
        if closestHumanoidRootPart then
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            if not teleportDistance or distance <= teleportDistance then
                   humanoidRootPart.CFrame = closestHumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
            end
        end
    end
end

local function aim()
    local humanoid = character:WaitForChild("Humanoid")
    local closestPlayer, distance = findClosestPlayer()

    if closestPlayer and closestPlayer:FindFirstChild("HumanoidRootPart") then
        local closestHumanoidRootPart = closestPlayer:FindFirstChild("HumanoidRootPart")
        if closestHumanoidRootPart then
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            if not teleportDistance or distance <= teleportDistance then
                   humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, closestHumanoidRootPart.Position)
            end
        end
    end
end

local function dismantlevfx()
      local A1 = Instance.new('Attachment', character.HumanoidRootPart)
      A1.CFrame = CFrame.new(0, 0, -10)

A1.Name = [[A1]]

local Dots1 = Instance.new('ParticleEmitter', A1)

Dots1.Name = [[Dots1]]
Dots1.Brightness = 3
Dots1.Drag = 3
Dots1.FlipbookFramerate = NumberRange.new(0, 0 )
Dots1.FlipbookMode = Enum.ParticleFlipbookMode.Random
Dots1.Lifetime = NumberRange.new(0.45, 0.76 )
Dots1.LightEmission = -10
Dots1.Rate = 60
Dots1.RotSpeed = NumberRange.new(-400, 400 )
Dots1.Rotation = NumberRange.new(0, 360 )
Dots1.ShapePartial = 15
Dots1.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.435184, 3.38769, 0.206667), NumberSequenceKeypoint.new(1, 0, 0)})
Dots1.Speed = NumberRange.new(1, 120 )
Dots1.SpreadAngle = Vector2.new(360, 360)
Dots1.Texture = [[rbxassetid://10205180639]]
Dots1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1, 0), NumberSequenceKeypoint.new(0.321053, 0, 0), NumberSequenceKeypoint.new(0.606316, 0, 0), NumberSequenceKeypoint.new(1, 1, 0)})
Dots1.VelocityInheritance = 1
Dots1.ZOffset = 1.2000000476837158

local Sparks1 = Instance.new('ParticleEmitter', A1)

Sparks1.Name = [[Sparks1]]
Sparks1.Brightness = 3
Sparks1.Color = ColorSequence.new(Color3.fromRGB(245, 208, 218))
Sparks1.Drag = 4
Sparks1.FlipbookMode = Enum.ParticleFlipbookMode.OneShot
Sparks1.Lifetime = NumberRange.new(0.15, 0.25 )
Sparks1.LightEmission = -10
Sparks1.Orientation = Enum.ParticleOrientation.VelocityParallel
Sparks1.Rate = 70
Sparks1.ShapePartial = 15
Sparks1.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.133184, 10.4565, 8.41771), NumberSequenceKeypoint.new(1, 0, 0)})
Sparks1.Speed = NumberRange.new(15, 60 )
Sparks1.SpreadAngle = Vector2.new(360, 360)
Sparks1.Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(1, -6.60906, 0)})
Sparks1.Texture = [[rbxassetid://7994629137]]
Sparks1.ZOffset = 1.2000000476837158

Sparks1:Emit(15)
Dots1:Emit(15)

wait(0.1)

Sparks1:Destroy()
Dots1:Destroy()
A1:Destroy()
end

local sillyimg = "https://github.com/aggiealledge/sfx-stuff/blob/main/images(172).jpg?raw=true"
local sillyname = "osaka.png"

if not isfile(sillyname) then
    writefile(sillyname, game:HttpGet(sillyimg))
end

local Jesuscross = "https://github.com/aggiealledge/sfx-stuff/blob/main/jesus-cross-isolated-on-transparent-free-png.png?raw=true"
local crossname = "Jesus_cross.png"

if not isfile(crossname) then
    writefile(crossname, game:HttpGet(Jesuscross))
end

local chainsawurl1 = "https://github.com/aggiealledge/sfx-stuff/raw/refs/heads/main/chainsawsound1.mp3"
local chainsawnm1 = "chainsawsound.mp3"

if not isfile(chainsawnm1) then
    writefile(chainsawnm1, game:HttpGet(chainsawurl1))
end

local chainurl = "https://github.com/aggiealledge/sfx-stuff/blob/main/noFilter%20(1)%20(1).png?raw=true"
local chainimg = "chain.png"

if not isfile(chainimg) then
    writefile(chainimg, game:HttpGet(chainurl))
end

local kickbackurl = "https://github.com/aggiealledge/sfx-stuff/raw/refs/heads/main/chainsawmanult.mp3"
local kickbackmusic = "kickback.mp3"

if not isfile(kickbackmusic) then
    writefile(kickbackmusic, game:HttpGet(kickbackurl))
end

local kickback = Instance.new("Sound", hrp)
kickback.SoundId = getcustomasset(kickbackmusic)
kickback.Volume = 2

local blackurl = "https://github.com/aggiealledge/sfx-stuff/blob/main/images(190).jpg?raw=true"
local blacknm = "chainsawtexture.png"

if not isfile(blacknm) then
    writefile(blacknm, game:HttpGet(blackurl))
end

---------------------------moves---------------------------------

local thirdvariant = false

local function onAnimationPlayed(animationTrack)
    local animationId = animationTrack.Animation.AnimationId:match("%d+")
    local replacement = replacementAnimations[animationId]

    if replacement then
        animationTrack:Stop()
        local newAnimation = Instance.new("Animation")
        newAnimation.AnimationId = replacement.id
        local newTrack = humanoid:LoadAnimation(newAnimation)
        newTrack:Play()
        newTrack:AdjustSpeed(replacement.speed) -- Apply speed to the new animation
    end
    
    if animationTrack.Animation.AnimationId == "rbxassetid://13294471966" or animationTrack.Animation.AnimationId == "rbxassetid://13532604085" or animationTrack.Animation.AnimationId == "rbxassetid://13532600125" or animationTrack.Animation.AnimationId == "rbxassetid://13532562418" then
          --m1
          local idtable = {4815023971, 4815024605, 4815025241}
          local idrandom = idtable[math.random(1, #idtable)]
          
          local clicksfx = Instance.new("Sound", hrp)
          clicksfx.SoundId = "rbxassetid://" .. idrandom
          clicksfx.Volume = 1
          clicksfx:Play()
          
          clicksfx.Ended:Wait()
          
          clicksfx:Destroy()
    end
    
    if animationTrack.Animation.AnimationId == "rbxassetid://12296882427" then
       --1st move
       intoanim:Play()
       wait(0.5)
       local Test = game.ReplicatedStorage.Resources.SplitSecond.TPNEW.TP.Attachment
local test = Test:Clone()
test.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]

for _, child in ipairs(test:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(25)
        child.Enabled = true
    end
end
      local Test1 = game:GetService("ReplicatedStorage").Resources.Sunrise.Constant2.Part.Constant
local test1 = Test:Clone()
test1.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]

for _, child in ipairs(test1:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(15)
        child.Enabled = true
    end
end
      openanim:Play()
      impactframe()
      closeanim:Play()
      thirdvariant = true
      wait(0.5)
      test:Destroy()
      test1:Destroy()
      wait(2.5)
      thirdvariant = false
    elseif animationTrack.Animation.Animation == "rbxassetid://17858997926" then
      --2nd move
      intoanim:Play()
      wait(0.3)
      local sawsound = Instance.new("Sound", hrp)
       sawsound.SoundId = getcustomasset(chainsawnm1)
       sawsound.Volume = 3
       sawsound.TimePosition = 0.45
       sawsound:Play()
      local legpart = Instance.new("Part", character)
legpart.Name = "chainsawleftarm"
legpart.Size = Vector3.new(1, 1, 1)
legpart.CFrame = character:WaitForChild("Left Leg").CFrame * CFrame.Angles(0, 90, 0)
legpart.Anchored = false
legpart.Massless = true
legpart.CanCollide = false
local legmesh = Instance.new("SpecialMesh", legpart)
legmesh.MeshType = Enum.MeshType.FileMesh
legmesh.MeshId = "rbxassetid://128306184055581"
legmesh.TextureId = "rbxassetid://125323146593602"
legmesh.Offset = Vector3.new(0, 0, 0)
legmesh.Scale = Vector3.new(1, 1.7, 1)
local weld1 = Instance.new("Weld", legpart)
weld1.Part0 = character["Left Leg"]
weld1.Part1 = legpart
weld1.C0 = CFrame.new(0, -1, 0)
      openanim:Play()
      if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
      local Bod = Instance.new("BodyPosition", hrp)
    Bod.maxForce = Vector3.new(100000, 100000, 100000)
    Bod.Position = hrp.CFrame*CFrame.new(0, 75, -125).p
	game.Debris:AddItem(Bod, 0.5)
      else
      tptoplayer()
      end
      wait(0.5)
      impactframe()
      local Test = game.ReplicatedStorage.Resources.KJEffects["launchup"].launchything
local test = Test:Clone()
test.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]

for _, child in ipairs(test:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        
        child:Emit(15)
        child.Enabled = true
        child.Enabled = false
    end
end
      closeanim:Play()
      legpart:Destroy()
      wait(2.5)
      test:Destroy()
      sawsound:Destroy()
    elseif animationTrack.Animation.AnimationId == "rbxassetid://13376962659" or animationTrack.Animation.AnimationId == "rbxassetid://13362587853" then
      --3rd move
      if thirdvariant == true then
            local sawrushsfx = Instance.new("Sound", hrp)
            sawrushsfx.SoundId = "rbxassetid://3698276221"
            sawrushsfx.TimePosition = 1
            sawrushsfx.Volume = 4
            local qanim = Instance.new("Animation", humanoid)
            qanim.AnimationId = "rbxassetid://15290930205"
            local actanim = humanoid:LoadAnimation(qanim)
            local bd = Instance.new("BodyVelocity", hrp)
            bd.MaxForce = Vector3.new(1, 0, 1) * 30000
            bd.Velocity = Vector3.new(0, 0, 0)
            actanim:Play()
            wait(0.2)
            impactframe()
            openanim:Play()
            sawrushsfx:Play()
            for count = 1,10 do
            dismantlevfx()
            for i,v in pairs(character:GetChildren()) do
              if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v.Name ~= "Hitbox_LeftArm" and v.Name ~= "Hitbox_RightArm" and v.Name ~= "Hitbox_LeftLeg" and v.Name ~= "Hitbox_RightLeg" then
                     v.Transparency = 0
              end
        end
            end
            closeanim:Play()
            qanim:Destroy()
            bd:Destroy()
            sawrushsfx:Destroy()
      elseif thirdvariant == false then
            local sawrushsfx = Instance.new("Sound", hrp)
            sawrushsfx.SoundId = "rbxassetid://3698276221"
            sawrushsfx.TimePosition = 1
            sawrushsfx.Volume = 4
            local bd = Instance.new("BodyVelocity", character.HumanoidRootPart)
            bd.MaxForce = Vector3.new(1, 0, 1) * 30000
            wait(0.2)
            impactframe()
            sawrushsfx:Play()
            openanim:Play()
            for count = 1,10 do
            wait(0.1)
            bd.Velocity = character.HumanoidRootPart.CFrame.lookVector * 100
            for i,v in pairs(character:GetChildren()) do
              if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v.Name ~= "Hitbox_LeftArm" and v.Name ~= "Hitbox_RightArm" and v.Name ~= "Hitbox_LeftLeg" and v.Name ~= "Hitbox_RightLeg" then
                     v.Transparency = 0
              end
            end
            end
            tptoplayer()
            bd:Destroy()
            closeanim:Play()
            sawrushsfx:Destroy()
      end
    elseif animationTrack.Animation.AnimationId == "rbxassetid://13501296372" or animationTrack.Animation.AnimationId == "rbxassetid://13556985475" then
      --4th move
      wait(0.2)
      impactframe()
      openanim:Play()
      
      local att0 = Instance.new("Attachment", hrp)
      att0.Name = "att0"
      local att1 = Instance.new("Attachment", hrp)
      att1.Name = "att1"
      att1.CFrame *= CFrame.new(0, 0, -5)
      
      local beam = Instance.new("Beam", hrp)
      beam.Attachment0 = att0
      beam.Attachment1 = att1
      beam.Texture = getcustomasset(chainimg)
      beam.Transparency = NumberSequence.new(0)
      beam.Width0 = 3
      beam.Width1 = 3
      beam.TextureSpeed = 3
      beam.FaceCamera = true
      
      local beamanim = ts:Create(att0, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {CFrame = hrp.CFrame * CFrame.new(0, 0, -50)})
      beamanim:Play()
      
      local Test = game:GetService("ReplicatedStorage").Resources.AtomicSlash.Bruh.Bruh.Bruh
local test = Test:Clone()
test.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]

for _, child in ipairs(test:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child.Color = ColorSequence.new(Color3.fromRGB(245, 208, 218))
        child:Emit(50)
        child.Enabled = true
    end
end
        wait(0.5)
        closeanim:Play()
        test:Destroy()
        att0:Destroy()
        att1:Destroy()
        beam:Destroy()
    elseif animationTrack.Animation.AnimationId == "rbxassetid://13499771836" then
        --ult
        local awakesound
          for i,v in pairs(character.HumanoidRootPart:GetChildren()) do
                 if v:IsA("Sound") and v.SoundId == "rbxassetid://15806232934" then
                       v.SoundId = getcustomasset(kickbackmusic)
                       v:Stop()
                       awakesound = v
                 end
          end
       local sawsound = Instance.new("Sound", hrp)
       sawsound.SoundId = "rbxassetid://3352260042"
       sawsound.Volume = 3
       sawsound.TimePosition = 0.5
        hotbarFrame["3"].Base.Reuse.Visible = false
        local cam1 = Instance.new("Part", workspace)
        cam1.Name = "cam1"
        cam1.Size = Vector3.new(0.5, 0.5, 0.5)
        cam1.Transparency = 1
        cam1.Anchored = true
        cam1.CFrame = character.Head.CFrame * CFrame.new(0, 0, -12)
        cam1.CFrame = CFrame.lookAt(cam1.Position, character.Head.Position)
        cam.CameraType = Enum.CameraType.Scriptable
        cam.CFrame = cam1.CFrame
        kickback:Play()
        intoanim:Play()
        mangatext("CHAINSAW MAN!!", "SAVE ME,")
        --wait(1.5)
        local Test = game:GetService("ReplicatedStorage").Resources.BloodSplatter.Attachment
local test = Test:Clone()
test.Parent = game.Players.LocalPlayer.Character["HumanoidRootPart"]

for _, child in ipairs(test:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(25)
        child.Enabled = true
        child.Enabled = false
    end
end
        cam.CameraType = Enum.CameraType.Custom
        openanim:Play()
        sawsound:Play()
        character.chainsawhead.Mesh.VertexColor = Vector3.new(0, 0, 0)
        character.chainsawhead.Mesh.TextureId = getcustomasset(blacknm)
        local headpart = Instance.new("Part", character)
headpart.Name = "scarf"
headpart.Size = Vector3.new(1, 1, 1)
headpart.CFrame = character:WaitForChild("Head").CFrame * CFrame.Angles(0, 90, 0)
headpart.Anchored = false
headpart.Massless = true
headpart.CanCollide = false

local weld = Instance.new("Weld", headpart)
weld.Part0 = character.Head
weld.Part1 = headpart
weld.C0 = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0) * CFrame.Angles(-0.23, 0, 0)

local mesh = Instance.new("SpecialMesh", headpart)
mesh.MeshType = Enum.MeshType.FileMesh
mesh.MeshId = "rbxassetid://6275939329"
mesh.TextureId = "rbxassetid://6342633883"
mesh.Offset = Vector3.new(0, -2.25, 0.7)
mesh.Scale = Vector3.new(1, 1, 1)

local shirt = character:FindFirstChildOfClass("Shirt")
if not shirt then
shirt = Instance.new("Shirt", character)
shirt.Name = "Shirt"
end
shirt.ShirtTemplate = "rbxassetid://13521700031"

local pants = character:FindFirstChildOfClass("Pants")
if not pants then
pants = Instance.new("Shirt", character)
pants.Name = "Pants"
end
pants.PantsTemplate = "rbxassetid://13521700031"

        wait(2.5)
        cam.FieldOfView = 50
        local cam2 = Instance.new("Part", workspace)
        cam2.Name = "cam2"
        cam2.Size = Vector3.new(0.5, 0.5, 0.5)
        cam2.Transparency = 1
        cam2.Anchored = true
        cam2.CFrame = character.Head.CFrame * CFrame.new(-5, 0, 0)
        cam2.CFrame = CFrame.lookAt(cam2.Position, character.Head.Position)
        cam.CameraType = Enum.CameraType.Scriptable
        cam.CFrame = cam2.CFrame
        wait(2)
        cam.CameraType = Enum.CameraType.Custom
        closeanim:Play()
        --wait(1)
        hotbarFrame["2"].Base.Reuse.Visible = false
        local ultMoves = {
            {buttonIndex = "1", name = "Terror Rush"},
            {buttonIndex = "2", name = "One-Handed Chainsaw"},
            {buttonIndex = "3", name = "Devil Erasure"},
            {buttonIndex = "4", name = "Absolute Saw Strike"},
        }
        for _, move in ipairs(ultMoves) do
            local baseButton = hotbarFrame:FindFirstChild(move.buttonIndex).Base
            baseButton.ToolName.Text = move.name
        end
        test:Destroy()
        cam1:Destroy()
        cam2:Destroy()
        kickback.Ended:Wait()
        character.chainsawhead.Mesh.TextureId = "rbxassetid://113967554500373"
        character.chainsawhead.Mesh.VertexColor = Vector3.new(1, 1, 1)
        for _, data in pairs(buttonData) do
               local baseButton = hotbarFrame:FindFirstChild(data.name).Base
               local ToolName = baseButton.ToolName
               ToolName.Text = data.text
         end
         hotbarFrame["2"].Base.Reuse.Visible = true
         hotbarFrame["3"].Base.Reuse.Visible = true
         headpart:Destroy()
         character.Pants.PantsTemplate = "rbxassetid://12015661474"
         character.Shirt:Destroy()
    elseif animationTrack.Animation.AnimationId == "rbxassetid://13632347366" then
          --1st ult startup
          openanim:Play()
          impactframe()
          tptoplayer()
          animationTrack.Ended:Wait()
          closeanim:Play()
    elseif animationTrack.Animation.AnimationId == "rbxassetid://13633468484" then
          --1st ult end
          local sawrushsfx = Instance.new("Sound", hrp)
          sawrushsfx.SoundId = "rbxassetid://3698276221"
          sawrushsfx.Volume = 6
          sawrushsfx:Play()
          intoanim:Play()
          wait(0.2)
          impactframe()
          openanim:Play()
          wait(4.3)
          impactframe()
          intoanim:Play()
          wait(0.5)
          openanim:Play()
          impactframe()
          closeanim:Play()
    elseif animationTrack.Animation.AnimationId == "rbxassetid://13643152947" then
           --2nd ult startup
          impactframe()
          openanim:Play()
          local bd = Instance.new("BodyVelocity", character.HumanoidRootPart)
          bd.MaxForce = Vector3.new(1, 0, 1) * 30000
          for count = 1,45 do
                wait(0.1)
                bd.Velocity = character.HumanoidRootPart.CFrame.lookVector * 150
         end
    elseif animationTrack.Animation.AnimationId == "rbxassetid://13634395775" then
           --2nd ult midway??
           for i,v in pairs(hrp:GetChildren()) do
                 if v:IsA("BodyVelocity") then
                        v:Destroy()
                 end
           end
           local betweenanim = ts:Create(cam, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {FieldOfView = 80})
           betweenanim:Play()
           local bd = Instance.new("BodyVelocity", character.HumanoidRootPart)
           bd.MaxForce = Vector3.new(1, 0, 1) * 30000
           for count = 1,35 do
                 wait(0.1)
                 bd.Velocity = character.HumanoidRootPart.CFrame.lookVector * 100
          end
    elseif animationTrack.Animation.AnimationId == "rbxassetid://13639700348" then
           --2nd ult end
           for i,v in pairs(hrp:GetChildren()) do
                 if v:IsA("BodyVelocity") then
                        v:Destroy()
                 end
           end
           intoanim:Play()
           wait(0.45)
           --tptoplayer()
           --character:SetPrimaryPartCFrame(character:GetPrimaryPartCFrame()*CFrame.new(0, 0, -25))
           openanim:Play()
           impactframe()
           closeanim:Play()
           for i,v in pairs(hrp:GetChildren()) do
                 if v:IsA("BodyVelocity") then
                        v:Destroy()
                 end
           end
    elseif animationTrack.Animation.AnimationId == "rbxassetid://15334974550" then
          --3rd ult
          intoanim:Play()
          local bd = Instance.new("BodyVelocity", hrp)
          bd.MaxForce = Vector3.new(1, 0, 1) * 30000
          bd.Velocity = Vector3.new(0, 0, 0)
          wait(0.75)
          character:SetPrimaryPartCFrame(character:GetPrimaryPartCFrame()*CFrame.new(0, -20, 0))
          openanim:Play()
          impactframe()
          character:SetPrimaryPartCFrame(character:GetPrimaryPartCFrame()*CFrame.new(0, 0, -75))
          closeanim:Play()
          bd:Destroy()
    elseif animationTrack.Animation.AnimationId == "rbxassetid://14900168720" then
          --4th ult start
          openanim:Play()
          local bd = Instance.new("BodyVelocity", character.HumanoidRootPart)
          bd.MaxForce = Vector3.new(1, 0, 1) * 30000
          for count = 1,20 do
                wait(0.1)
                bd.Velocity = character.HumanoidRootPart.CFrame.lookVector * 75
         end
    elseif animationTrack.Animation.AnimationId == "rbxassetid://13876406148" then
          --4th ult end
          for i,v in pairs(hrp:GetChildren()) do
                 if v:IsA("BodyVelocity") then
                        v:Destroy()
                 end
           end
          --tptoplayer()
          impactframe()
          intoanim:Play()
          wait(0.65)
          openanim:Play()
          impactframe()
          closeanim:Play()
    end
end

humanoid.AnimationPlayed:Connect(onAnimationPlayed)

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "credits",
	Text = "aggiealledge (on discord) made this script (that's me!!)",
	Icon = getcustomasset(sillyname)
})
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "extra",
	Text = "btw make sure to know that Jesus died for your sins and that He loves you, God bless",
	Icon = getcustomasset(crossname)
})

spawnanim()

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "note",
	Text = "if you die, execute the script again once you respawn if you wanna use it again",
})

character.chainsawhead.Changed:Connect(function()
      character.chainsawhead.Transparency = 0
         for count = 1,10 do
            wait(0.1)
            for i,v in pairs(character:GetChildren()) do
              if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v.Name ~= "Hitbox_LeftArm" and v.Name ~= "Hitbox_RightArm" and v.Name ~= "Hitbox_LeftLeg" and v.Name ~= "Hitbox_RightLeg" then
                     v.Transparency = 0
              end
        end
        end
end)
character.chainsawleftarm.Changed:Connect(function()
      character.chainsawleftarm.Transparency = 0
end)
character.chainsawrightarm.Changed:Connect(function()
      character.chainsawrightarm.Transparency = 0
end)
