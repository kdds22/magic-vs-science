extends Node

#var pre_ex = preload("res://scenes/mg_comb/Elements_GM_Ex.tscn")

export (int, 1, 500, 10) var velocity : int = 300
var flag_go = false
var dir = Vector2()

var dano : int
var vel : int
var chan : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_flag(value):
	self.flag_go = value


func set_attr(value : Dictionary):
	self.dano = value["Dano"]
	self.vel = value["Vel"]
	if vel == 1:
		velocity = 100
	elif vel == 2:
		velocity = 250
	elif vel == 3:
		velocity = 400
	self.chan = value["chance"]
	print("Atributos: ", dano, vel, chan)
	
	pass


func area(area):
	if area.is_in_group("player"):
		if area.is_in_group("mage"):
			area.hit(self.dano)
		if area.is_in_group("cientist"):
			area.hit(self.dano)
		queue_free()

#func ex(area):
#	var ex = pre_ex.instance()
#	ex.position = area.position
#	add_child(ex)
#	yield(get_tree().create_timer(.8), "timeout")