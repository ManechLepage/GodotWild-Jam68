extends Node

var quotes = ["womp \nwomp"]

func get_quote():
	return quotes[randi() % quotes.size()]
