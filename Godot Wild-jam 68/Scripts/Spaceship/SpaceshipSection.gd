extends Sprite2D

@export var type:SectionType

enum SectionType 
{
	Front,
	Miner,
	Smelter,
	Forger
}

@export var pos: Vector2

func _process(delta):
	pass

func add_item_to_inventory(item:Item):
	pass
