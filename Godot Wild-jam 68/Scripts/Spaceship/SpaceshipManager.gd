extends Node2D

var section_list = []

const FRONT = preload("res://Scenes/Spaceship/Front.tscn")
const GENERATOR = preload("res://Scenes/Spaceship/Generator.tscn")
const SMELTER = preload("res://Scenes/Spaceship/Smelter.tscn")
const FORGE = preload("res://Scenes/Spaceship/Forge.tscn")

func _ready():
	for i in range(5):
		var row = []
		for j in range(5):
			row.append(0)
		section_list.append(row)
	
	var front = FRONT.instantiate()
	front.pos = Vector2(2, 0)
	add_child(front)
	add_section(front.pos, front)
	
	var generator = GENERATOR.instantiate()
	generator.pos = Vector2(1, 1)
	add_child(generator)
	add_section(generator.pos, generator)
	
	var smelter = SMELTER.instantiate()
	smelter.pos = Vector2(3, 1)
	add_child(smelter)
	add_section(smelter.pos, smelter)
	
	var forge = FORGE.instantiate()
	forge.pos = Vector2(2, 1)
	add_child(forge)
	add_section(forge.pos, forge)
	
	update_pos()

func _process(delta):
	pass

func add_section(pos: Vector2, section: Node2D):
	var x = int(pos.x)
	var y = int(pos.y)

	if x >= 0 and x < section_list.size() and y >= 0 and y < section_list[x].size():
		section_list[x][y] = section
	else:
		print("Invalid position:", pos)

func update_pos():
	for i in get_children():
		i.position = Vector2(i.pos.x * 200.0, i.pos.y * 200.0)
