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
			if not is_choosing:
				start_choosing()
			else:
				panel.visible = false
				is_choosing = false

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
		item.item = i
		item.disabled = not can_craft(i)
		
		h_box_container.add_child(item)
	
	panel.size = Vector2(h_box_container.size.x + 8.0, h_box_container.size.y)
	panel.position = Vector2(panel.size.x / -2,-160.0)

func can_craft(item:Item):
	for i in item.craft:
		if not Inventory.items.has(i):
			return false 
	return true

func _on_timer_timeout():
	var parent = get_parent()
	parent.add_item(forging)
	for item in forging.craft:
		parent.remove_item(item)
	
	var f_string = "Forging %s..."
	print(f_string % forging.name)
	
	timer.stop()

func activate_forger():
	is_choosing = false
	is_forging = true
	panel.visible = false
	
	timer.start()

func press_button(button):
	print(button.item.name)
	forging = button.item
	activate_forger()
