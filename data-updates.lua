-- Control overrides
-- =================


local control_overrides = {
    ['Faster_Cars'] = {
        -- Avoid conflicts, make the bindingsm ore accessible, and kinda reuse same bindings as for the helicopter.
        { name = "car-mk2-change-speed", key_sequence = "SHIFT + W", alternative_key_sequence = "" },
        { name = "car-mk2-ebrake", key_sequence = "SHIFT + S", alternative_key_sequence = "" }
    },
    ['fluid_permutations_fixed'] = {
        -- Use more accessible inputs for fluid permutations (and avoid conflicts with other custom control overrides).
        { name = "next-ingredients-fluid-recipe", key_sequence = "[", alternative_key_sequence = "" },
        { name = "previous-ingredients-fluid-recipe", key_sequence = "", alternative_key_sequence = "" },
        { name = "next-results-fluid-recipe", key_sequence = "]", alternative_key_sequence = "" },
        { name = "previous-results-fluid-recipe", key_sequence = "", alternative_key_sequence = "" }
    },
    ['HelicopterRevival'] = {
        -- Avoid binding conflicts, and use more convenient bindings.
        { name = "heli-up", key_sequence = "SHIFT + W", alternative_key_sequence = "" },
        { name = "heli-down", key_sequence = "SHIFT + S", alternative_key_sequence = "" },

        -- Disable excess control bindings. Height adjustment does not seem to matter much. Floodlight toggle seems like
        -- more of a gimmick, and remote buttons do not seem to work at all (and there is already an icon in upper-left
        -- for this functionality).
        { name = "heli-zaa-height-increase", key_sequence = "", alternative_key_sequence = "" },
        { name = "heli-zab-height-decrease", key_sequence = "", alternative_key_sequence = "" },
        { name = "heli-zba-toogle-floodlight", key_sequence = "", alternative_key_sequence = "" },
        { name = "heli-zca-remote-heli-follow", key_sequence = "", alternative_key_sequence = "" },
        { name = "heli-zcb-remote-open", key_sequence = "", alternative_key_sequence = "" }
    },
    ['Side Inserters'] = {
        -- Avoid some of the overlaps with existing controls, and try to make the bindings more accessible.
        -- NOTE: Drop distance toggle is bound to item pickup, which could be annoying long term, but it is conveniently positioned.
        { name = "rotate-inserter-pickup", key_sequence = "ALT + R", alternative_key_sequence = "" },
        { name = "reverse-rotate-inserter-pickup", key_sequence = "", alternative_key_sequence = "" },
        { name = "inserter-drop-distance-toggle", key_sequence = "F", alternative_key_sequence = "" },
        { name = "inserter-drop-lateral-adjust", key_sequence = "ALT + F", alternative_key_sequence = "" },
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


-- Prototype overrides
-- ===================

-- [Asteroid Mining] Align ore/chunk visuals with Realistic Ores.
data.raw["item"]["iron-ore-chunk"]["icons"][2].tint = {a = 0.8,r = 144,g = 24,b = 8}
data.raw["item"]["asteroid-iron-ore"]["icons"][2].tint = {a = 0.8,r = 144,g = 24,b = 8}
data.raw["item"]["copper-ore-chunk"]["icons"][2].tint = {a = 0.8,r = 0,g = 77,b = 59}
data.raw["item"]["asteroid-copper-ore"]["icons"][2].tint = {a = 0.8,r = 0,g = 77,b = 59}
data.raw["item"]["uranium-ore-chunk"]["icons"][2].tint = {a = 0.8,r = 70,g = 98,b = 0}
data.raw["item"]["asteroid-uranium-ore"]["icons"][2].tint = {a = 0.8,r = 70,g = 98,b = 0}

-- [Platforms] Align platform stack-size with landfill.
data.raw["item"]["platform"].stack_size = 100

-- [Faster Cars] Tweak the speed so the cars for a smoother progression curve.
data.raw["car"]["carmk2"].friction = 0.0018
data.raw["car"]["carmk3"].friction = 0.0025

-- [Faster Cars] Re-add the gun turret to second tier car (leave the third tier unarmed).
data.raw["car"]["carmk2"].guns = table.deepcopy(data.raw.car["car"].guns)
data.raw["car"]["carmk2"].turret_animation = table.deepcopy(data.raw.car["car"].turret_animation)

-- [Faster Cars] Re-enable damage from trees, after all cars are not tanks.
data.raw["car"]["carmk2"].immune_to_tree_impacts = false
data.raw["car"]["carmk3"].immune_to_tree_impacts = false

-- [RealisticFlashlight/Clockwork] Set smaller halo size to go along with pitch-dark settings of Clockwork. Tweak some
-- of the modded entities as well.
local character = data.raw.player and data.raw.player.player or data.raw.character and data.raw.character.character
character.light[1].size = 10
data.raw["spider-vehicle"]["sp-spiderling"].graphics_set.light[1].size = 15
data.raw["spider-vehicle"]["sp-spiderling"].graphics_set.light[1].minimum_darkness = 0.1
data.raw["spider-vehicle"]["sp-spiderling"].graphics_set.light[1].intensity = 0.2

-- [Kontraptions] Disable long range delivery drone by hiding related technology and items.
data.raw["technology"]["long-range-delivery-drone"].hidden = true
data.raw["technology"]["long-range-delivery-drone"].enabled = false
table.insert(data.raw["item"]["long-range-delivery-drone-depot"].flags, "hidden")
table.insert(data.raw["item"]["long-range-delivery-drone-request-depot"].flags, "hidden")
table.insert(data.raw["item"]["long-range-delivery-drone"].flags, "hidden")
data.raw["recipe"]["long-range-delivery-drone-depot"].hidden = true
data.raw["recipe"]["long-range-delivery-drone-depot"].enabled = false
data.raw["recipe"]["long-range-delivery-drone-request-depot"].hidden = true
data.raw["recipe"]["long-range-delivery-drone-request-depot"].enabled = false
data.raw["recipe"]["long-range-delivery-drone"].hidden = true
data.raw["recipe"]["long-range-delivery-drone"].enabled = false

-- [Kontraptions] Disable the motion sensors - can't get them to work.
data.raw["technology"]["motion-sensor"].hidden = true
data.raw["technology"]["motion-sensor"].enabled = false
data.raw["item"]["enemy-motion-sensor"].flags = {"hidden"}
data.raw["item"]["friendly-motion-sensor"].flags = {"hidden"}
data.raw["recipe"]["enemy-motion-sensor"].hidden = true
data.raw["recipe"]["enemy-motion-sensor"].enabled = false
data.raw["recipe"]["friendly-motion-sensor"].hidden = true
data.raw["recipe"]["friendly-motion-sensor"].enabled = false

-- [Kontraptions] Disable pressure plate - can't get it to work.
data.raw["technology"]["pressure-plate"].hidden = true
data.raw["technology"]["pressure-plate"].enabled = false
data.raw["item"]["pressure-plate"].flags = {"hidden"}
data.raw["recipe"]["pressure-plate"].hidden = true
data.raw["recipe"]["pressure-plate"].enabled = false

-- [Kontraptions] Disable remote explosives - does not feel like it has any real purpose to it.
data.raw["technology"]["remote-explosive"].hidden = true
data.raw["technology"]["remote-explosive"].enabled = false
data.raw["item"]["remote-explosive"].flags = {"hidden"}
data.raw["recipe"]["remote-explosive"].hidden = true
data.raw["recipe"]["remote-explosive"].enabled = false

-- [Kontraptions] Disable the sign post - industrial display plates should be sufficient.
data.raw["item"]["sign-post"].flags = {"hidden"}
data.raw["recipe"]["sign-post"].hidden = true
data.raw["recipe"]["sign-post"].enabled = false

-- [Kontraptions] Disable torches - there's already burner-based copper lamp in the game.
data.raw["item"]["torch"].flags = {"hidden"}
data.raw["recipe"]["torch"].hidden = true
data.raw["recipe"]["torch"].enabled = false
