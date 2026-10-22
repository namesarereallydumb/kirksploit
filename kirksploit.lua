-- hey man thanks for actually reading the source code, no one ever bothers to check loadstrings before they run it
local esplib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tulontop/esp-lib.lua/refs/heads/main/source.lua"))()

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local AmericaTheme = {
    TextColor = Color3.fromRGB(245, 245, 245),

    Background = Color3.fromRGB(12, 18, 35),
    Topbar = Color3.fromRGB(20, 30, 55),
    Shadow = Color3.fromRGB(5, 8, 18),

    NotificationBackground = Color3.fromRGB(15, 22, 40),
    NotificationActionsBackground = Color3.fromRGB(190, 30, 45),

    TabBackground = Color3.fromRGB(28, 42, 70),
    TabStroke = Color3.fromRGB(55, 75, 110),
    TabBackgroundSelected = Color3.fromRGB(190, 30, 45),
    TabTextColor = Color3.fromRGB(230, 235, 245),
    SelectedTabTextColor = Color3.fromRGB(255, 255, 255),

    ElementBackground = Color3.fromRGB(22, 32, 55),
    ElementBackgroundHover = Color3.fromRGB(35, 48, 75),
    SecondaryElementBackground = Color3.fromRGB(16, 24, 42),
    ElementStroke = Color3.fromRGB(50, 70, 105),
    SecondaryElementStroke = Color3.fromRGB(35, 50, 80),

    SliderBackground = Color3.fromRGB(35, 55, 90),
    SliderProgress = Color3.fromRGB(190, 30, 45),
    SliderStroke = Color3.fromRGB(255, 255, 255),

    ToggleBackground = Color3.fromRGB(25, 35, 55),
    ToggleEnabled = Color3.fromRGB(190, 30, 45),
    ToggleDisabled = Color3.fromRGB(75, 85, 105),
    ToggleEnabledStroke = Color3.fromRGB(230, 50, 65),
    ToggleDisabledStroke = Color3.fromRGB(110, 120, 140),
    ToggleEnabledOuterStroke = Color3.fromRGB(45, 80, 145),
    ToggleDisabledOuterStroke = Color3.fromRGB(45, 55, 75),

    DropdownSelected = Color3.fromRGB(35, 50, 80),
    DropdownUnselected = Color3.fromRGB(20, 30, 50),

    InputBackground = Color3.fromRGB(18, 27, 45),
    InputStroke = Color3.fromRGB(65, 90, 135),
    PlaceholderColor = Color3.fromRGB(165, 180, 205),
}

local Window = Rayfield:CreateWindow({
    Name = "Kirksploit",
    LoadingTitle = "Kirksploit",
    LoadingSubtitle = "The menu that tastes like candy!",
    ConfigurationSaving = { Enabled = false },
    Theme = AmericaTheme,
})

local ScriptsTab = Window:CreateTab("Scripts", 4483362458)

ScriptsTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)
    end,
})

ScriptsTab:CreateButton({
    Name = "Dex++",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
        end)
    end,
})

ScriptsTab:CreateButton({
    Name = "Cobalt",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Wortexios/CobaltSpy/refs/heads/main/Cobalt"))()
        end)
    end,
})

local UtilsTab = Window:CreateTab("Utils", 4483362458)

local boxESPActive = false
local players = game:GetService("Players")

local function addPlayerESP(character)
    if not character or not character.Parent then return end
    esplib.add_box(character)
    esplib.add_name(character)
    esplib.add_distance(character)
end

local BoxESPToggle = UtilsTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "BoxESP",
    Callback = function(Value)
        boxESPActive = Value
        esplib.box.enabled = Value
        esplib.name.enabled = Value
        esplib.distance.enabled = Value
        
        if boxESPActive then
            for _, player in pairs(players:GetPlayers()) do
                if player ~= players.LocalPlayer and player.Character then
                    addPlayerESP(player.Character)
                end
            end
        end
    end,
})

UtilsTab:CreateButton({
    Name = "Hide Username (Local)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/namesarereallydumb/kirksploit/refs/heads/main/newui",true))()
    end,
})

for _, player in pairs(players:GetPlayers()) do
    if player ~= players.LocalPlayer then
        player.CharacterAdded:Connect(function(character)
            if boxESPActive then
                addPlayerESP(character)
            end
        end)
        if player.Character and boxESPActive then
            addPlayerESP(player.Character)
        end
    end
end

players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if boxESPActive then
            addPlayerESP(character)
        end
    end)
end)

-- Settings tab
local SettingsTab = Window:CreateTab("Settings", 4483362458)

local OtherSection = SettingsTab:CreateSection("Other")

SettingsTab:CreateButton({
    Name = "Unload",
    Callback = function()
        getgenv().esplib = nil
        Rayfield:Destroy()
    end,
})

local ThemeSection = SettingsTab:CreateSection("Theme")

SettingsTab:CreateButton({
    Name = "Dark",
    Callback = function()
        Window.ModifyTheme('Default')
    end,
})

SettingsTab:CreateButton({
    Name = "Dark Blue",
    Callback = function()
        Window.ModifyTheme('DarkBlue')
    end,
})

SettingsTab:CreateButton({
    Name = "Ocean",
    Callback = function()
        Window.ModifyTheme('Ocean')
    end,
})

