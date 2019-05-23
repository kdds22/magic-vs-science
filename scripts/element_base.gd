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
				var x = make_counter(pre_combinations[i])
				if !x:
					queue_free()
			pass
	
	
	if area.is_in_group("ct"):
		for i in pre_combinations.size():
			if area.is_in_group(pre_combinations[i]):
				var x = make_counter(pre_combinations[i])
				if !x:
					queue_free()
			pass
#		if area.is_in_group(
	
	
	
	if area.is_in_group("player"):
		if area.is_in_group("mage"):
			area.hit(self.dano)
		if area.is_in_group("cientist"):
			area.hit(self.dano)
		queue_free()


# 1 > 3 > 2 > 1 ...
# 11 > 33 > 22
# 113 > 112 
# 221 > 223
# 332 > 331
# 
# 
# 
#
#
#
#

func make_counter(value):
#	var x := [] #elemento proprio
#	var y := [] #elemento externo
	
	var t1 : String = cur_self_type # origem
	var t2 : String = value #elemento colidido
	
	if t1.to_int() == 112:
		if t2.to_int() == 331 or t2.to_int() == 332:
			return true #suave
		if t2.to_int() == 113 or t2.to_int() == 221 or t2.to_int() == 223:
			return false #treta
	
	if t1.to_int() == 113:
		if t2.to_int() == 112 or t2.to_int() == 331 or t2.to_int() == 332:
			return true #suave
		if t2.to_int() == 221 or t2.to_int() == 223:
			return false #treta
		
	if t1.to_int() == 221:
		if t2.to_int() == 112 or t2.to_int() == 113:
			return true #suave
		if t2.to_int() == 331 or t2.to_int() == 332 or t2.to_int() == 223:
			return false #treta	
		
	if t1.to_int() == 223:
		if t2.to_int() == 221 or t2.to_int() == 112 or t2.to_int() == 113:
			return true #suave
		if t2.to_int() == 331 or t2.to_int() == 332:
			return false #treta
			
	if t1.to_int() == 331:
		if t2.to_int() == 221 or t2.to_int() == 223 :
			return true #suave
		if t2.to_int() == 332 or t2.to_int() == 112 or t2.to_int() == 113:
			return false #treta
			
	if t1.to_int() == 332:
		if t2.to_int() == 221 or t2.to_int() == 223 or t2.to_int() == 331:
			return true #suave
		if t2.to_int() == 113 or t2.to_int() == 112:
			return false #treta
	




#func ex(area):
#	var ex = pre_ex.instance()
#	ex.position = area.position
#	add_child(ex)
#	yield(get_tree().create_timer(.8), "timeout")