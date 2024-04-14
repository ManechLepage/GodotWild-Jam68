extends HBoxContainer

@onready var front_component = $"../../FrontComponent"

func button_pressed(button):
	front_component.press_button(button)
