extends Button
@onready var item_name = $Panel2/Panel/Name
@onready var description = $Panel2/Panel2/Description
@onready var use = $Panel2/Panel3/use
@onready var item_icon = $Panel2/Icon
@onready var button = $"."
@export var item: Item


# Called when the node enters the scene tree for the first time.
func _ready():
	button.text = item.name


func _on_pressed():
	item_name.text = item.name
	description.text = item.description
	item_icon.texture = item.icon
	use.text = item.use
