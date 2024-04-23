extends Node2D

@onready var inventory_ctrl = %InventoryCtrl
@onready var customer_ctrl = %CustomerCtrl
@onready var money_ctrl_2 = %MoneyCtrl2
@onready var menu = $"../Menu"
@onready var wiki = %Wiki

func enable_wiki(enable):
	inventory_ctrl.visible = not enable
	customer_ctrl.visible = not enable
	money_ctrl_2.visible = not enable
	self.visible = not enable
	
	wiki.visible = enable
