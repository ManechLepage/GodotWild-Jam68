extends Resource

class_name Item

enum ItemType
{
	Mineral,
	Product,
}

@export var name: String = ""
@export var price: int = 0

@export var generated_item: Item

@export var icon: Texture2D
