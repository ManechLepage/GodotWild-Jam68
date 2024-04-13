extends Node2D

var section_list = []
var items = {}

func _ready():
	for i in range(5):
		var row = []
		for j in range(5):
			row.append(null)
		section_list.append(row)
	update_pos()

func _process(delta):
	pass

func add_section(pos: Vector2, section: Node2D):
	section_list[int(pos.x)][int(pos.y)] = section
	print(section_list)

func add_item(item:Item, count:int):
	if items.has(item):
		items[item] += count
	else:
		items[item] = count

func update_pos():
	for i in get_children():
		i.position = Vector2(i.pos.x * 50.0, i.pos.y * 50.0)
