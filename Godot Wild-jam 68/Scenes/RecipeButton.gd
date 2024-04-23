extends Button

@onready var main_2d = %Main2D

func _on_pressed():
	main_2d.enable_wiki(true)
