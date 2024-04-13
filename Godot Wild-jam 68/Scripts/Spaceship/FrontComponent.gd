extends Node2D

var is_in_ui = false
@onready var panel = $"../Panel"
@onready var button = $"../Panel/Button"
var goal_item: Item
@onready var sell_button = $"../Button"

func _ready():
	pass

func _process(delta):
	pass

func load_next_customer():
	pass

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if not is_in_ui:
				load_ui()
			else:
				pass

func load_ui():
	is_in_ui = true
	panel.visible = true

func unload_ui():
	is_in_ui = false
	panel.visible = false
	sell_button.visible = false

func _on_button_pressed1():
	if Inventory.items.has(goal_item):
		button.icon = goal_item.icon
		sell_button.visible = true
		get_parent().remove_item(goal_item)
