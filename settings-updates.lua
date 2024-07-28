-- Mod setting overrides
-- =====================

local mod_setting_overrides = {
    ['PavementDriveAssistContinued'] = {
        startup = {
            -- Re-enable technology requirement. (@beyond-vanilla-qol)
            { name = "PDA-setting-tech-required", type = "bool-setting", default = true },
            -- Re-enable smart roads technology. (@beyond-vanilla-qol)
            { name = "PDA-setting-smart-roads-enabled", type = "bool-setting", default = true }
        }
    },
    ['SpidertronPatrols'] = {
        startup = {
            -- Re-enable spiderlings and docks. (@beyond-vanilla-qol)
            { name = "sp-enable-dock", type = "bool-setting", default = true },
            { name = "sp-enable-spiderling", type = "bool-setting", default = true }
        }
    }
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
