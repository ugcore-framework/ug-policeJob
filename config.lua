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
                Radius = 2.0,
                Coords = vector3(440.0441, -975.1539, 31.5221)
            }
        },
        Lockers = {
            { Coords = vector3(449.8108, -993.3754, 30.6896) }
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
                vector3(452.4399, -980.1115, 30.6896)
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