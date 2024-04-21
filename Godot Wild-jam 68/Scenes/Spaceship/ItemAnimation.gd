extends Sprite2D

var is_moving = false
var initial_pos
var goal_pos
var t = 0.0

func set_new_position(pos1, pos2):
	position = pos1
	is_moving = true
	initial_pos = pos1
	goal_pos = pos2

func _physics_process(delta):
	t += delta * 0.4
	if is_moving:
		position = initial_pos.lerp(goal_pos, t)
	if position == goal_pos:
		is_moving = false
