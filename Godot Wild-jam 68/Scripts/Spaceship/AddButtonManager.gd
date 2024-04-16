extends Node2D

@onready var spaceship_manager = %SpaceshipManager
var section: AnimatedSprite2D
var packed_section: PackedScene

func load_add_buttons(_section):
	section = _section
	packed_section = GetSectionFromType.get_from_type(int(section.type))
	for i in get_children():
		i.visible = true

func button_clicked(button):
	spaceship_manager.create_section(packed_section, button.pos, section.tier)
