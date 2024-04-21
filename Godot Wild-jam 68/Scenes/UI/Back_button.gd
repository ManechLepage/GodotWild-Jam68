extends Button

@onready var wiki = $"../.."

func _on_pressed():
	wiki.visible = false
