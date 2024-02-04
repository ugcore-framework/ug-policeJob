local UgCore = exports['ug-core']:GetCore()

-- Blips --
CreateThread(function ()
    for _, v in pairs(Config.Stations) do
        if v.Blip.Enabled then
            local blip = AddBlipForCoord(v.Blip.Coords.x, v.Blip.Coords.y, v.Blip.Coords.z)
            SetBlipSprite(blip, v.Blip.Sprite)
            SetBlipAsShortRange(blip, true)
            SetBlipScale(blip, v.Blip.Scale)
            SetBlipColour(blip, v.Blip.Color)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(v.Name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

-- Handcuf Logic --
CreateThread(function ()
    while true do
        Wait(0)
        if UgDev.Escorted then
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)
            EnableControlAction(0, 2, true)
            EnableControlAction(0, 245, true)
            EnableControlAction(0, 38, true)
            EnableControlAction(0, 322, true)
            EnableControlAction(0, 249, true)
            EnableControlAction(0, 46, true)
        end

        if UgDev.Handcuffed then
            DisableControlAction(0, 24, true)  -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true)  -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1

            DisableControlAction(0, 45, true)  -- Reload
            DisableControlAction(0, 22, true)  -- Jump
            DisableControlAction(0, 44, true)  -- Cover
            DisableControlAction(0, 37, true)  -- Select Weapon
            DisableControlAction(0, 23, true)  -- Also 'enter'?

            DisableControlAction(0, 288, true) -- Disable phone
            DisableControlAction(0, 289, true) -- Inventory
            DisableControlAction(0, 170, true) -- Animations
            DisableControlAction(0, 167, true) -- Job

            DisableControlAction(0, 73, true)  -- Disable clearing animation
            DisableControlAction(2, 199, true) -- Disable pause screen

            DisableControlAction(0, 59, true)  -- Disable steering in vehicle
            DisableControlAction(0, 71, true)  -- Disable driving forward in vehicle
            DisableControlAction(0, 72, true)  -- Disable reversing in vehicle

            DisableControlAction(2, 36, true)  -- Disable going stealth

            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            DisableControlAction(0, 75, true)  -- Disable exit vehicle
            DisableControlAction(27, 75, true) -- Disable exit vehicle
            EnableControlAction(0, 249, true)  -- Added for talking while cuffed
            EnableControlAction(0, 46, true)   -- Added for talking while cuffed
            if (not IsEntityPlayingAnim(PlayerPedId(), 'mp_arresting', 'idle', 3) and not IsEntityPlayingAnim(PlayerPedId(), 'mp_arrest_paired', 'crook_p2_back_right', 3)) and not UgDev.PlayerDead then
                UgCore.Functions.RequestAnimDict('mp_arresting', function ()
                    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, false, false, false)
                end)
            end
        end

        if not UgDev.Handcuffed and not UgDev.Escorted then
            Wait(2000)
        end
    end
end)