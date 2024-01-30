local UgCore = exports['ug-core']:GetCore()

CreateThread(function ()
    while true do
        local sleep = 1500
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerData = UgCore.Functions.GetPlayerData()

        if playerData.job and playerData.job.name == 'police' then
            sleep = 500
            for k, station in pairs(Config.Stations) do
                for _, garage in pairs(station.Garages) do
                    for _, returnVehicle in pairs(garage.Coords.ReturnVehicle) do
                        local distance = #(playerCoords - returnVehicle)

                        if distance <= garage.Markers.ReturnVehicle.DrawDistance then
                            DrawMarker(garage.Markers.ReturnVehicle.Type, returnVehicle.x, returnVehicle.y, returnVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, garage.Markers.ReturnVehicle.Color.r, garage.Markers.ReturnVehicle.Color.g, garage.Markers.ReturnVehicle.Color.b, 100, false, true, 2, true, false, false, false)
						    sleep = 0

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
    
end