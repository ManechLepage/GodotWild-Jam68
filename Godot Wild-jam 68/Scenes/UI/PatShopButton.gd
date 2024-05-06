extends Panel

@export var control : Control = null

func _on_button_pressed():
	if control:
		control.load_pat_shop()
	else:
		get_parent().load_pat_shop()
		queue_free()
