extends Resource

class_name Item

enum ItemType
{
	Mat,
	Ship_Section,
	Product,
	Upgrade
}

enum GenerateType 
{
	Generate,
	Smelt,
	Forge,
	None
}

@export var name: String = ""
@export var price: int = 0

@export var generate_type: GenerateType
@export var generate_cooldown: float
@export var generated_item: Item

@export var icon: Texture2D