SettingsTab:CreateButton({
    Name = "Amethyst",
    Callback = function()
        Window.ModifyTheme('Amethyst')
    end,
})

local KirkHubTheme = {
    TextColor = Color3.fromRGB(245, 245, 245),

    Background = Color3.fromRGB(13, 13, 13),
    Topbar = Color3.fromRGB(25, 25, 25),
    Shadow = Color3.fromRGB(5, 5, 5),

    NotificationBackground = Color3.fromRGB(20, 20, 20),
    NotificationActionsBackground = Color3.fromRGB(255, 121, 0),

    TabBackground = Color3.fromRGB(35, 35, 35),
    TabStroke = Color3.fromRGB(60, 45, 30),
    TabBackgroundSelected = Color3.fromRGB(255, 121, 0),
    TabTextColor = Color3.fromRGB(220, 220, 220),
    SelectedTabTextColor = Color3.fromRGB(15, 15, 15),

    ElementBackground = Color3.fromRGB(27, 27, 27),
    ElementBackgroundHover = Color3.fromRGB(40, 32, 24),
    SecondaryElementBackground = Color3.fromRGB(18, 18, 18),
    ElementStroke = Color3.fromRGB(65, 45, 28),
    SecondaryElementStroke = Color3.fromRGB(42, 35, 28),

    SliderBackground = Color3.fromRGB(45, 35, 25),
    SliderProgress = Color3.fromRGB(255, 121, 0),
    SliderStroke = Color3.fromRGB(255, 157, 66),

    ToggleBackground = Color3.fromRGB(30, 30, 30),
    ToggleEnabled = Color3.fromRGB(255, 121, 0),
    ToggleDisabled = Color3.fromRGB(75, 75, 75),
    ToggleEnabledStroke = Color3.fromRGB(255, 157, 66),
    ToggleDisabledStroke = Color3.fromRGB(100, 100, 100),
    ToggleEnabledOuterStroke = Color3.fromRGB(95, 55, 20),
    ToggleDisabledOuterStroke = Color3.fromRGB(50, 50, 50),

    DropdownSelected = Color3.fromRGB(45, 32, 20),
    DropdownUnselected = Color3.fromRGB(25, 25, 25),

    InputBackground = Color3.fromRGB(24, 24, 24),
    InputStroke = Color3.fromRGB(90, 55, 28),
    PlaceholderColor = Color3.fromRGB(155, 155, 155),
}

SettingsTab:CreateButton({
    Name = "KirkHub",
    Callback = function()
        Window.ModifyTheme(KirkHubTheme)
    end,
})

SettingsTab:CreateButton({
    Name = "America",
    Callback = function()
        Window.ModifyTheme(AmericaTheme)
    end,
})

-- Character peeking from side
local IMAGE_URL = "https://files.catbox.moe/vw9pq2.png"
local FILE_NAME = "kirksploit_bg.png"

local PEEK_AMOUNT = 0.4
local SIZE_SCALE = 0.4
local POSITION = 0.86
local ASPECT = 288 / 512

local RunService = game:GetService("RunService")

local function findRayfieldMain()
    local containers = {}
    if gethui then
        local ok, hui = pcall(gethui)
        if ok and hui then table.insert(containers, hui) end
    end
    table.insert(containers, game:GetService("CoreGui"))
    table.insert(containers, game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))

    for _, container in ipairs(containers) do
        local gui = container:FindFirstChild("Rayfield")
        if gui then
            return gui:WaitForChild("Main", 5)
        end
    end

    for _, container in ipairs(containers) do
        local ok, children = pcall(function() return container:GetChildren() end)
        if ok then
            for _, gui in ipairs(children) do
                if gui:IsA("ScreenGui") then
                    local main = gui:FindFirstChild("Main")
                    if main and main:FindFirstChild("Topbar") then
                        return main
                    end
                end
            end
        end
    end
end

local function setBackground()
    local main = findRayfieldMain()
    if not main then
        warn("Couldn't find the Rayfield window")
        return
    end

    local ok, asset = pcall(function()
        if not isfile(FILE_NAME) then
            writefile(FILE_NAME, game:HttpGet(IMAGE_URL))
        end
        return getcustomasset(FILE_NAME)
    end)

    if not ok or not asset then
        warn("Background failed to load:", asset)
        return
    end

    local bg = Instance.new("ImageLabel")
    bg.Name = "PeekCharacter"
    bg.BackgroundTransparency = 1
    bg.Image = asset
    bg.ScaleType = Enum.ScaleType.Fit
    bg.ZIndex = main.ZIndex - 1
    bg.Parent = main.Parent

    local conn
    conn = RunService.RenderStepped:Connect(function()
        if not main.Parent or not bg.Parent then
            conn:Disconnect()
            if bg.Parent then bg:Destroy() end
            return
        end

        local pos, size = main.AbsolutePosition, main.AbsoluteSize
        local w = size.X * SIZE_SCALE
        local h = w * ASPECT

        bg.Size = UDim2.fromOffset(w, h)
        bg.Position = UDim2.fromOffset(pos.X + size.X * POSITION - w / 2, pos.Y - h * PEEK_AMOUNT)
        bg.Visible = main.Visible and size.X > 0
    end)
end

setBackground()
