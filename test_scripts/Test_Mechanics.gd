extends Node2D

func _ready():
	get_tree().paused = false
	$Result/Cientist/Win.hide()
	$Result/Cientist/Los.hide()
	$Result/Mage/Win.hide()
	$Result/Mage/Los.hide()
	$Result/Node2D/Button.hide()
	
	reset_lifes()
	
	pass

func reset_lifes():
	Global_Player_Cientist.reset_life()
	Global_Player_Mage.reset_life()
	$Lifes/Cientist/TextureProgress.max_value = Global_Player_Cientist.life
	$Lifes/Cientist/TextureProgress.min_value = 0
	$Lifes/Mage/TextureProgress.max_value = Global_Player_Mage.life
	$Lifes/Mage/TextureProgress.min_value = 0

func set_life_bar(value, who):
	if who == 0:
		$Lifes/Mage/TextureProgress.value = Global_Player_Mage.life
	elif who == 1:
		$Lifes/Cientist/TextureProgress.value = Global_Player_Cientist.life
	
	pass


func _process(delta):
	print("Mage life = ", Global_Player_Mage.life)
	print("Cientist life = ", Global_Player_Cientist.life)
	pass


func _on_Mage_game_over_mage():
	get_tree().paused = true
	$Result/Mage/Los.show()
	$Result/Cientist/Win.show()
	yield(get_tree().create_timer(2), "timeout")
	$Result/Node2D/Button.show()
	pass # Replace with function body.


func _on_Cientist_game_over_cientist():
	get_tree().paused = true
	$Result/Cientist/Los.show()
	$Result/Mage/Win.show()
	yield(get_tree().create_timer(2), "timeout")
	$Result/Node2D/Button.show()
	pass # Replace with function body.


func _on_Button_pressed():
	reset_lifes()
	get_tree().reload_current_scene()


func _on_Mage_hit_mage(value):
	set_life_bar(value, 0)


func _on_Cientist_hit_cientist(value):
	set_life_bar(value, 1)
