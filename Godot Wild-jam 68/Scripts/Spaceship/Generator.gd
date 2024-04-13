extends Node

@export var generator_tier = 1
@onready var item_generator = $"../ItemGenerator"
var generating:Generator

@export var isChoosing = false

@export var generator_list = []

enum Generator
{
	Iron = 0,
	Tin = 1,
	Cobalt = 2,
	Gold = 3,
	Diamond = 4,
	Platinum = 5
}

func _ready():
	item_generator.cooldown = 5.0 * generator_tier

func _process(delta):
	pass

func _on_timer_timeout():
	var item = generator_list[int(generating)]
	get_parent().add_item_to_inventory(item)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			print("dsf")
