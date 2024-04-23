extends Button

@onready var wiki = $"../.."

func _on_pressed():
	wiki.get_parent().get_parent().get_node("Main2D").enable_wiki(false)
