-- Blips --
CreateThread(function ()
    for _, v in pairs(Config.Stations) do
        if v.Blip.Enable then
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