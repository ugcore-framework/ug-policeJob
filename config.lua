Config = { }

Config.Language = 'en'

Config.UseTarget = true         -- Switch to false if you don't want to use the eye system. (Requirement: ox-target)

Config.Items = {
    Handcuffs = {
        Item = 'handcuffs'
    }
}

Config.Stations = {
    {
        Name = 'Police Department',
        Duty = {
            { 
                Jobs = { 'police', 'offpolice' },   -- Jobs that can use the duty system.
                Distance = 2.5,                     -- Distance to interact with.
                Coords = vector3(440.0441, -975.1539, 31.5221),
                Target = {
                    Model = 'prop_crt_mon_01',  -- Model of the object to use with target. 
                }
            }
        },
        Lockers = {
            {
                Radius = 2.5,       -- Radius of the locker zone.
                Distance = 2.5,     -- Distance to interact with.
                Coords = vector3(449.8108, -993.3754, 30.6896) 
            }
        },
        Armory = {
            UsePrices = false,                      -- Price System
            Weapons = {
                { 
                    Name = 'weapon_combatpistol',   -- Weapon name to show.
                    Grade = 0,                      -- Grade required to show.
                    Price = 250                     -- Price to purchase.
                }
            },
            Coords = { 
                { vector3(452.4399, -980.1115, 30.6896) }
            }
        },
        Uniforms = {
            Categories = {
                {
                    Name = 'patrol',
                    Label = 'Patrols',
                    Icon = 'fas fa-handcuffs'
                },
                {
                    Name = 'transit',
                    Label = 'Transit',
                    Icon = 'fas fa-road-barrier'
                }
            },
            Clothes = {
                {
                    Name = 'patrol1',           -- Name of the uniform (must be unique).
                    Label = 'Patrol #1',        -- Label of the uniform.
                    Icon = 'fas fa-handcuffs',  -- Icon in the menu.
                    Category = 'patrol',        -- Category of the clothes.
                    Grade = 0,                  -- Grade required to equip this uniform.
                    Uniform = {
                        Male = {
                            tshirt_1 = 58,  tshirt_2 = 0,
			                torso_1 = 55,   torso_2 = 0,
			                decals_1 = 0,   decals_2 = 0,
			                arms = 41,
			                pants_1 = 25,   pants_2 = 0,
			                shoes_1 = 25,   shoes_2 = 0,
			                helmet_1 = 46,  helmet_2 = 0,
			                chain_1 = 0,    chain_2 = 0,
			                ears_1 = 2,     ears_2 = 0
                        },
                        Female = {
                            tshirt_1 = 35,  tshirt_2 = 0,
			                torso_1 = 48,   torso_2 = 0,
			                decals_1 = 0,   decals_2 = 0,
			                arms = 44,
			                pants_1 = 34,   pants_2 = 0,
			                shoes_1 = 27,   shoes_2 = 0,
			                helmet_1 = 45,  helmet_2 = 0,
			                chain_1 = 0,    chain_2 = 0,
			                ears_1 = 2,     ears_2 = 0
                        }
                    }
                },
                {
                    Name = 'transit1',              -- Name of the uniform (must be unique).
                    Label = 'Transit #1',           -- Label of the uniform.
                    Icon = 'fas fa-road-barrier',   -- Icon in the menu.
                    Category = 'transit',           -- Category of the clothes.
                    Grade = 0,                      -- Grade required to equip this uniform.
                    Uniform = {
                        Male = {
                            tshirt_1 = 59,  tshirt_2 = 1,
			                torso_1 = 55,   torso_2 = 0,
			                decals_1 = 0,   decals_2 = 0,
			                arms = 41,
			                pants_1 = 25,   pants_2 = 0,
			                shoes_1 = 25,   shoes_2 = 0,
			                helmet_1 = 46,  helmet_2 = 0,
			                chain_1 = 0,    chain_2 = 0,
			                ears_1 = 2,     ears_2 = 0
                        },
                        Female = {
                            tshirt_1 = 36,  tshirt_2 = 1,
			                torso_1 = 48,   torso_2 = 0,
			                decals_1 = 0,   decals_2 = 0,
			                arms = 44,
			                pants_1 = 34,   pants_2 = 0,
			                shoes_1 = 27,   shoes_2 = 0,
			                helmet_1 = 45,  helmet_2 = 0,
			                chain_1 = 0,    chain_2 = 0,
			                ears_1 = 2,     ears_2 = 0
                        }
                    }
                }
            }
        },
        Blip = {
            Enable = true,
            Coords = vector3(441.2831, -983.0054, 30.6896),
            Sprite = 60,
            Scale = 0.8,
            Color = 29
        }
    }
}