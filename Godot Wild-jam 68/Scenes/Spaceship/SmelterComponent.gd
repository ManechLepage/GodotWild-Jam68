extends Node

var smelter_tier: int
var smelting: Smeltor
@export var smeltor_list: Array[Item] = []

enum Smeltor
{
	Iron = 0,
	Tin = 1,
	Cobalt = 2,
	Gold = 3
}

func _ready():
	pass


func _process(delta):
	pass
