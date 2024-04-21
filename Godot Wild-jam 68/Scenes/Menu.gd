extends Control

@onready var main_2d = %Main2D
@onready var inventory_ctrl = %InventoryCtrl
@onready var customer_ctrl = %CustomerCtrl
@onready var money_ctrl_2 = %MoneyCtrl2
@onready var back_button = $"../Back_button"


func _on_button_pressed():
	main_2d.visible = true
	inventory_ctrl.visible = true
	customer_ctrl.visible = true
	money_ctrl_2.visible = true
	back_button.visible = false
	
	visible = false
