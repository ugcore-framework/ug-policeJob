local UgCore = exports['ug-core']:GetCore()

if Config.UseTarget then
    -- Player Target Options --
    local playerTargetMenuOptions = {
        {
            name = 'ug-policeJob:Target:GetPlayerInformations',
            icon = 'fa-solid fa-handcuffs',
            label = Languages.GetTranslation('target_player_informations'),
            canInteract = function ()
                local playerData = UgCore.Functions.GetPlayerData()
                if playerData.job and playerData.job.name == 'police' then
                    return true
                end
                return false
            end,
            onSelect = function ()
                local closestPlayer, closestDistance = UgCore.Functions.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 3.0 then
                    closestPlayer = GetPlayerServerId(closestPlayer)
                    UgDev.Functions.HandcuffPlayer(closestPlayer)
                else
                    UgCore.Functions.Notify(Languages.GetTranslation('notification_title'), Languages.GetTranslation('notification_no_players_nearby'), 'error', 5000)
                end
            end
        },
    }
    exports['ox_target']:addGlobalPlayer(playerTargetMenuOptions)

    -- Vehicle Target Options --
    local vehicleTargetMenuOptions = {
        {
            name = 'ug-policeJob:Target:SearchVehicleInformations',
            icon = 'fa-solid fa-car',
            label = Languages.GetTranslation('target_search_vehicle_informations'),
            canInteract = function (entity)
                local playerData = UgCore.Functions.GetPlayerData()
                if playerData.job and playerData.job.name == 'police' then
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
                    UgCore.Callbacks.TriggerCallback('ug-policeJob:Callback:SearchVehicleInformations', function (vehicle)
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

    for k, v in pairs(Config.Stations) do
        
        -- Toggle Duty --
        for _, duty in pairs(v.Duty) do
            local policeDepartmentToggleDutyOptions = {
                {
                    name = 'ug-policeJob:Target:ToggleDuty',
                    icon = 'fa-solid fa-clipboard',
                    label = Languages.GetTranslation('target_toggle_duty'),
                    distance = duty.Distance,
                    canInteract = function ()
                        local playerData = UgCore.Functions.GetPlayerData()
                        if playerData.job and (playerData.job.name == 'police' or playerData.job.name == 'offpolice') then
                            return true
                        end
                        return false
                    end,
                    onSelect = function ()
                        UgDev.Functions.ToggleDuty()
                    end
                },
            }
            exports['ox_target']:addModel(duty.Target.Model, policeDepartmentToggleDutyOptions)
        end

        -- Lockers --
        for _, locker in pairs(v.Lockers) do
            local policeDepartmentLockersOptions = {
                coords = locker.Coords,
                radius = locker.Radius,
                debug = false,
                drawSprite = false,
                options = {
                    {
                        name = 'ug-policeJob:Target:OpenLocker',
                        icon = 'fa-solid fa-shirt',
                        label = Languages.GetTranslation('target_open_locker'),
                        distance = locker.Distance,
                        canInteract = function ()
                            local playerData = UgCore.Functions.GetPlayerData()
                            if playerData.job and playerData.job.name == 'police' then
                                return true
                            end
                            return false
                        end,
                        onSelect = function ()
                            local station = Config.Stations[k]
                            UgDev.Functions.OpenLocker(station)
                        end
                    },
                }
            }
            exports['ox_target']:addBoxZone(policeDepartmentLockersOptions)
        end

        -- Armories --
        for _, armory in pairs(v.Armory) do
            local policeDepartmentArmoryOptions = {
                coords = armory.Coords,
                radius = armory.Radius,
                debug = false,
                drawSprite = false,
                options = {
                    {
                        name = 'ug-policeJob:Target:OpenArmory',
                        icon = 'fa-solid fa-gun',
                        label = Languages.GetTranslation('target_open_armory'),
                        distance = armory.Distance,
                        canInteract = function ()
                            local playerData = UgCore.Functions.GetPlayerData()
                            if playerData.job and playerData.job.name == 'police' then
                                return true
                            end
                            return false
                        end,
                        onSelect = function ()
                            local station = Config.Stations[k]
                            UgDev.Functions.OpenArmory(station)
                        end
                    },
                }
            }
            exports['ox_target']:addBoxZone(policeDepartmentArmoryOptions)
        end

        -- Garages --
        for _, garage in pairs(v.Garages) do
            for _, spawner in pairs(garage.Coords.Spawner) do
                local policeDepartmentGarageOptions = {
                    coords = spawner,
                    radius = garage.Radius,
                    debug = false,
                    drawSprite = false,
                    options = {
                        {
                            name = 'ug-policeJob:Target:OpenGarage',
                            icon = 'fa-solid fa-car',
                            label = Languages.GetTranslation('target_open_garage'),
                            distance = garage.Distance,
                            canInteract = function ()
                                local playerData = UgCore.Functions.GetPlayerData()
                                if playerData.job and playerData.job.name == 'police' then
                                    return true
                                end
                                return false
                            end,
                            onSelect = function ()
                                UgDev.Functions.OpenGarage(garage)
                            end
                        },
                    }
                }
                exports['ox_target']:addBoxZone(policeDepartmentGarageOptions)
            end
        end
    end
end