local UgCore = exports['ug-core']:GetCore()

UgCore.Callbacks.CreateCallback('ug-policeJob:Callback:HasItem', function (source, cb, item)
    local player = UgCore.Functions.GetPlayer(source)
    local hasItem = player.Functions.HasItem(item)
    return cb(hasItem)
end)

UgCore.Callbacks.CreateCallback('ug-policeJob:Callback:HasWeapon', function (source, cb, weapon)
    local player = UgCore.Functions.GetPlayer(source)
    local hasWeapon = player.Functions.HasWeapon(weapon)
    return cb(hasWeapon)
end)

UgCore.Callbacks.CreateCallback('ug-policeJob:Callback:ToggleDuty', function (source, cb)
    local player = UgCore.Functions.GetPlayer(source)
    local playerJob = player.Functions.GetJob()
    local jobName = playerJob.name
    local jobGrade = playerJob.grade
    if playerJob and jobName then
        if string.match(jobName, 'off') then
            jobName = jobName:gsub('%off', '')
            player.Functions.SetJob(jobName, jobGrade)
            return cb(player.job)
        else
            jobName = 'off' .. jobName
            player.Functions.SetJob(jobName, jobGrade)
            return cb(player.job)
        end
    else 
        return cb(nil) 
    end
end)

UgCore.Callbacks.CreateCallback('ug-policeJob:Callback:PurchaseWeapon', function (source, cb, data)
    local player = UgCore.Functions.GetPlayer(source)
    local hasWeapon = player.Functions.HasWeapon(data.weapon)
    if not hasWeapon then
        if data.priceSystem then
            local money = player.Functions.GetMoney(data.account)
            if money >= data.price then
                player.Functions.RemoveMoney(data.account, money, 'Police Department - Weapon Purchase')
                player.Functions.GiveWeapon(data.weapon, 250)
                return cb({
                    title = 'Police Department',
                    description = Languages.GetTranslation('notification_purchased_weapon', data.label, data.price),
                    type = 'success'
                })
            end
            return cb({
                title = 'Police Department',
                description = Languages.GetTranslation('notification_no_money'),
                type = 'error'
            })
        else
            player.Functions.GiveWeapon(data.weapon, 250)
            return cb({
                title = 'Police Department',
                description = Languages.GetTranslation('notification_took_weapon', data.label),
                type = 'success'
            })
        end
    end
    return cb({
        title = 'Police Department',
        description = Languages.GetTranslation('notification_already_has_weapon', data.label),
        type = 'error'
    })
end)