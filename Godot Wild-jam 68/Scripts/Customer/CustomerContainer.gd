extends VBoxContainer

@onready var customer_manager = %CustomerManager
const PAT_SHOP = preload("res://Scenes/Customers/main_shop.tscn")
@onready var node_2d = $"../../.."
@onready var main_2d = %Main2D
@onready var customer_ctrl = %CustomerCtrl
@onready var inventory_ctrl = %InventoryCtrl
@onready var add_button_manager = %AddButtonManager

var pat_shop = Node

func load_all_customer_items():
	var items = []
	for i in get_children():
		if i.is_in_group("Customer"):
			items.append(i.item)
	return items

func remove_customer(item:Item):
	for i in get_children():
		if i.is_in_group("Customer"):
			if i.item == item:
				i.queue_free()
				break

func load_pat_shop():
	pat_shop = PAT_SHOP.instantiate()
	node_2d.add_child(pat_shop)
	
	get_tree().paused = true
	
	customer_ctrl.visible = false 
	inventory_ctrl.visible = false
	main_2d.visible = false
	#get_tree().change_scene_to_file("res://Scenes/Customers/main_shop.tscn")

func unload_pat_shop(section):
	pat_shop.queue_free()
	
	get_tree().paused = false
	
	customer_ctrl.visible = true 
	inventory_ctrl.visible = true
	main_2d.visible = true
	
	if section != null:
		add_button_manager.load_add_buttons(section)
