tool
extends Area2D

export (String, FILE, "*.png") var mage_sprite : String
export (String, FILE, "*.png") var cientist_sprite : String

enum Type {MAGE, CIENTIST} 

export (Type) var Player


var combination : Array = []


# Called when the node enters the scene tree for the first time.
func _ready():

	if Player == 0:
		$Sprite.scale.y = 0.8
		$Sprite.texture = load(mage_sprite)
		add_to_group("mage")
	if Player == 1:
		$Sprite.scale.y = -0.8
		$Sprite.texture = load(cientist_sprite)
		add_to_group("cientist")
	
	pass

func _draw():
	
	if not Engine.is_editor_hint():
		return
	
	if Player == 0:
		$Sprite.scale.y = 0.8
		$Sprite.texture = load(mage_sprite)
	if Player == 1:
		$Sprite.scale.y = -0.8
		$Sprite.texture = load(cientist_sprite)
	
	pass









