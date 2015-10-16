
minetest.register_node("steel:plate_soft", {
	description = "weiche Stahlplatte",
	tiles = {"steelplatesoft.png"},
	is_ground_content = true,
	groups = {cracky=2},
})

minetest.register_node("steel:plate_hard", {
	description = "harte Stahlplatte",
	tiles = {"steelplatehard.png"},
	is_ground_content = true,
	groups = {cracky=1},
})

minetest.register_node("steel:plate_rusted", {
	description = "verrostete Stahlplatte",
	tiles = {"steel_rusted.png"},
	is_ground_content = true,
	groups = {cracky=1,choppy=1},
})

minetest.register_node("steel:strut", {
	drawtype = "glasslike",
	description = "Gitter",
	tiles = {"strut.png"},
	is_ground_content = true,
	paramtype= "light",
	groups = {choppy=1,cracky=1},
	sounds =  default.node_sound_stone_defaults(),
})
minetest.register_node("steel:grate_soft", {
	description = "weicher Stahlzaun",
	drawtype = "fencelike",
	tiles = {"worldgratesoft.png"},
	inventory_image = "gratesoft.png",
	wield_image = "gratesoft.png",
	paramtype = "light",
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {cracky=2,choppy=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("steel:grate_hard", {
	description = "harter Stahlzaun",
	drawtype = "fencelike",
	tiles = {"worldgratehard.png"},
	inventory_image = "gratehard.png",
	wield_image = "gratehard.png",
	paramtype = "light",
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {cracky=1,choppy=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("steel:roofing", {
	description = "Blech",
	drawtype = "raillike",
	tiles = {"corrugated_steel.png", "corrugated_steel.png", "corrugated_steel.png", "corrugated_steel.png"},
	inventory_image = "corrugated_steel.png",
	wield_image = "corrugated_steel.png",
	paramtype = "light",
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -0.4, 1/2},
	},
	groups = {bendy=2,snappy=1,dig_immediate=2},
})

	--steel scrap are only used to recover ingots

minetest.register_craftitem("steel:scrap", {
	description = "steel scraps",
	inventory_image = "scrap.png",
})

	--recipes

minetest.register_craft({
	output = 'steel:plate_soft 2',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot'},
	}
})



minetest.register_craft({
	type = "cooking",
	output = "steel:plate_hard",
	recipe = "steel:plate_soft",
})


minetest.register_craft({
	output = 'steel:grate_soft 3',
	recipe = {
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'default:steel_ingot', '', 'default:steel_ingot'},
	}
})


minetest.register_craft({
	type = "cooking",
	output = "steel:grate_hard",
	recipe = "steel:grate_soft",
})

local function scra(num, input)
minetest.register_craft({
	output = 'steel:scrap '..num,
	recipe = {
		{'steel:'..input},
	}
})
end

scra('2', 'strut')
scra('2', 'grate_soft')
scra('2', 'grate_hard')
scra('1', 'roofing')
scra('4', 'plate_soft')
scra('4', 'plate_hard')

minetest.register_craft({
	output = 'steel:strut 5',
	recipe = {
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''},
		{'default:steel_ingot', '', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'steel:roofing 6',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'default:iron_lump',
	recipe = {
		{'steel:scrap', 'steel:scrap'},
	}
})
