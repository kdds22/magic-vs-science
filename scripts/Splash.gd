extends Node2D



var next_scene = preload("res://Test_Mechanics.tscn")
#var credits = preload(






func _on_btn_play_pressed():
	get_tree().change_scene("res://Test_Mechanics.tscn")



func _on_btn_credits_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")



func _on_Button_Tutorial_pressed():
#	$Tween.interpolate_property($Tutorial, "scale", Vector2.ZERO, Vector2(1,1), 1, Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.interpolate_property($Tutorial, "position", Vector2(-720,0), Vector2(0,0), 1, Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.start()
	pass # Replace with function body.


func _on_tex_btn_tutorial_pressed():
#	$Tween.interpolate_property($Tutorial, "scale", Vector2(1,1), Vector2.ZERO, 1, Tween.TRANS_EXPO, Tween.EASE_OUT)
	$Tween.interpolate_property($Tutorial, "position", Vector2(0,0), Vector2(-720,0), 1, Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.start()
	pass # Replace with function body.


func _on_Tween_tween_all_completed():
	pass # Replace with function body.


