extends Node2D

var is_in_ui = false
@onready var panel = $"../Panel2"
@onready var h_box_container = $"../Panel2/HBoxContainer"
var customerContainer: VBoxContainer

const ITEM = preload("res://Scenes/Forge/item.tscn")
var goal_item: Item

func _ready():
	get_parent().play()
	customerContainer = get_tree().get_first_node_in_group("Customers")

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if not is_in_ui:
				load_ui()
			else:
				unload_ui()

func unload_last_choices():
	for i in h_box_container.get_children():
		i.queue_free()

func load_ui():
	unload_last_choices()
	var items = customerContainer.load_all_customer_items()
	
	for i in items:
		var item = ITEM.instantiate()
		item.icon = i.icon
		item.item = i
		item.disabled = not Inventory.items.has(i)
		
		h_box_container.add_child(item)
	
	panel.size = Vector2(h_box_container.size.x + 8.0, h_box_container.size.y)
	panel.position = Vector2(panel.size.x / -2,-58.0)
	
	is_in_ui = true
	panel.visible = true

func unload_ui():
	is_in_ui = false
	panel.visible = false

func press_button(button):
	get_parent().get_parent().add_money(button.item.price)
	unload_ui()
	customerContainer.remove_customer(button.item)
	get_parent().remove_item(button.item)
