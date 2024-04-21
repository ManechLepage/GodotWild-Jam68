extends Control
@onready var inventory_ctrl = %InventoryCtrl
@onready var customer_ctrl = %CustomerCtrl
@onready var money_ctrl_2 = %MoneyCtrl2
@onready var back_button = $"../../Back_button"

@onready var wiki = $"."
@onready var wiki_button = $"../../MoneyCtrl2/wiki_button"




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	wiki.visible = false
	wiki_button.visible = true
	money_ctrl_2.visible = true
	customer_ctrl.visible = true
	inventory_ctrl.visible = true
	back_button.visible = false
	visible = false
