--Auto update when developing
for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
    if v.Name == "WindowName" then
        v.Parent.Parent.Parent:Destroy()
    end
end

--Audo updates skybox
for i,v in pairs(game.Lighting:GetChildren()) do
    if v.Name == "SKY" then
        v:Destroy()
    end
end

--Sets up skybox
s = Instance.new("Sky")
s.Name = "SKY"
s.Parent = game.Lighting

--Enables Dev Options
local debug = 0

local Config = {
    WindowName = "Example Library",
	Color = Color3.fromRGB(77, 105, 211),
	Keybind = Enum.KeyCode.RightShift
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Player")
local Tab2 = Window:CreateTab("Visual")
local Tab3 = Window:CreateTab("Misc")
local Tab4 = Window:CreateTab("Settings")

--Enables debug tab
if debug == 1 then
    local Tab5 = Window:CreateTab("Developer")
end

local Section1 = Tab1:CreateSection("Movement")
local Section2 = Tab1:CreateSection("Client")
local Section3 = Tab4:CreateSection("UI")
local Section4 = Tab3:CreateSection("")

local Slider1 = Section1:CreateSlider("Walkspeed", game.Players.LocalPlayer.Character.Humanoid.WalkSpeed, 100, nil, true, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

local Slider3 = Section1:CreateSlider("Jump Power", game.Players.LocalPlayer.Character.Humanoid.JumpPower, 200, nil, true, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

local Slider3 = Section1:CreateSlider("Gravity", 0, game.workspace.Gravity, nil, true, function(Value)
    game.workspace.Gravity = Value
end)

local Slider2 = Section2:CreateSlider("Time", 0,24,nil,true, function(Value)
	game.Lighting.ClockTime = Value
end)

local Dropdown1 = Section2:CreateDropdown("Skybox", {"Default", "Purple Sky", "Galaxy", "Red Lightning"}, function(Name)
    if Name == "Default" then
        s.SkyboxBk = "http://www.roblox.com/asset/?id=58372690"
        s.SkyboxDn = "http://www.roblox.com/asset/?id=58372722"
        s.SkyboxFt = "http://www.roblox.com/asset/?id=58372742"
        s.SkyboxLf = "http://www.roblox.com/asset/?id=58372777"
        s.SkyboxRt = "http://www.roblox.com/asset/?id=58372794"
        s.SkyboxUp = "http://www.roblox.com/asset/?id=58372812"
    else
    if Name == "Purple Sky" then
        s.SkyboxBk = "http://www.roblox.com/asset/?id=6847661057"
        s.SkyboxDn = "http://www.roblox.com/asset/?id=6847661380"
        s.SkyboxFt = "http://www.roblox.com/asset/?id=6847661671"
        s.SkyboxLf = "http://www.roblox.com/asset/?id=6847661950"
        s.SkyboxRt = "http://www.roblox.com/asset/?id=6847665479"
        s.SkyboxUp = "http://www.roblox.com/asset/?id=6847663751"
    else
    if Name == "Galaxy" then
        s.SkyboxBk = "http://www.roblox.com/asset/?id=1387009143"
        s.SkyboxDn = "http://www.roblox.com/asset/?id=1387009143"
        s.SkyboxFt = "http://www.roblox.com/asset/?id=1387009143"
        s.SkyboxLf = "http://www.roblox.com/asset/?id=1387009143"
        s.SkyboxRt = "http://www.roblox.com/asset/?id=1387009143"
        s.SkyboxUp = "http://www.roblox.com/asset/?id=1387009143"
    else
        if Name == "Red Lightning" then
            s.SkyboxBk = "http://www.roblox.com/asset/?id=7920311"
            s.SkyboxDn = "http://www.roblox.com/asset/?id=7920311"
            s.SkyboxFt = "http://www.roblox.com/asset/?id=7920311"
            s.SkyboxLf = "http://www.roblox.com/asset/?id=7920311"
            s.SkyboxRt = "http://www.roblox.com/asset/?id=7920311"
            s.SkyboxUp = "http://www.roblox.com/asset/?id=7920311"
        end
    end
end
end
end)

local Button1 = Section4:CreateButton("Server Hop", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)


local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)

Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)
