local QBCore = exports['qb-core']:GetCoreObject()

-- Configuration
local config = {
    position = 'right-middle',
    timeout = 5000,
    animation = {
        inAnimation = 'fadeIn',
        outAnimation = 'fadeOut'
    },
    progress = true,
    closeButton = true,
}

-- Function to show notification
local function ShowNotification(message, type, title)
    SendNUIMessage({
        action = 'showNotification',
        message = message,
        type = type or 'info',
        title = title or 'Notification',
        config = config
    })
end

-- Specific notification functions
local function NotifySuccess(message, title)
    ShowNotification(message, 'success', title or 'Success')
end

local function NotifyWarning(message, title)
    ShowNotification(message, 'warning', title or 'Warning')
end

local function NotifyInfo(message, title)
    ShowNotification(message, 'info', title or 'Information')
end

local function NotifyError(message, title)
    ShowNotification(message, 'error', title or 'Error')
end

-- Export the functions
exports('Notify', ShowNotification)
exports('NotifySuccess', NotifySuccess)
exports('NotifyWarning', NotifyWarning)
exports('NotifyInfo', NotifyInfo)
exports('NotifyError', NotifyError)

-- Event handlers for server-triggered notifications
RegisterNetEvent('qb-notify:client:SendNotification')
AddEventHandler('qb-notify:client:SendNotification', ShowNotification)

RegisterNetEvent('qb-notify:client:NotifySuccess')
AddEventHandler('qb-notify:client:NotifySuccess', NotifySuccess)

RegisterNetEvent('qb-notify:client:NotifyWarning')
AddEventHandler('qb-notify:client:NotifyWarning', NotifyWarning)

RegisterNetEvent('qb-notify:client:NotifyInfo')
AddEventHandler('qb-notify:client:NotifyInfo', NotifyInfo)

RegisterNetEvent('qb-notify:client:NotifyError')
AddEventHandler('qb-notify:client:NotifyError', NotifyError)

-- Commands for testing (can be removed in production)
RegisterCommand('testnotify', function(source, args)
    local types = {'success', 'warning', 'info', 'error'}
    local messages = {
        success = 'This is a success notification!',
        warning = 'This is a warning notification!',
        info = 'This is an info notification!',
        error = 'This is an error notification!'
    }
    local titles = {
        success = 'Success Test',
        warning = 'Warning Test',
        info = 'Info Test',
        error = 'Error Test'
    }

    for i, type in ipairs(types) do
        SetTimeout(i * 1500, function()  -- Delay each notification by 1.5 seconds
            ShowNotification(messages[type], type, titles[type])
        end)
    end
end, false)