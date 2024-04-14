extends Node2D

@export var item_list: Array[Item] = []

var section_list = []
var add_button_pos_list = []

@onready var seperator_manager = $"../SeperatorManager"
@onready var add_button_manager = $"../AddButtonManager"
@onready var money_panel = $"../MoneyPanel"

const FRONT = preload("res://Scenes/Spaceship/Front.tscn")
const GENERATOR = preload("res://Scenes/Spaceship/Generator.tscn")
const SMELTER = preload("res://Scenes/Spaceship/Smelter.tscn")
const FORGE = preload("res://Scenes/Spaceship/Forge.tscn")

const SPACESHIP_SEPERATOR = preload("res://Scenes/Spaceship/spaceship_seperator.tscn")
const ADD_SECTION_BUTTON = preload("res://Scenes/UI/add_section_button.tscn")

var max_grid_size_x = 8
var max_grid_size_y = 5
var margin = 192.0

var money = 0

func _ready():
	add_money(0)
	
	Inventory.load_all_items(item_list)
	for i in range(max_grid_size_x):
		var row = []
		for j in range(max_grid_size_y):
			row.append(null)
		section_list.append(row)
	
	create_section(FRONT, Vector2(4, 0), 1)
	
	create_section(FORGE, Vector2(4, 1), 1)
	create_section(FORGE, Vector2(5, 1), 2)
	create_section(FORGE, Vector2(5, 2), 3)
	
	create_section(GENERATOR, Vector2(3, 1), 1)
	create_section(GENERATOR, Vector2(3, 2), 2)
	create_section(GENERATOR, Vector2(3, 3), 3)
	
	create_section(SMELTER, Vector2(2, 1), 1)
	create_section(SMELTER, Vector2(2, 2), 2)

func create_section(type:PackedScene, pos:Vector2, tier:int):
	var section = type.instantiate()
	section.pos = pos
	section.tier = tier
	add_child(section)
	add_section(section.pos, section)

func _process(delta):
	pass

func add_section(pos: Vector2, section: Node2D):
	var x = int(pos.x)
	var y = int(pos.y)

	if x >= 0 and x < section_list.size() and y >= 0 and y < section_list[x].size():
		section_list[x][y] = section
	else:
		print("Invalid position:", pos)
	
	update_pos()

func update_pos():
	for i in seperator_manager.get_children():
		i.queue_free()
	for i in add_button_manager.get_children():
		i.queue_free()
	add_button_pos_list.clear()
	for i in get_children():
		i.position = Vector2(i.pos.x * margin, i.pos.y * margin)
	add_seperators()

func add_seperators():
	for i in range(max_grid_size_x):
		for j in range(max_grid_size_y):
			if section_list[i][j] != null:
				if i + 1 < max_grid_size_x:
					if section_list[i + 1][j] != null:
						add_seperator(section_list[i][j].pos, section_list[i + 1][j].pos, section_list[i][j].tier, section_list[i + 1][j].tier, true)
					else:
						if Vector2(i + 1, j) not in add_button_pos_list:
							add_plus_button(section_list[i][j].pos, Vector2(i + 1, j))
							add_button_pos_list.append(Vector2(i + 1, j))
				if j + 1 < max_grid_size_y:
					if section_list[i][j + 1] != null:
						add_seperator(section_list[i][j].pos, section_list[i][j + 1].pos, section_list[i][j].tier, section_list[i][j + 1].tier, false)
					else:
						if Vector2(i, j + 1) not in add_button_pos_list:
							add_plus_button(section_list[i][j].pos,Vector2(i, j + 1))
							add_button_pos_list.append(Vector2(i, j + 1))
				if i - 1 > 0:
					if section_list[i - 1][j] == null:
						if Vector2(i - 1, j) not in add_button_pos_list:
							add_plus_button(section_list[i][j].pos, Vector2(i - 1, j))
							add_button_pos_list.append(Vector2(i - 1, j))
				if j - 1 > 0:
					if section_list[i][j - 1] == null:
						if Vector2(i, j - 1) not in add_button_pos_list:
							add_plus_button(section_list[i][j].pos,Vector2(i, j - 1))
							add_button_pos_list.append(Vector2(i, j - 1))

func add_seperator(pos1, pos2, tier1, tier2, side):
	var seperator = SPACESHIP_SEPERATOR.instantiate()
	var pos_x: float
	var pos_y: float
	if side:
		pos_x = ((pos1.x + pos2.x) / 2) * margin
		pos_y = pos1.y * margin
	else:
		pos_x = pos1.x * margin
		pos_y = ((pos1.y + pos2.y) / 2) * margin
		seperator.rotation = PI / 2
	seperator.position = Vector2(pos_x, pos_y)
	var tier:int
	var min_tier = min(tier1, tier2)
	var max_tier = max(tier1, tier2)
	if tier1 == tier2:
		tier = tier1 - 1
	elif min_tier == 1 and max_tier == 2:
		tier = 3
	elif min_tier == 1 and max_tier == 3:
		tier = 4
	else:
		tier = 5
	seperator.set_sprite_frames(Inventory.seperators[tier])
	if tier1 > tier2:
		seperator.rotation += PI
	seperator.play()
	seperator_manager.add_child(seperator)

func add_plus_button(pos1, pos2):
	var button = ADD_SECTION_BUTTON.instantiate()
	button.position = Vector2((pos2.x * margin) - 32, (pos2.y * margin) - 32)
	button.visible = false
	
	add_button_manager.add_child(button)

func add_money(value:int):
	money += value
	money_panel.get_child(0).text = str(money)
