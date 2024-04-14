extends Node2D

@export var item_list: Array[Item] = []

var section_list = []

@onready var seperator_manager = $"../SeperatorManager"

const FRONT = preload("res://Scenes/Spaceship/Front.tscn")
const GENERATOR = preload("res://Scenes/Spaceship/Generator.tscn")
const SMELTER = preload("res://Scenes/Spaceship/Smelter.tscn")
const FORGE = preload("res://Scenes/Spaceship/Forge.tscn")

const SPACESHIP_SEPERATOR = preload("res://Scenes/Spaceship/spaceship_seperator.tscn")

var max_grid_size = 5
var margin = 320.0

func _ready():
	Inventory.load_all_items(item_list)
	for i in range(max_grid_size):
		var row = []
		for j in range(max_grid_size):
			row.append(null)
		section_list.append(row)
	
	create_section(FRONT, Vector2(2, 0), 1)
	
	create_section(FORGE, Vector2(2, 1), 1)
	create_section(FORGE, Vector2(2, 2), 2)
	
	create_section(GENERATOR, Vector2(1, 1), 1)
	create_section(GENERATOR, Vector2(1, 2), 2)	
	
	create_section(SMELTER, Vector2(3, 1), 1)
	create_section(SMELTER, Vector2(3, 2), 2)
	
	update_pos()

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
	for i in get_children():
		i.position = Vector2(i.pos.x * margin, i.pos.y * margin)
	add_seperators()

func add_seperators():
	for i in range(max_grid_size):
		for j in range(max_grid_size):
			if section_list[i][j] != null:
				if i + 1 < max_grid_size and j < max_grid_size:
					if section_list[i + 1][j] != null:
						add_seperator(section_list[i][j].pos, section_list[i + 1][j].pos, true)
				if i < max_grid_size and j + 1 < max_grid_size:
					if section_list[i][j + 1] != null:
						add_seperator(section_list[i][j].pos, section_list[i][j + 1].pos, false)

func add_seperator(pos1, pos2, side):
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
	seperator.play()
	seperator_manager.add_child(seperator)
	print(seperator.position)
