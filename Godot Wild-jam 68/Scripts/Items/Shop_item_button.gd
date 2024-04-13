extends Button

@onready var item_name = %Name
@onready var price = $"../../Panel/Button/Price"
@onready var description = %Description
@onready var item_image = %Item_image
@export var item: Item
@onready var price_button = $Price_button


# Called when the node enters the scene tree for the first time.
func _ready():
	text = item.name
	price_button.text = str(item.price)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	item_name = item.name
	price = str(item.price)
	item_image = item.icon
