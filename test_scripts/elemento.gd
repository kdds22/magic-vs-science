extends Node2D


export (int, 1, 500, 10) var velocity : int = 200


onready var type_c : Array =  ["res://test_assets/nucleo.png",
					"res://test_assets/gama.png",
					"res://test_assets/lazer.png"]
onready var type_m : Array = ["res://test_assets/imunity.png",
					"res://test_assets/mana.png",
					"res://test_assets/item.png"]

export (String) var cat : String
export (String) var path : String
export (Vector2) var dir : Vector2


#func init(cat = self.cat, path = self.path, dir = self.dir):
func init(cat:String, path:String, dir:Vector2, velocity:int):
	var tex : String = ""
	self.cat = cat
	self.path = path
	self.dir = dir
	self.velocity = velocity
	
	if cat == "ct" or cat == "mg":
		match path:
			"nucleo":
				tex = type_c[0]
			"gama":
				tex = type_c[1]
			"lazer":
				tex = type_c[2]
			"imunity":
				tex = type_m[0]
			"mana":
				tex = type_m[1]
			"item":
				tex = type_m[2]
		
		$Area2D/Sprite.texture = load(tex)


func _ready():
	print("ready")
	
	


func _process(delta):
	position += dir * delta * velocity

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		queue_free()
