extends Sprite2D

@export var type:SectionType
@onready var spaceship_manager = %SpaceshipManager

enum SectionType 
{
	Front,
	Miner,
	Smelter,
	Forger
}

@export var pos: Vector2

func _ready():
	spaceship_manager.add_section(pos, self)

func _process(delta):
	pass
