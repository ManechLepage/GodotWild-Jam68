extends Node

var items = {}

var all_products: Array[Item] = []

var generator_animations: Array[SpriteFrames] = [
	load("res://Graphics/sections/Generator/generator1.tres"),
	load("res://Graphics/sections/Generator/generator2.tres"),
	load("res://Graphics/sections/Generator/generator3.tres")
	]
var smelter_animations: Array[SpriteFrames] = [
	load("res://Graphics/sections/Smelter/smelter1.tres"),
	load("res://Graphics/sections/Smelter/smelter2.tres")
]
var forge_animations: Array[SpriteFrames] = [
	load("res://Graphics/sections/Forge/forge1.tres"),
	load("res://Graphics/sections/Forge/forge2.tres"),
	load("res://Graphics/sections/Forge/forge3.tres")
]
var front_animation: SpriteFrames = load("res://Graphics/sections/Front/front.tres")

var seperators: Array[SpriteFrames] = [
	load("res://Graphics/sections/Seperator/seperator.tres"),
	load("res://Graphics/sections/Seperator/seperator2.tres"),
	load("res://Graphics/sections/Seperator/seperator3.tres"),
	load("res://Graphics/sections/Seperator/seperator1-2.tres"),
	load("res://Graphics/sections/Seperator/seperator1-3.tres"),
	load("res://Graphics/sections/Seperator/seperator2-3.tres")
]

func load_all_items(item_list: Array[Item]):
	all_products = item_list

func load_products_from_tier(tier: int):
	var products = []
	for i in all_products:
		if i.forge_tier == tier:
			products.append(i)
	return products

func sort_items_by_price(items:Array):
	var sorted_list = items.duplicate()

	var n = sorted_list.size()
	for i in range(n):
		for j in range(n - i - 1):
			if sorted_list[j].price > sorted_list[j + 1].price:
				var temp = sorted_list[j]
				sorted_list[j] = sorted_list[j + 1]
				sorted_list[j + 1] = temp

	return sorted_list
