extends Node2D


export (int, 1, 500, 10) var velocity : int = 200


onready var pre_mg_ele : Array = [
	preload("res://scenes/Elements_Grim.tscn"),
	preload("res://scenes/Elements_Mana.tscn"),
	preload("res://scenes/Elements_Item.tscn")
]
onready var pre_ct_ele : Array = [
	preload("res://scenes/Elements_Nucleo.tscn"),
	preload("res://scenes/Elements_Energy.tscn"),
	preload("res://scenes/Elements_UV.tscn")
]



export (String) var cat : String
export (String) var path : String
export (Vector2) var dir : Vector2

var ele

var comb_path

#func init(cat = self.cat, path = self.path, dir = self.dir):
func init(cat:String, path:String, dir:Vector2, velocity:int):
	_ready()
	var tex : String = ""
	self.cat = cat
	self.path = path
	self.dir = dir
	self.velocity = velocity
	
#	print(self.dir)
#	print("ops 2")
	
	if cat == "mg":
		for i in Global_Player_Mage.mg_comb_name.size():
			if path == Global_Player_Mage.mg_comb_name[i]:
				ele = Global_Player_Mage.mg_comb_path[i]
#				print(path)
	if cat == "ct":
		for i in Global_Player_Cientist.ct_comb_name.size():
			if path == Global_Player_Cientist.ct_comb_name[i]:
				ele = Global_Player_Cientist.ct_comb_path[i]
#				print(path)
			
	
	if cat == "ct" or cat == "mg":
		
		match path:
			"nucleo":
#				tex = type_c[0]
				ele = pre_ct_ele[0]
			"gama":
#				tex = type_c[1]
				ele = pre_ct_ele[1]
			"lazer":
#				tex = type_c[2]
				ele = pre_ct_ele[2]
			"imunity":
#				tex = type_m[0]
				ele = pre_mg_ele[0]
			"mana":
#				tex = type_m[1]
				ele = pre_mg_ele[1]
			"item":
#				tex = type_m[2]
				ele = pre_mg_ele[2]
		
		
#		$Area2D/Sprite.texture = load(tex)
		

func get_ele():
	return [ele, dir]


func _process(delta):
	position += dir * delta * velocity

func _on_Area2D_area_entered(area : Area2D):
	if area.is_in_group("player"):
		if area.is_in_group("mage"):
#			area.get_tree().get_root().get_child(0).hit("mage")
			area.get_tree().get_root().get_child(get_child_count()).hit("mage")
		if area.is_in_group("cientist"):
#			area.get_tree().get_root().get_child(0).hit("cientist")
			area.get_tree().get_root().get_child(get_child_count()).hit("cientist")
		queue_free()
