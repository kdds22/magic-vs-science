extends "res://scripts/element_base.gd"



func _process(delta):
	if flag_go:
		self.position += dir * delta * velocity
		self.rotation += delta * 1.5

func _on_Elements_area_entered(area):
	self.area(area)
