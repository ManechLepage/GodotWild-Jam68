extends Node

var forge_cooldown: Array[int] = [5, 10, 15]
@export var forge_tier = 1

var is_forging = false
var is_choosing = false

var forging: Item

@onready var panel = $"../Panel"
@onready var timer = $Timer
@onready var h_box_container = $"../Panel/HBoxContainer"
const ITEM = preload("res://Scenes/Forge/item.tscn")

func _ready():
	timer.wait_time = forge_cooldown[forge_tier - 1]

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			start_choosing()

func start_choosing():
	panel.visible = true
	is_choosing = true
	is_forging = false
	
	timer.stop()
	
	unload_last_choices()
	load_choices()

func unload_last_choices():
	for i in h_box_container.get_children():
		i.queue_free()

func load_choices():
	var items = Inventory.load_products_from_tier(forge_tier)
	
	for i in items:
		var item = ITEM.instantiate()
		# item.icon = i.icon
		h_box_container.add_child(item)
	
	panel.size = Vector2(h_box_container.size.x + 8.0, h_box_container.size.y)
	panel.position = Vector2(panel.size.x / -2,-160.0)

func _on_timer_timeout():
	var parent = get_parent()
	parent.add_item(forging)
	for item in forging.craft:
		parent.remove_item(item)
	
	var f_string = "Forging %s..."
	print(f_string % forging.name)

func activate_smeltor():
	is_choosing = false
	is_forging = true
	panel.visible = false
	
	timer.start()
