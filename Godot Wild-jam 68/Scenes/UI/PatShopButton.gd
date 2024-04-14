extends Panel

func _on_button_pressed():
	get_parent().load_pat_shop()
	queue_free()
