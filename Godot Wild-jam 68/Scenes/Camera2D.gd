extends Camera2D

var target_zoom: float = 1.0

const MAX_ZOOM = 1.0
const MIN_ZOOM = 0.1
const ZOOM_INCREMENT = 0.1
const ZOOM_RATE = 0.8

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT:
			position -= event.relative * zoom
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_in()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_out()

func zoom_in():
	target_zoom = max(target_zoom - ZOOM_INCREMENT, MIN_ZOOM)
	set_physics_process(true)

func zoom_out():
	target_zoom = min(target_zoom + ZOOM_INCREMENT, MAX_ZOOM)
	set_physics_process(true)

func _physics_process(delta):
	zoom = lerp(zoom, target_zoom * Vector2.ONE, ZOOM_RATE * delta)
	set_physics_process(not is_equal_approx(zoom.x, target_zoom))
