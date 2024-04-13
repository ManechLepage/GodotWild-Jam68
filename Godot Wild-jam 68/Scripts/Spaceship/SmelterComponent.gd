extends Node

var smelter_tier: int
var smelting: Smeltor

@export var cooldown: float = 4.0
@export var smeltor_list: Array[Item] = []

@onready var timer = $Timer
@onready var button1 = $"../Panel/Button"
@onready var button2 = $"../Panel/Button2"
@onready var panel = $"../Panel"

var is_smelting = false
var is_choosing = false

enum Smeltor
{
	Iron = 0,
	Tin = 1,
	Cobalt = 2,
	Gold = 3
}

func _ready():
	timer.wait_time = cooldown


func _process(delta):
	pass

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			start_choosing()

func start_choosing():
	panel.visible = true
	is_choosing = true
	is_smelting = false
	timer.stop()

func _on_button_pressed1():
	smelting = (smelter_tier - 1) * 2
	activate_smeltor()

func _on_button_pressed2():
	smelting = ((smelter_tier - 1) * 2) + 1
	activate_smeltor()

func _on_timer_timeout():
	var parent = get_parent()
	parent.add_item(smeltor_list[smelting].generated_item)

func activate_smeltor():
	is_choosing = false
	is_smelting = true
	timer.start()
