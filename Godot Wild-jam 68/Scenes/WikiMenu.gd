extends Control

@onready var money_ctrl_2 = %MoneyCtrl2
@onready var customer_ctrl = %CustomerCtrl
@onready var inventory_ctrl = %InventoryCtrl

@onready var wiki_button = $"../MoneyCtrl2/wiki_button"
@onready var back_button = $"../Back_button"
@onready var wiki_menu = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	


func _on_wiki_button_pressed():
	money_ctrl_2.visible = false
	customer_ctrl.visible = false
	inventory_ctrl.visible = false
	wiki_button.visible = false
	back_button.visible = true
	wiki_menu.visible = true
