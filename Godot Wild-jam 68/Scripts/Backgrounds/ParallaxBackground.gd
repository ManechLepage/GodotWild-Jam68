extends ParallaxBackground

@onready var offset_x = 0.0

func _process(delta):
	offset_x += 10 * delta
	scroll_offset.x = offset_x
