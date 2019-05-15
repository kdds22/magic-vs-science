extends Node2D


export (int, 1, 500, 10) var velocity : int = 250



#onready var type_c : Array =  ["res://test_assets/nucleo.png",
#					"res://test_assets/gama.png",
#					"res://test_assets/lazer.png"]
#onready var type_m : Array = ["res://test_assets/imunity.png",
#					"res://test_assets/mana.png",
#					"res://test_assets/item.png"]


var tex
var direction : Vector2 = Vector2.ZERO

#cat -> categorie_player
#path -> element_type
#dir -> Vector_Direction
func _init(cat : String, path : String, dir : Vector2):
	if cat == "ct":
		if path == "nucleo":
			pass
#			tex = type_c[0]
		if path == "gama":
			pass
#			tex = type_c[1]
		if path == "lazer":
			pass
#			tex = type_c[2]
	if cat == "mg":
		if path == "imunity":
			pass
#			tex = type_m[0]
		if path == "mana":
			pass
#			tex = type_m[1]
		if path == "item":
			pass
#			tex = type_m[2]
	
#	$Sprite.texture = tex
	$Area2D/Sprite.texture = load("res://test_assets/nucleo.png")
	direction = dir
	


func _ready():
	_init("ct", "nucleo", Vector2(0, 1))
	pass

func _process(delta):
	
	if position.y >= 980:
		queue_free()
	position += position * direction * delta
	print(position)
	pass


func instance_elemnt():
	
	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		#player_method_hit
		queue_free()
	else:
		pass



