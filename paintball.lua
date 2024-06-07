local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/UniversalSkeleton.lua"))()

local SkeletonESP = true

local Skeletons = {}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local LocalPlayer = game.Players.LocalPlayer

function Update()
    for _, Player in next, game.Players:GetChildren() do
        if Player:FindFirstChild("__LOADED") and Player ~= LocalPlayer then
            if SkeletonESP then
                table.insert(Skeletons, Library:NewSkeleton(Player, true));
            else
                for _, Skeleton in pairs(Skeletons) do
                    
                    Skeleton:Remove()
                end

                for i = #Skeletons, 1, -1 do
                    Skeletons[i]:Remove()
                    table.remove(Skeletons, i)
                end
            end 
        end
    end
end

local Window = Rayfield:CreateWindow({
    Name = "Paintball",
    LoadingTitle = "Paintball Script",
    LoadingSubtitle = "by Ivanlr",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"freescripts"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local Visuals = Window:CreateTab("Visuals", 4483362458) -- Title, Image
local Combat = Window:CreateTab("Combat", 4483362458)
local Misce = Window:CreateTab("Miscelanius", 4483362458)

local Vis = Visuals:CreateSection("Visuals")
local Comb = Combat:CreateSection("Combat")
local Misc = Misce:CreateSection("Miscelanius")

local Toggle = Visuals:CreateToggle({
    Name = "Skeleton ESP",
    CurrentValue = SkeletonESP,
    Flag = "Ske", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        SkeletonESP = Value;
        Update()
    end,
})

Update()

game.Players.PlayerAdded:Connect(function(Player)
    if Player:FindFirstChild("__LOADED") then
        if SkeletonESP then
            table.insert(Skeletons, Library:NewSkeleton(Player, true));
        else
            for _, Skeleton in pairs(Skeletons) do
                Skeleton:Remove()
            end

            for i = #Skeletons, 1, -1 do
                Skeletons[i]:Remove()
                table.remove(Skeletons, i)
            end
        end
    end
end)