-- Mod setting overrides
-- =====================

local mod_setting_overrides = {
    ['alien-biomes'] = {
        startup = {
            -- Get rid of some of the tackier-looking biomes. Helps reduce tile count as well.
            { name = "alien-biomes-include-dirt-aubergine", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-dirt-dustyrose", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-dirt-purple", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-dirt-red", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-dirt-violet", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-grass-mauve", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-grass-purple", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-grass-red", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-grass-turquoise", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-grass-violet", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-sand-aubergine", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-sand-dustyrose", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-sand-purple", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-sand-red", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-sand-violet", type = "string-setting", default = "Disabled" },
            { name = "alien-biomes-include-volcanic-purple", type = "string-setting", default = "Disabled" }
        },
    },
    ['Asteroid_Mining'] = {
        startup = {
            -- Allow use of productivity modules for asteroid ore processing to make it a bit more attractive in the
            -- end-game.
            { name = "astmine-allowprod", type = "bool-setting", default = true }
        }
    },
    ['cargo-ships'] = {
        startup = {
            -- Generate all oil on water, forcing the player to utilise tankers (and the mod) to obtain it. Increase
            -- richness of generated oil to compensate for reduced accessbility.
            { name = "no_oil_on_land", type = "bool-setting", default = true },
            { name = "no_oil_for_oil_rig", type = "bool-setting", default = true },
            { name = "oil_richness", type = "string-setting", default = "good" }
        }
    },
    ['lex-aircraft'] = {
        startup = {
            -- Rebalance gunship speed so it would not out-compete all other forms of transportation.
            { name = "lex-flying-gunship-speed-settings", type = "double-setting", default = 140 },
        }
    },
    ['PavementDriveAssistContinued'] = {
        startup = {
            -- Re-enable technology requirement. (@beyond-vanilla-qol)
            { name = "PDA-setting-tech-required", type = "bool-setting", default = true },
            -- Re-enable smart roads technology. (@beyond-vanilla-qol)
            { name = "PDA-setting-smart-roads-enabled", type = "bool-setting", default = true }
        }
    },
    ['platforms'] = {
        startup = {
            -- Use a nicer-looking texture/layout for platforms.
            { name = "platform-theme", type = "string-setting", default = "Brick" },
            -- Keep the landfill in the game, thus making the platforms simply a more expensive alternative.
            { name = "replace-landfill", type = "bool-setting", default = false }
        }
    },
    ['SpidertronPatrols'] = {
        startup = {
            -- Re-enable spiderlings and docks. (@beyond-vanilla-qol)
            { name = "sp-enable-dock", type = "bool-setting", default = true },
            { name = "sp-enable-spiderling", type = "bool-setting", default = true }
        }
    },
}

for mod, scope_settings in pairs(mod_setting_overrides) do
    for scope, settings in pairs(scope_settings) do
        for _, setting in ipairs(settings) do
            if data.raw[setting.type][setting.name] then
                data.raw[setting.type][setting.name].default_value = setting.default
            else
                print("[ERROR] (beyond-vanilla-qol) Unknown setting, skipping: " .. setting.type .. "/" .. mod .. "/" .. setting.name)
            end
        end
    end
end
