extends Sprite2D

@export var type:SectionType
@onready var panel = $Panel
@onready var button1 = $Panel/Button
@onready var button2 = $Panel/Button2
@onready var inventory_panel: Panel

enum SectionType 
{
	Front,
	Miner,
	Smelter,
	Forger
}

@export var pos: Vector2

func _ready():
	inventory_panel = get_tree().get_first_node_in_group("Inventory")

func add_item(item:Item):
	if Inventory.items.has(item):
		Inventory.items[item] += 1
	else:
		Inventory.items[item] = 1
	inventory_panel.update_inventory_panel()

func remove_item(item:Item):
	if Inventory.items.has(item):
		var value = Inventory.items[item]
		value -= 1
		if value <= 0:
			Inventory.items.erase(item)
		else:
			Inventory.items[item] = value
	inventory_panel.update_inventory_panel()
