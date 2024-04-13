extends HBoxContainer
@onready var forge_component = $"../../ForgeComponent"


func button_pressed(button):
	forge_component.press_button(button)
