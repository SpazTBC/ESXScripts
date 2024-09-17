local QBCore = exports['qb-core']:GetCoreObject()

-- Function to send notification to a specific player
local function NotifyPlayer(source, message, type, title)
    TriggerClientEvent('qb-notify:client:SendNotification', source, message, type, title)
end

-- Function to send notification to all players
local function NotifyAll(message, type, title)
    TriggerClientEvent('qb-notify:client:SendNotification', -1, message, type, title)
end

-- Specific notification functions for a player
local function NotifyPlayerSuccess(source, message, title)
    TriggerClientEvent('qb-notify:client:NotifySuccess', source, message, title)
end

local function NotifyPlayerWarning(source, message, title)
    TriggerClientEvent('qb-notify:client:NotifyWarning', source, message, title)
end

local function NotifyPlayerInfo(source, message, title)
    TriggerClientEvent('qb-notify:client:NotifyInfo', source, message, title)
end

local function NotifyPlayerError(source, message, title)
    TriggerClientEvent('qb-notify:client:NotifyError', source, message, title)
end

-- Export the functions
exports('NotifyPlayer', NotifyPlayer)
exports('NotifyAll', NotifyAll)
exports('NotifyPlayerSuccess', NotifyPlayerSuccess)
exports('NotifyPlayerWarning', NotifyPlayerWarning)
exports('NotifyPlayerInfo', NotifyPlayerInfo)
exports('NotifyPlayerError', NotifyPlayerError)

-- Event handlers for other resources to trigger notifications
RegisterNetEvent('qb-notify:server:NotifyPlayer')
AddEventHandler('qb-notify:server:NotifyPlayer', NotifyPlayer)

RegisterNetEvent('qb-notify:server:NotifyAll')
AddEventHandler('qb-notify:server:NotifyAll', NotifyAll)

RegisterNetEvent('qb-notify:server:NotifyPlayerSuccess')
AddEventHandler('qb-notify:server:NotifyPlayerSuccess', NotifyPlayerSuccess)

RegisterNetEvent('qb-notify:server:NotifyPlayerWarning')
AddEventHandler('qb-notify:server:NotifyPlayerWarning', NotifyPlayerWarning)

RegisterNetEvent('qb-notify:server:NotifyPlayerInfo')
AddEventHandler('qb-notify:server:NotifyPlayerInfo', NotifyPlayerInfo)

RegisterNetEvent('qb-notify:server:NotifyPlayerError')
AddEventHandler('qb-notify:server:NotifyPlayerError', NotifyPlayerError)