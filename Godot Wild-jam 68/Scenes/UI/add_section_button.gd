extends TextureButton

var pos: Vector2


func _on_pressed():
	get_parent().button_clicked(self)
