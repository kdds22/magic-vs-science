tool
extends Area2D



var Player

var combination : Array = []


# Called when the node enters the scene tree for the first time.
func _ready():
	Global_Player.cur_player = 1 #set Player
	Player = 1
	$Sprite.scale.y = 0.8
	add_to_group("cientist")
	

func hit():
	for i in 5:
		$Sprite.visible = false
		yield(get_tree().create_timer(.1), "timeout")
		$Sprite.visible = true
		yield(get_tree().create_timer(.1), "timeout")


func _process(delta):
#	print(flag_shot)
	pass

