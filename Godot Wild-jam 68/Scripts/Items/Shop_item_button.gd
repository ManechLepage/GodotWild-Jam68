extends Button

<<<<<<< Updated upstream
var tier: int
var section: AnimatedSprite2D

@onready var price_button = $Price_button
@onready var label = $Label

func load_values(section, tier, price):
	var tier_str:String
	for i in range(tier):
		tier_str += "I"
	
	label.text = section.name + " " + tier_str
	price_button.text = str(price)

func _on_pressed():
	pass
=======
@onready var description = $"../../../Panel2/Panel2/Description"
@onready var item_icon = $"../../../Panel2/Icon"
@export var item: Item
@onready var item_name = $"../../../Panel2/Panel/Name"
@onready var use = $"../../../Panel2/Panel3/use"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = item.name
	
	
func _on_pressed():
	item_name.text = item.name
	use.text = item.use
	description.text = item.description
	item_icon.texture = item.icon
>>>>>>> Stashed changes
