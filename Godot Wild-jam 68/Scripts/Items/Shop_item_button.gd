extends Button

var tier: int
var section: AnimatedSprite2D
var price: int

@onready var price_button = $Price_button
@onready var label = $Label

func load_values(section, tier, price):
	var tier_str:String
	for i in range(tier):
		tier_str += "I"
	
	label.text = section.name + " " + tier_str
	price_button.text = str(price)

func _on_pressed():
	get_parent().get_parent().get_parent().get_parent().load_item(section, tier, price)
