extends Node

var generating:Generator

@export var is_choosing = false
@onready var panel = $"../Panel"
@export var generator_list: Array[Item] = []
var cooldown: float
@onready var timer = $Timer
@onready var button1 = $"../Panel/Button"
@onready var button2 = $"../Panel/Button2"
@onready var sprite_2d = $"../Sprite2D"

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
	cooldown = 3.0 * get_parent().tier
	timer.wait_time = cooldown
	timer.stop()

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
			if not is_choosing:
				start_choosing()
			else:
				is_choosing = false
				panel.visible = false
				sprite_2d.visible = true

func start_choosing():
	is_choosing = true
	panel.visible = true
	sprite_2d.visible = false
	
	button1.get_child(0).texture = generator_list[(get_parent().tier - 1) * 2].icon
	button2.get_child(0).texture = generator_list[((get_parent().tier - 1) * 2) + 1].icon
	
	timer.stop()
	get_parent().stop()

func activate_generator():
	get_parent().play()
	is_choosing = false
	panel.visible = false
	sprite_2d.visible = true
	timer.start()
	sprite_2d.texture = generator_list[generating].icon

func _on_button_pressed1():
	generating = (get_parent().tier - 1) * 2
	activate_generator()

func _on_button_pressed2():
	generating = ((get_parent().tier - 1) * 2) + 1
	activate_generator()
