extends Node

#var pre_ex = preload("res://scenes/mg_comb/Elements_GM_Ex.tscn")

var pre_combinations : Array = ["112","113","221","223","331","332"]
var cur_self_type : String = ""

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
	
#	print("Atributos: ", dano, vel, chan)
	
	pass


func area(area : Area2D):
	if area.is_in_group("mg"):
		for i in pre_combinations.size():
			if area.is_in_group(pre_combinations[i]):
				make_counter(pre_combinations[i])
			pass
	
	
	if area.is_in_group("ct"):
		for i in pre_combinations.size():
			if area.is_in_group(pre_combinations[i]):
				make_counter(pre_combinations[i])
			pass
#		if area.is_in_group(
	
	
	
	if area.is_in_group("player"):
		if area.is_in_group("mage"):
			area.hit(self.dano)
		if area.is_in_group("cientist"):
			area.hit(self.dano)
		queue_free()


func make_counter(value):
	var t1 : String = cur_self_type
	var t2 = value
	var x = ""
	var y = ""
	for i in t1.length():
#		print(x.length())
#		print(t1[i])
		if i < 2:
			x += t1[i]
			y += t2[i]
		else:
			x = t1[i]
			y = t2[i]
#		var z = x + y
#		if z.length() == 2:
		if (x.length() == 2) and (y.length() == 2):
			if x == y:
				print("os dois iniciais são iguais")
		elif int(x) > int(y):
			print("x vence")
		elif int(x) < int(y):
			print("y vence")
			
		print(x, y)
		
		
		#####COUNTERSSSSSSSSSSSSSs
	
	pass



#func ex(area):
#	var ex = pre_ex.instance()
#	ex.position = area.position
#	add_child(ex)
#	yield(get_tree().create_timer(.8), "timeout")