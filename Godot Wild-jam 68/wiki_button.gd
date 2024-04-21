extends Button

@onready var button = $"."
@export var item: Item
@onready var item_name = $"../../../Panel2/Panel/Name"
@onready var description = $"../../../Panel2/Panel2/Description"
@onready var use = $"../../../Panel2/Panel3/use"
@onready var item_icon = $"../../../Panel2/Icon"

func _ready():
	if item != null:
		button.text = item.name


func _on_pressed():
	item_name.text = item.name
	description.text = item.description
	item_icon.texture = item.icon
	use.text = item.use
