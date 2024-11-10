local notify = require 'client.notify'
local config = require 'config'

local GetVehiclePedIsIn = GetVehiclePedIsIn
local GetPedInVehicleSeat = GetPedInVehicleSeat
local IsVehicleExtraTurnedOn = IsVehicleExtraTurnedOn
local SetVehicleExtra = SetVehicleExtra

local function extramenuOpen()
    local playerVehicle = GetVehiclePedIsIn(cache.ped, false)
    local playerDriver = GetPedInVehicleSeat(playerVehicle, -1)

    if playerVehicle == 0 then
        notify.notifyError('extramenu_vehicle_not_found', locale('extramenu_title'), locale('player_not_vehicle'))
        return
    elseif playerDriver ~= cache.ped then
        notify.notifyError('extramenu_not_driver', locale('extramenu_title'), locale('player_not_driver'))
        return
    end

    local vehicleOptions = {}
    local extrasFound = false

    for vehicleMod = 1, 20 do
        if DoesExtraExist(playerVehicle, vehicleMod) then
            extrasFound = true
            local modUsed = IsVehicleExtraTurnedOn(playerVehicle, vehicleMod)

            if modUsed then
                vehicleOptions[#vehicleOptions + 1] = {
                    title = locale('vehicle_extra') .. ' ' .. vehicleMod,
                    description = locale('extra_on_use'),
                    icon = 'fa-solid fa-unlock',

                    onSelect = function()
                        SetVehicleExtra(playerVehicle, vehicleMod, 1)
                        Wait(200)
                        extramenuOpen()
                    end
                }
            else
                vehicleOptions[#vehicleOptions + 1] = {
                    title = locale('vehicle_extra') .. ' ' .. vehicleMod,
                    description = locale('extra_not_used'),
                    icon = 'fa-solid fa-lock',

                    onSelect = function()
                        SetVehicleExtra(playerVehicle, vehicleMod, 0)
                        Wait(200)
                        extramenuOpen()
                    end
                }
            end
        end
    end

    if not extrasFound then
        notify.notifyError('vehiclemods_not_found', locale('extramenu_title'), locale('no_extras_found'))
        return
    end

    lib.registerContext({
        id = 'extramenu',
        title = locale('extramenu_title'),
        options = vehicleOptions
    })

    lib.showContext('extramenu')
end

exports('extramenuOpen', extramenuOpen)

if config.commandEnabled then
    RegisterCommand(config.command, function()
        extramenuOpen()
    end, false)
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        local contextMenu = lib.getOpenContextMenu()

        if contextMenu == 'extramenu' then
            lib.hideContext()
        end
    end
end)