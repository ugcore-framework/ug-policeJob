local UgCore = exports['ug-core']:GetCore()

CreateThread(function ()
    while true do
        local sleep = 1500
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerData = UgCore.Functions.GetPlayerData()

        if playerData.job and playerData.job.name == 'police' then
            sleep = 500
            for _, station in pairs(Config.Stations) do
                for _, garage in pairs(station.Garages) do
                    for _, returnVehicle in pairs(garage.Coords.ReturnVehicle) do
                        local distance = #(playerCoords - returnVehicle)

                        if distance <= garage.Markers.ReturnVehicle.DrawDistance then
						    sleep = 0
                            DrawMarker(garage.Markers.ReturnVehicle.Type, returnVehicle.x, returnVehicle.y, returnVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, garage.Markers.ReturnVehicle.Color.r, garage.Markers.ReturnVehicle.Color.g, garage.Markers.ReturnVehicle.Color.b, 100, false, true, 2, true, false, false, false)

                            if distance <= garage.Markers.ReturnVehicle.Size.x then
                                local playerVehicle = GetVehiclePedIsIn(playerPed, false)
                                local isPlayerInVehicle = IsPedInAnyVehicle(playerPed, false)
                                
                                if isPlayerInVehicle then
                                    UgCore.Functions.TextUI(Languages.GetTranslation('textUI_press_to_store_vehicle'))
                                    if IsControlJustReleased(0, 51) then
                                        UgCore.Functions.DeleteVehicle(playerVehicle)
                                        UgCore.Functions.HideUI()
                                        UgCore.Functions.Notify(Languages.GetTranslation('notification_title'), Languages.GetTranslation('notification_vehicle_stored'), 'success', 5000)
                                    end
                                else
                                    UgCore.Functions.HideUI()
                                end
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

if not Config.UseTarget then
    while true do
        local sleep = 1500
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerData = UgCore.Functions.GetPlayerData()

        if playerData.job and (playerData.job.name == 'police' or playerData.job.name == 'offpolice') then
            sleep = 500

            for _, station in pairs(Config.Stations) do
                -- Duty --
                for _, duty in pairs(station.Duty) do
                    local distance = #(playerCoords - duty.Coords)
                    local marker = duty.Marker

                    if distance <= marker.DrawDistance then
					    sleep = 0
                        DrawMarker(marker.Type, duty.Coords.x, duty.Coords.y, duty.Coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, marker.Color.r, marker.Color.g, marker.Color.b, 100, false, true, 2, true, false, false, false)

                        if distance <= marker.Size.x then
                            UgCore.Functions.TextUI(Languages.GetTranslation('textUI_press_to_toggle_duty'))
                            if IsControlJustReleased(0, 51) then
                                UgDev.Functions.ToggleDuty()
                                UgCore.Functions.HideUI()
                            end
                        else
                            UgCore.Functions.HideUI()
                        end
                    end
                end

                -- Lockers --
                for _, locker in pairs(station.Lockers) do
                    local distance = #(playerCoords - locker.Coords)
                    local marker = locker.Marker

                    if distance <= marker.DrawDistance then
					    sleep = 0
                        DrawMarker(marker.Type, locker.Coords.x, locker.Coords.y, locker.Coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, marker.Color.r, marker.Color.g, marker.Color.b, 100, false, true, 2, true, false, false, false)

                        if distance <= marker.Size.x then
                            if not UgDev.MenuOpenned then
                                UgCore.Functions.TextUI(Languages.GetTranslation('textUI_press_to_open_locker'))
                            end
                            if IsControlJustReleased(0, 51) then
                                UgDev.Functions.OpenLocker(station)
                                UgCore.Functions.HideUI()
                            end
                        else
                            UgCore.Functions.HideUI()
                        end
                    end
                end

                -- Armories --
                for _, armory in pairs(station.Armory) do
                    local distance = #(playerCoords - armory.Coords)
                    local marker = armory.Marker

                    if distance <= marker.DrawDistance then
					    sleep = 0
                        DrawMarker(marker.Type, armory.Coords.x, armory.Coords.y, armory.Coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, marker.Color.r, marker.Color.g, marker.Color.b, 100, false, true, 2, true, false, false, false)

                        if distance <= marker.Size.x then
                            if not UgDev.MenuOpenned then
                                UgCore.Functions.TextUI(Languages.GetTranslation('textUI_press_to_open_armory'))
                            end
                            if IsControlJustReleased(0, 51) then
                                UgDev.Functions.OpenArmory(station)
                                UgCore.Functions.HideUI()
                            end
                        else
                            UgCore.Functions.HideUI()
                        end
                    end
                end

                -- Garages --
                for _, garage in pairs(station.Garages) do
                    for _, spawner in pairs(garage.Coords.Spawner) do
                        local distance = #(playerCoords - spawner)
                        local marker = garage.Markers.Spawner

                        if distance <= marker.DrawDistance then
					        sleep = 0
                            DrawMarker(marker.Type, spawner.x, spawner.y, spawner.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, marker.Color.r, marker.Color.g, marker.Color.b, 100, false, true, 2, true, false, false, false)

                            if distance <= marker.Size.x then
                                if not UgDev.MenuOpenned then
                                    UgCore.Functions.TextUI(Languages.GetTranslation('textUI_press_to_open_garage'))
                                end
                                if IsControlJustReleased(0, 51) then
                                    UgDev.Functions.OpenGarage(garage)
                                    UgCore.Functions.HideUI()
                                end
                            else
                                UgCore.Functions.HideUI()
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end