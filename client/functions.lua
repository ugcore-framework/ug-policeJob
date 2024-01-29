local UgCore = exports['ug-core']:GetCore()

UgDev.Functions = { }

function UgDev.Functions.ClearPed(ped)
    SetPedArmour(ped, 0)
	ClearPedBloodDamage(ped)
	ResetPedVisibleDamage(ped)
	ClearPedLastWeaponDamage(ped)
	ResetPedMovementClipset(ped, 0)
end

function UgDev.Functions.SetUniform(uniform, station)
    for k, v in pairs(station.Uniforms.Clothes) do
        if uniform == v.Name then
            TriggerEvent('ug-skinChanger:GetSkin', function (skin)
                local sex = (skin.sex == 0) and 'Male' or 'Female'
                local uniformObject = v.Uniform[sex]
		        if uniformObject and type(uniformObject) ~= 'nil' then
		        	TriggerEvent('ug-skinChanger:LoadClothes', skin, uniformObject)
                    UgCore.Functions.Notify('Police Department', Languages.GetTranslation('notification_changed_outfit'), 'success', 5000)
		        else
		        	UgCore.Functions.Notify('Police Department', Languages.GetTranslation('notification_no_outfit'), 'error', 5000)
		        end
            end)
        end
    end
end

function UgDev.Functions.OpenLocker(station)
    local playerPed = PlayerPedId()
    local playerData = UgCore.Functions.GetPlayerData()
    local grade = playerData.job.grade
    
    local elements = {
        { unselectable = true, icon = 'fas fa-shirt', title = Languages.GetTranslation('menu_locker_title') },
        { icon = 'fas fa-user', title = Languages.GetTranslation('menu_locker_citizen'), value = 'citizen' }
    }

    for _, category in pairs(station.Uniforms.Categories) do
        elements[#elements + 1] = {
            icon = category.Icon,
            title = category.Label,
            value = category.Name
        }
    end

    UgCore.Functions.OpenContextMenu('right', elements, function (menu, element)
        if element.value ~= 'citizen' then
            local uniforms = {
                { unselectable = true, icon = element.icon, title = element.title }
            }
            
            UgDev.Functions.ClearPed(playerPed)
            for k, uniform in pairs(station.Uniforms.Clothes) do
                if uniform.Category and uniform.Category == element.value then
                    if uniform.Grade and uniform.Grade <= grade then
                        uniforms[#uniforms + 1] = {
                            icon = uniform.Icon,
                            title = uniform.Label,
                            value = uniform.Name
                        }
                    end
                end
            end
            UgCore.Functions.OpenContextMenu('right', uniforms, function (menu, element)
                UgDev.Functions.SetUniform(element.value, station)
            end)
        else
            UgCore.Callbacks.TriggerCallback('ug-skin:GetPlayerSkin', function (skin)
                TriggerEvent('ug-skinChanger:LoadSkin', skin)
                UgCore.Functions.Notify('Police Department', Languages.GetTranslation('notification_changed_outfit'), 'success', 5000)
            end)
        end
    end)
end