extends Button

@onready var wiki = %Wiki

func _on_pressed():
	wiki.visible = true
