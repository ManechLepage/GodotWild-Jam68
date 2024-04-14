extends Node

@onready var timer = $Timer
@export var cooldown = 6.0
@export var max_customer = 5

@onready var v_box_container = $"../Panel/VBoxContainer"

const CUSTOMER_LABEL = preload("res://Scenes/Inventory/customer_label.tscn")

var current_customer_index = 0
var merchant_index = 10

func _ready():
	timer.wait_time = cooldown

func load_customer():
	var customer = CUSTOMER_LABEL.instantiate()
	
	customer.get_child(0).text = "test"
	customer.get_child(1).text = "3"
	
	v_box_container.add_child(customer)

func load_merchant():
	pass

func _on_timer_timeout():
	current_customer_index += 1
	if current_customer_index % merchant_index == 0:
		load_merchant()
	else:
		load_customer()
