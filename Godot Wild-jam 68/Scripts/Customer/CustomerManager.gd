extends Node

@onready var timer = $Timer
@export var cooldown = 6.0
@export var max_customer = 5

@onready var v_box_container = %VBoxContainer
@onready var spaceship_manager = %SpaceshipManager

const CUSTOMER_LABEL = preload("res://Scenes/Inventory/customer_label.tscn")
const MERCHANT_SHOP_BUTTON = preload("res://Scenes/UI/merchant_shop_button.tscn")

var current_customer_index = 4
@export var merchant_index = 5

@export var customer_variety:float = 0.2

var customer_count = 0

func _ready():
	timer.wait_time = cooldown

func load_customer():
	var customer = CUSTOMER_LABEL.instantiate()
	
	var item = load_customer_item()
	
	customer.get_child(0).text = item.name
	customer.get_child(1).text = str(item.price)
	customer.get_child(2).texture = item.icon
	customer.item = item
	
	v_box_container.add_child(customer)

func load_customer_item():
	var total_tiers = spaceship_manager.get_total_tiers()
	var normalized_tiers_value = (total_tiers - 4) / 29
	normalized_tiers_value += abs(randf_range(-customer_variety, customer_variety))
	
	var index = int(normalized_tiers_value * Inventory.all_products.size())
	return Inventory.all_products[index]

func load_merchant():
	var merchant = MERCHANT_SHOP_BUTTON.instantiate()
	
	merchant.get_child(0).get_child(0).text = "Pat's Shop"
	
	v_box_container.add_child(merchant)

func _on_timer_timeout():
	current_customer_index += 1
	if current_customer_index % merchant_index == 0:
		load_merchant()
	else:
		load_customer()
	
	customer_count = v_box_container.get_child_count() - 1
	if customer_count > max_customer:
		v_box_container.get_child(1).queue_free()
