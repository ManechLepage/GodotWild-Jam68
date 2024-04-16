extends VBoxContainer

@onready var customer_manager = %CustomerManager
const PAT_SHOP = preload("res://Scenes/Customers/main_shop.tscn")
@onready var node_2d = $"../../.."

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
	#get_tree().change_scene_to_file("res://Scenes/Customers/main_shop.tscn")
