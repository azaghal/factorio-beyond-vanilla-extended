-- Control overrides
-- =================


local control_overrides = {
    ['fluid_permutations_fixed'] = {
        -- Use more accessible inputs for fluid permutations (and avoid conflicts with other custom control overrides).
        { name = "next-ingredients-fluid-recipe", key_sequence = "[", alternative_key_sequence = "" },
        { name = "previous-ingredients-fluid-recipe", key_sequence = "", alternative_key_sequence = "" },
        { name = "next-results-fluid-recipe", key_sequence = "]", alternative_key_sequence = "" },
        { name = "previous-results-fluid-recipe", key_sequence = "", alternative_key_sequence = "" }
    }
}

-- Piggy-back off of the base mod setting.
if settings.startup["beyond-vanilla-qol-enable-modpack-controls-configuration"] then
    for mod, controls in pairs(control_overrides) do
        for _, control in ipairs(controls) do
            if data.raw["custom-input"][control.name] then
                data.raw["custom-input"][control.name].key_sequence = control.key_sequence
                data.raw["custom-input"][control.name].alternative_key_sequence = control.alternative_key_sequence
            else
                print("[ERROR] (beyond-vanilla-qol-plus) Unknown control, skipping: " .. mod .. "/" .. control.name)
            end
        end
    end
end


-- Visual overrides
-- ================

-- Align Asteroid Mining ores/chunks with Realistic Ores colours/textures.
data.raw["item"]["iron-ore-chunk"]["icons"][2].tint = {a = 0.8,r = 144,g = 24,b = 8}
data.raw["item"]["asteroid-iron-ore"]["icons"][2].tint = {a = 0.8,r = 144,g = 24,b = 8}
data.raw["item"]["copper-ore-chunk"]["icons"][2].tint = {a = 0.8,r = 0,g = 77,b = 59}
data.raw["item"]["asteroid-copper-ore"]["icons"][2].tint = {a = 0.8,r = 0,g = 77,b = 59}
data.raw["item"]["uranium-ore-chunk"]["icons"][2].tint = {a = 0.8,r = 70,g = 98,b = 0}
data.raw["item"]["asteroid-uranium-ore"]["icons"][2].tint = {a = 0.8,r = 70,g = 98,b = 0}
