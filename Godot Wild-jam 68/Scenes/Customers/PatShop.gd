extends Node

@export var section_types: Array[PackedScene] = []
@export var shop_size_min_max: Vector2

@export var tier_rarity3: Array[float] = []
@export var tier_rarity2: Array[float] = []

@export var price_range = 3

const SHOP_ITEM_BUTTON = preload("res://Scenes/Customers/Shop_item_button.tscn")

@onready var v_box_container = $Control/Panel/VBoxContainer
@onready var item_price = %Price
@onready var item_name = %Name
@onready var item_image = %Item_image

@onready var pat_quote = %PatQuote

@onready var v_box_container2 = %VBoxContainer

var _section: AnimatedSprite2D

func _ready():
	var rng = RandomNumberGenerator.new()
	var shop_size = rng.randi_range(shop_size_min_max.x, shop_size_min_max.y)
	
	for i in range(shop_size):
		var button = SHOP_ITEM_BUTTON.instantiate()
		var index = rng.randi() % section_types.size()
		var section = section_types[index].instantiate()
		
		var tier:int
		if int(section.type) == 2:
			tier = get_random_tier(tier_rarity2) + 1
		else:
			tier = get_random_tier(tier_rarity3) + 1
		
		section.tier = tier
		section.set_animation_types()
		var price = 5 * tier
		price = randi_range(price - price_range, price + price_range)
		
		v_box_container.add_child(button)
		button.load_values(section, tier, price)
		
	pat_quote.text = Quotes.get_quote()

func get_random_tier(tier_rarity):
	var index = 0
	var cumulative_probability = 0.0
	var random_value = randf()

	# Iterate through the array to find the index
	for i in range(tier_rarity.size()):
		cumulative_probability += tier_rarity[i]
		if random_value <= cumulative_probability:
			index = i
			break
	return index

func load_item(section:AnimatedSprite2D, tier, price):
	var tier_str:String
	for i in range(tier):
		tier_str += "I"
	
	item_name.text = section.name + " " + tier_str
	item_price.text = str(price)
	item_image.set_sprite_frames(section.get_sprite_frames())
	item_image.play()
	_section = section

func _on_buy_button_pressed():
	var node = get_parent().get_node("CustomerCtrl/CustomerPanel/VBoxContainer")
	node.unload_pat_shop(_section)

func _on_skip_pressed():
	var node = get_parent().get_node("CustomerCtrl/CustomerPanel/VBoxContainer")
	node.unload_pat_shop(null)
