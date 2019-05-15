extends Area2D



var type_c : Array =  ["res://test_assets/nucleo.png",
					"res://test_assets/gama.png",
					"res://test_assets/lazer.png"]
var type_m : Array = ["res://test_assets/imunity.png",
					"res://test_assets/mana.png",
					"res://test_assets/item.png"]


var tex = null
var direction : Vector2 = Vector2.ZERO


func _init(cat, path, dir):
	if cat == "ct":
		if path == "nucleo":
			tex = type_c[0]
		if path == "gama":
			tex = type_c[1]
		if path == "lazer":
			tex = type_c[2]
	if cat == "mg":
		if path == "imunity":
			tex = type_m[0]
		if path == "mana":
			tex = type_m[1]
		if path == "item":
			tex = type_m[2]
	
	$Sprite.texture = tex
	direction = dir


func _process(delta):
	#continues
	pass