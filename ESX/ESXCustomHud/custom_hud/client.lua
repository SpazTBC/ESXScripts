local hunger = 100
local thirst = 100
local stamina = 100
local armorCount = 0


local playerId = 0
local cash = 0
local bank = 0
local blackMoney = 0
local serverAbbreviation = Config.ServerAbbreviation



-- Use the new ESX export
local ESX = exports["es_extended"]:getSharedObject()

-- Function to update hunger and thirst asynchronously
local function UpdateStatuses()
    TriggerEvent('esx_status:getStatus', 'hunger', function(status)
        hunger = math.floor(status.getPercent())
    end)
    TriggerEvent('esx_status:getStatus', 'thirst', function(status)
        thirst = math.floor(status.getPercent())
    end)
end

-- Add this function to update player info
local function UpdatePlayerInfo()
    playerId = GetPlayerServerId(PlayerId())
    
    ESX.TriggerServerCallback('esx:getPlayerData', function(data)
        if data.money then
            cash = data.money
        end
        if data.accounts then
            for _, account in ipairs(data.accounts) do
                if account.name == 'bank' then
                    bank = account.money
                elseif account.name == 'black_money' then
                    blackMoney = account.money
                end
            end
        end
    end)
end

CreateThread(function()
    while true do
        Wait(100) -- Update every second

        local ped = PlayerPedId()
        local health = math.floor(GetEntityHealth(ped) - 100)
        local armor = math.floor(GetPedArmour(ped))

        -- Update hunger and thirst asynchronously
        UpdateStatuses()

        -- Update player info
        UpdatePlayerInfo()

        -- Calculate stamina
        stamina = math.floor(100 - GetPlayerSprintStaminaRemaining(PlayerId()))

        -- Send the updated data to your NUI
        SendNUIMessage({
            action = 'updateHUD',
            health = health,
            armor = armor,
            armorCount = armorCount,
            hunger = hunger,
            thirst = thirst,
            stamina = stamina,
            playerId = playerId,
            cash = cash,
            bank = bank,
            blackMoney = blackMoney,
            serverAbbreviation = serverAbbreviation
        })
    end
end)

RegisterNetEvent('custom_hud:updateArmorCount')
AddEventHandler('custom_hud:updateArmorCount', function(count)
    armorCount = math.floor(count)
end)

