extends Button
@onready var item_name = %Name
@onready var price = %Price
@onready var description = %Description
@onready var item_image = %Item_image
@export var item: Item
@onready var price_button = $Price_button

# Called when the node enters the scene tree for the first time.
func _ready():
	var button = Button.new()
	text = item.name
	price_button.text = str(item.price)
	button.pressed.connect(self._button_pressed)
	
func _button_pressed():
	item_image = item.name
	price = item.price
	item_image = item.icon



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
