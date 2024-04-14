extends Sprite2D

@export var speed:float
@export var is_aura:bool

func _ready():
	pass


func _process(delta):
	rotate(delta * speed)
	if is_aura:
		position = get_parent().get_child(1).position
