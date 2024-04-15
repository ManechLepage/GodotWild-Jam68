extends Resource

class_name Item

enum ItemType
{
	Mineral,
	Product,
}

@export var ID: int
@export var name: String = ""
@export var icon: Texture2D
@export var description: String = ""
@export var use: String = ""

@export var type: ItemType

@export var smelted_item: Item

@export var price: int = 0
@export var forge_tier: int = 1
@export var craft: Array[Item] = []
