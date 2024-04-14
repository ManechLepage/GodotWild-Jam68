extends Node

@onready var timer = $Timer
@export var cooldown = 6.0
@export var max_customer = 5

@onready var v_box_container = $"../CustomerPanel/VBoxContainer"

const CUSTOMER_LABEL = preload("res://Scenes/Inventory/customer_label.tscn")
const MERCHANT_SHOP_BUTTON = preload("res://Scenes/UI/merchant_shop_button.tscn")

var current_customer_index = 0
var merchant_index = 5

var customer_count = 0

func _ready():
	timer.wait_time = cooldown

func load_customer():
	var customer = CUSTOMER_LABEL.instantiate()
	
	var item = Inventory.all_products[randi() % Inventory.all_products.size()]
	
	customer.get_child(0).text = item.name
	customer.get_child(1).text = str(item.price)
	customer.get_child(2).texture = item.icon
	customer.item = item
	
	v_box_container.add_child(customer)

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
