local spoilage_solution_lib = require("__spoilage-solution-lib__.lib")
local util = require("util")

--- @type SpoilageSolutionLib.CannedPerishableDefinition
local canned_seawilt_def = {
  type = "item",
  name = "seawilt",
  icons = {{icon = "__aquilo-seabloom-algaculture__/graphics/icons/seawilt.png", icon_size = 64}},
  order = "e[fill-barrel]-c[canned-aquilo]-a[canned-seawilt]",
  tint = util.color("945344"),
  default_import_location = "aquilo",
  no_spoilage = true,
}

spoilage_solution_lib.create_canned_item(canned_seawilt_def)
spoilage_solution_lib.create_uncanning_recipe(canned_seawilt_def)

--- @type SpoilageSolutionLib.CannedPerishableDefinition
local canned_seaweed_def = {
  type = "capsule",
  name = "seaweed",
  icons = {{icon = "__aquilo-seabloom-algaculture__/graphics/icons/seaweed.png", icon_size = 64}},
  order = "e[fill-barrel]-c[canned-aquilo]-b[canned-seaweed]",
  tint = util.color("a8ac76"),
  default_import_location = "aquilo",
  spoil_result = "canned-seawilt",
}

spoilage_solution_lib.create_canned_perishable(canned_seaweed_def)

--- @type SpoilageSolutionLib.CannedPerishableDefinition
local canned_seaweed_snack_def = {
  type = "capsule",
  name = "seaweed-snack",
  icons = {{icon = "__aquilo-seabloom-algaculture__/graphics/icons/seaweed-snack.png", icon_size = 64}},
  order = "e[fill-barrel]-c[canned-aquilo]-c[canned-seaweed-snack]",
  tint = util.color("51592f"),
  default_import_location = "aquilo",
  spoil_result = "canned-seawilt",
}

spoilage_solution_lib.create_canned_perishable(canned_seaweed_snack_def)

if mods["spoilage-solution-tweaks"] then
  --- @type SpoilageSolutionLib.FrozenPerishableDefinition
  local frozen_seawilt_def = {
    type = "item",
    name = "seawilt",
    icons = {{icon = "__aquilo-seabloom-algaculture__/graphics/icons/seawilt.png", icon_size = 64}},
    order = "b[agriculture]-d[frozen-agro]-a[frozen-seawilt]",
    subgroup = "agriculture-processes",
    default_import_location = "aquilo",
    no_spoilage = true,
  }

  spoilage_solution_lib.create_frozen_item(frozen_seawilt_def)
  spoilage_solution_lib.create_unfreezing_recipe(frozen_seawilt_def)
end

--- @type SpoilageSolutionLib.FrozenPerishableDefinition
local frozen_seaweed_def = {
  type = "capsule",
  name = "seaweed",
  icons = {{icon = "__aquilo-seabloom-algaculture__/graphics/icons/seaweed.png", icon_size = 64}},
  order = "b[agriculture]-d[frozen-agro]-b[frozen-seaweed]",
  subgroup = "agriculture-processes",
  default_import_location = "aquilo",
  spoil_result = "seawilt",
}

spoilage_solution_lib.create_frozen_perishable(frozen_seaweed_def)

--- @type SpoilageSolutionLib.FrozenPerishableDefinition
local frozen_seabloom_def = {
  type = "capsule",
  name = "seabloom",
  icons = {{icon = "__aquilo-seabloom-algaculture__/graphics/icons/seabloom.png", icon_size = 64}},
  order = "b[agriculture]-d[frozen-agro]-c[frozen-seabloom]",
  subgroup = "agriculture-processes",
  default_import_location = "aquilo",
  spoil_result = mods["spoilage-solution-tweaks"] and "frozen-seawilt" or "seawilt",
}

spoilage_solution_lib.create_frozen_perishable(frozen_seabloom_def)
