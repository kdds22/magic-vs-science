extends Node2D


export (int, 1, 500, 10) var velocity : int = 200


onready var pre_mg_ele : Array = [
	preload("res://scenes/Elements_Grim.tscn"),
	preload("res://scenes/Elements_Mana.tscn"),
	preload("res://scenes/Elements_Item.tscn")
]


onready var type_c : Array =  [
					"res://test_assets/nucleo.png",
					"res://test_assets/gama.png",
					"res://test_assets/lazer.png"]

onready var type_m : Array = [
					"res://test_assets/imunity.png",
					"res://test_assets/mana.png",
					"res://test_assets/item.png"]


export (String) var cat : String
export (String) var path : String
export (Vector2) var dir : Vector2

var ele

#func init(cat = self.cat, path = self.path, dir = self.dir):
func init(cat:String, path:String, dir:Vector2, velocity:int):
	_ready()
	var tex : String = ""
	self.cat = cat
	self.path = path
	self.dir = dir
	self.velocity = velocity
	
	
	if cat == "ct" or cat == "mg":
		print(path," - ", cat, dir, velocity)
		match path:
			"nucleo":
				tex = type_c[0]
			"gama":
				tex = type_c[1]
			"lazer":
				tex = type_c[2]
			"imunity":
				tex = type_m[0]
				ele = pre_mg_ele[0]
			"mana":
				tex = type_m[1]
				ele = pre_mg_ele[1]
			"item":
				tex = type_m[2]
				ele = pre_mg_ele[2]
		
		
		$Area2D/Sprite.texture = load(tex)
		

func get_ele():
	return ele

func _ready():
	
	
	pass
	
	


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
