extends Node

const FRONT = preload("res://Scenes/Spaceship/Front.tscn")
const GENERATOR = preload("res://Scenes/Spaceship/Generator.tscn")
const SMELTER = preload("res://Scenes/Spaceship/Smelter.tscn")
const FORGE = preload("res://Scenes/Spaceship/Forge.tscn")

func get_from_type(value:int):
	if value == 0:
		return FRONT
	elif value == 1:
		return GENERATOR
	elif value == 2:
		return SMELTER
	else:
		return FORGE
