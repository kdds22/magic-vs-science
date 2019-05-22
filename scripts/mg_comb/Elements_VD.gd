extends "res://scripts/element_base.gd"


func _ready():
	self.cur_self_type = "223"


func _process(delta):
	if flag_go:
		self.position += dir * delta * velocity
		self.rotation += delta * 2

func _on_Elements_area_entered(area):
	self.area(area)
