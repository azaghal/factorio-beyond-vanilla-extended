-- Prototype overrides
-- ===================

local util = require("util")

-- [No Wall Repair] Allow repairs of expensive walls.
util.remove_from_list(data.raw["wall"]["accumulator-wall"].flags, "not-repairable")
util.remove_from_list(data.raw["wall"]["solar-wall"].flags, "not-repairable")
