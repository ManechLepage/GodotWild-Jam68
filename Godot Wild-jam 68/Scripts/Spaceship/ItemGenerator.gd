extends Node

var generated_item: Item
@onready var timer = $Timer
var cooldown: float

func _ready():
	pass


func _process(delta):
	pass

func generate_new_item(item:Item):
	timer.start(cooldown)

func _on_timer_timeout():
	%SpaceshipManager.add_item(generated_item, 1)
