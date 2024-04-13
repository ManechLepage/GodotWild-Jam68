extends Node

func _ready():
	pass

func _process(delta):
	pass

func load_basic_customer():
	var rng = RandomNumberGenerator.new()
	var customer_type = rng.randf_range(0, 1)
	if customer_type < 0.8:
		load_customer()
	else:
		load_merchant()

func load_customer():
	pass

func load_merchant():
	pass
