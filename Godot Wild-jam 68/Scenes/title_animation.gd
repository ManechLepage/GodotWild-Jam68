extends TextureRect

var default_pos: Vector2
func _ready():
	default_pos = position


func _process(delta):
	position = Vector2(sin(delta), default_pos.y)
