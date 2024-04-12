extends Node2D

var section_list = []

func _ready():
	load_sections()

func _process(delta):
	pass

func load_sections():
	for i in get_children():
		section_list.append(i)
