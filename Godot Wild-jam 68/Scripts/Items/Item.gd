extends Resource

class_name Item

enum GenerateType 
{
	Generate,
	Smelt,
	Forge,
	None
}

@export var id: int = 0
@export var name: String = ""

@export var generate_type: GenerateType
@export var generate_cooldown: float
@export var generated_item: Item

@export var icon: Texture2D
