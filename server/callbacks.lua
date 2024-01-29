local UgCore = exports['ug-core']:GetCore()

UgCore.Callbacks.CreateCallback('ug-policeJob:Callback:HasItem', function (source, cb, item)
    local player = UgCore.Functions.GetPlayer(source)
    local hasItem = player.Functions.HasItem(item)
    return cb(hasItem)
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