extends Node2D



var next_scene = preload("res://Test_Mechanics.tscn")
#var credits = preload(






func _on_btn_play_pressed():
	get_tree().change_scene("res://Test_Mechanics.tscn")



func _on_btn_credits_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")









