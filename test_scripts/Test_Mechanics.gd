extends Node2D

func _ready():
	get_tree().paused = false
	$Result/Cientist/Win.hide()
	$Result/Cientist/Los.hide()
	$Result/Mage/Win.hide()
	$Result/Mage/Los.hide()
	$Result/Node2D/Button.hide()
	
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
	get_tree().reload_current_scene()
