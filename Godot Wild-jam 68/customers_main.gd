extends Control
@onready var panel = $Panel
@onready var panel_2 = $Panel2


# Called when the node enters the scene tree for the first time.
func _ready():
	panel.visible = true
	panel_2.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	panel.visible = false
	panel_2.visible = true
