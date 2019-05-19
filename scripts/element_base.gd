extends Node

export (int, 1, 500, 10) var velocity : int = 320
var flag_go = false
var dir = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_flag(value):
	self.flag_go = value


func area(area):
	if area.is_in_group("player"):
		if area.is_in_group("mage"):
			area.hit()
		if area.is_in_group("cientist"):
			area.hit()
		queue_free()