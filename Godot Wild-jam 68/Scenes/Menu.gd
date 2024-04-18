extends Control

@onready var main_2d = %Main2D
@onready var inventory_ctrl = %InventoryCtrl
@onready var customer_ctrl = %CustomerCtrl
@onready var money_ctrl_2 = %MoneyCtrl2

func _on_button_pressed():
	main_2d.visible = true
	inventory_ctrl.visible = true
	customer_ctrl.visible = true
	money_ctrl_2.visible = true
	
	visible = false
