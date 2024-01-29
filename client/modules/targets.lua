local UgCore = exports['ug-core']:GetCore()

if Config.UseTarget then
    -- Player Target Options --
    local playerTargetMenuOptions = {
        {
            name = 'ug-policeJob:target:handcuffPlayer',
            icon = 'fa-solid fa-handcuffs',
            label = Languages.GetTranslation('target_handcuff_player'),
            canInteract = function ()
                local playerData = UgCore.Functions.GetPlayerData()
                if playerData.job.name == 'police' then
                    return true
                end
                return false
            end,
            onSelect = function ()
                UgCore.Callbacks.TriggerCallback('ug-policeJob:Callback:HasItem', function (cb)
                    if cb then
                        UgCore.Functions.Notify('Police', 'Handcuffed the player!', 'success', 5000)
                    else
                        UgCore.Functions.Notify('Police', 'You don\'t have handcuffs with you!', 'error', 5000)
                    end
                end, Config.Items.Handcuffs.Item)
            end
        },
    }
    exports['ox_target']:addGlobalPlayer(playerTargetMenuOptions)

    -- Vehicle Target Options --
    local vehicleTargetMenuOptions = {
        {
            name = 'ug-policeJob:target:searchVehicleInformations',
            icon = 'fa-solid fa-car',
            label = Languages.GetTranslation('target_search_vehicle_informations'),
            canInteract = function (entity)
                local playerData = UgCore.Functions.GetPlayerData()
                if playerData.job.name == 'police' then
                    local data = {
                        vehiclePlate = GetVehicleNumberPlateText(entity)
                    }
                    return data
                end
                return false
            end,
            onSelect = function (data)
                if data then
                    local vehiclePlate = data.vehiclePlate
                    UgCore.Callbacks.TriggerCallback('ug-policeJob:SearchVehicleInformations', function (vehicle)
                        if vehicle.owner then
                            UgCore.Functions.Notify('Police Radio', 'Vehicle is owned by ' .. vehicle.owner.name .. ' (plate: ' .. vehicle.plate .. ')', 'info', 5000)    
                        else
                            UgCore.Functions.Notify('Police Radio', 'Invalid vehicle (maybe stolen?)', 'error', 5000)    
                        end
                    end, vehiclePlate)
                end
            end
        },
    }
    exports['ox_target']:addGlobalVehicle(vehicleTargetMenuOptions) 

    -----------------------
    -- Police Department --
    -----------------------

    -- Toggle Duty --
    for _, v in pairs(Config.Stations) do
        for _, location in pairs(v.Duty) do
            local policeDepartmentToggleDutyOptions = {
                coords = location.Coords,
                radius = location.Radius,
                debug = false,
                drawSprite = false,
                options = {
                    {
                        name = 'ug-policeJob:target:policeDepartmentToggleDuty',
                        icon = 'fa-solid fa-clipboard',
                        label = Languages.GetTranslation('target_police_department_toggle_duty'),
                        canInteract = function ()
                            local playerPed = PlayerPedId()
                            local playerData = UgCore.Functions.GetPlayerData()
                            local playerCoords = GetEntityCoords(playerPed)
                            local playerDistance = #(playerCoords - location.Coords)
                            if playerData.job.name == 'police' and playerDistance <= location.Radius then
                                return true
                            end
                            return false
                        end,
                        onSelect = function ()
                            TriggerEvent('ug-policeJob:Client:ToggleDuty')
                        end
                    },
                }
            }
            exports['ox_target']:addBoxZone(policeDepartmentToggleDutyOptions)
        end
    end
end