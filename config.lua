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
            {
                UsePrices = true,   -- Use the Price System or not.
                Account = 'cash',   -- Account to use in the price system (cash, bank).
                Radius = 2.5,       -- Radius of the armory zone.
                Distance = 2.5,     -- Distance to interact with.
                Coords = vector3(452.3931, -980.1600, 30.6896),
                Items = {
                    { 
                        Name = 'weapon_combatpistol',   -- Item name.
                        Label = 'Combat Pistol',        -- Item label to show.
                        Type = 'weapon',                -- Type of the item (weapon, item).
                        Amount = 1,                     -- Amount to give (Only works if the type is 'item').
                        Icon = 'fas fa-gun',            -- Icon to show.
                        Grade = 0,                      -- Grade required to show.
                        Price = 250                     -- Price to purchase.
                    },
                    { 
                        Name = 'handcuffs',             -- Item name.
                        Label = 'Handcuffs',            -- Item label to show.
                        Type = 'item',                  -- Type of the item (weapon, item).
                        Amount = 1,                     -- Amount to give (Only works if the type is 'item').
                        Icon = 'fas fa-handucffs',      -- Icon to show.
                        Grade = 0,                      -- Grade required to show.
                        Price = 50                      -- Price to purchase.
                    },
                },
            }
        },
        Garages = {
            {
                Radius = 2.5,       -- Radius of the armory zone.
                Distance = 2.5,     -- Distance to interact with.
                Coords = {
                    Spawner = {
                        vector3(459.2113, -1008.0058, 28.2590)
                    },
                    SpawnLocation = {
                        vector4(444.9496, -1017.9050, 28.6263, 89.3090)
                    },
                    ReturnVehicle = {
                        vector3(463.6954, -1014.9435, 28.0742),
                        vector3(463.7283, -1019.3928, 28.1030)
                    }
                },
                Categories = {
                    {
                        Name = 'vehicle',
                        Label = 'Patrol Vehicles',
                        Icon = 'fas fa-car'
                    },
                    {
                        Name = 'special',
                        Label = 'Special Vehicles',
                        Icon = 'fas fa-truck'
                    }
                },
                Vehicles = {
                    {
                        Name = 'police',                -- Name of the vehicle (spawn code).
                        Label = 'Patrol Vehicle',       -- Label of the uniform.
                        Icon = 'fas fa-car',            -- Icon in the menu.
                        Category = 'vehicle',           -- Category of the clothes.
                        Grade = 0,                      -- Grade required to equip this uniform.
                    },
                    {
                        Name = 'police2',               -- Name of the vehicle (spawn code).
                        Label = 'Patrol Vehicle #2',    -- Label of the uniform.
                        Icon = 'fas fa-car',            -- Icon in the menu.
                        Category = 'vehicle',           -- Category of the clothes.
                        Grade = 0,                      -- Grade required to equip this uniform.
                    },
                    {
                        Name = 'riot',                  -- Name of the vehicle (spawn code).
                        Label = 'Armored Vehicle',      -- Label of the uniform.
                        Icon = 'fas fa-truck',          -- Icon in the menu.
                        Category = 'special',           -- Category of the clothes.
                        Grade = 2,                      -- Grade required to equip this uniform.
                    }
                }
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