extends AnimatedSprite2D

@export var type:SectionType
@onready var panel = $Panel
@onready var button1 = $Panel/Button
@onready var button2 = $Panel/Button2
@onready var inventory_panel: Panel
@onready var item_animation = $ItemAnimation

@export var tier = 1

@export var preloadType: PackedScene

enum SectionType 
{
	Front = 0,
	Miner = 1,
	Smelter = 2,
	Forger = 3
}

@export var pos: Vector2

func _ready():
	inventory_panel = get_tree().get_first_node_in_group("Inventory")
	set_animation_types()

func set_animation_types():
	if type == SectionType.Front:
		set_sprite_frames(Inventory.front_animation)
	elif type == SectionType.Miner:
		set_sprite_frames(Inventory.generator_animations[tier - 1])
	elif type == SectionType.Smelter:
		set_sprite_frames(Inventory.smelter_animations[tier - 1])
	else:
		set_sprite_frames(Inventory.forge_animations[tier - 1])

func add_item(item:Item):
	if Inventory.items.has(item):
		Inventory.items[item] += 1
	else:
		Inventory.items[item] = 1
	inventory_panel.update_inventory_panel()
	animate_item_transfer(item, position, inventory_panel.position)

func remove_item(item:Item):
	if Inventory.items.has(item):
		var value = Inventory.items[item]
		value -= 1
		if value <= 0:
			Inventory.items.erase(item)
		else:
			Inventory.items[item] = value
	inventory_panel.update_inventory_panel()
	animate_item_transfer(item, inventory_panel.position, position)

func animate_item_transfer(item:Item, pos1, pos2):
	item_animation.set_texture(item.icon)
	item_animation.set_new_position(pos1, pos2)
