extends Node

var forge_cooldown: Array[int] = [5, 10, 15]
@export var forge_tier = 1

var is_forging = false
var is_choosing = false

var forging: Item

@onready var panel = $"../Panel"
@onready var timer = $Timer

func _ready():
	timer.wait_time = forge_cooldown[forge_tier - 1]

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			start_choosing()

func start_choosing():
	panel.visible = true
	is_choosing = true
	is_forging = false
	
	timer.stop()
	
	# TODO

func _on_timer_timeout():
	var parent = get_parent()
	parent.add_item(forging)
	for item in forging.craft:
		parent.remove_item(item)
	
	var f_string = "Forging %s..."
	print(f_string % forging.name)

func activate_smeltor():
	is_choosing = false
	is_forging = true
	panel.visible = false
	
	timer.start()
