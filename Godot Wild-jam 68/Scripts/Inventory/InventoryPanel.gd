extends Panel

const ITEM_LABEL = preload("res://Scenes/Inventory/item_label.tscn")
@onready var v_box_container = $VBoxContainer

func _ready():
	pass 

func _process(delta):
	pass

func update_inventory_panel():
	for i in v_box_container.get_children():
		i.queue_free()
	for item in Inventory.items.keys():
		var label = ITEM_LABEL.instantiate()
		label.text = item.name
		v_box_container.add_child(label)
		var count_label = label.get_child(0)
		count_label.text = str(Inventory.items[item])
