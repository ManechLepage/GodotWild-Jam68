extends Node

var items = {}

var all_products: Array[Item] = []

var generator_animations: Array[SpriteFrames] = []
var smelter_animations: Array[SpriteFrames] = []
var forge_animations: Array[SpriteFrames] = []
#var front_animation: SpriteFrames = "res://Graphics/sections/Front/front.tres"


func load_all_items(item_list: Array[Item]):
	all_products = item_list

func load_products_from_tier(tier: int):
	var products = []
	for i in all_products:
		if i.forge_tier == tier:
			products.append(i)
	return products
