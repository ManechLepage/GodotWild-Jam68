extends Node

@export var generator_tier = 1
var generating:Generator

@export var isChoosing = false
@onready var panel = $"../Panel"
@export var generator_list: Array[Item] = []
var cooldown: float
@onready var timer = $Timer
@onready var button1 = $"../Panel/Button"
@onready var button2 = $"../Panel/Button2"

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
	cooldown = 3.0 * generator_tier
	timer.wait_time = cooldown

func _process(delta):
	pass

func _on_timer_timeout():
	var item = generator_list[int(generating)]
	get_parent().add_item(item)
	var f_string = "Generating %s..."
	print(f_string % item.name)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			start_choosing()

func start_choosing():
	isChoosing = true
	panel.visible = true
	
	button1.icon = generator_list[(generator_tier - 1) * 2].icon
	button2.icon = generator_list[((generator_tier - 1) * 2) + 1].icon
	
	timer.stop()

func activate_generator():
	isChoosing = false
	panel.visible = false
	timer.start()

func _on_button_pressed1():
	generating = (generator_tier - 1) * 2
	activate_generator()

func _on_button_pressed2():
	generating = ((generator_tier - 1) * 2) + 1
	activate_generator()
