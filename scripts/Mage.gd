tool
extends Area2D






var cur_type_mg = "mana"
var mg_combinations : Array
var dir : Vector2
var cur_velocity_element_mg = 320

#enum player_type {CIENTISTA, MAGO}

var mage = "mg"
var mage_imunity = "imunity"
var mage_mana = "mana"
var mage_item = "item"
var dir_mg = Vector2(0,-1)

var flag_shot = false

onready var pre_element = preload("res://elemento.tscn")




var Player

var combination : Array = []
var merge_comb

var okidoki = false
signal critical
signal shoted

signal game_over_mage
signal hit_mage


# Called when the node enters the scene tree for the first time.
func _ready():
	Global_Player_Mage.cur_player = 0 #set Player
	Player = 0
	$Sprite.scale.y = 0.8
	add_to_group("mage")
	flag_shot = true
	

func hit(value):
	
	Global_Player_Mage.life -= value
	emit_signal("hit_mage", value)
	
	if Global_Player_Mage.life <= 0:
		emit_signal("game_over_mage")
	
	for i in 5:
		$Sprite.visible = false
		yield(get_tree().create_timer(.1), "timeout")
		$Sprite.visible = true
		yield(get_tree().create_timer(.1), "timeout")




























func identify(player, cur_type):
	var pos
	var velocity
	if player == "mg":
#		dir.y = -1
		dir = dir_mg
		pos = get_parent().get_node("Pos_MG_Action").position
		velocity = cur_velocity_element_mg
	
	action(player, cur_type, dir, pos, velocity)
	
	pass


func action(who:String, type:String, dir:Vector2, pos:Vector2, velocity:int):
#	yield(get_tree().create_timer(2, true), "timeout")
#	if !flag_shot:
#		return
	var element = pre_element.instance()
	element.init(who, type, dir, velocity)
	var pre_ele = element.get_ele()
	var ele = pre_ele[0].instance()
	ele.position = pos
	ele.set_flag(true)
	ele.dir = pre_ele[1]
	
	if merge_comb != null:
		ele.set_attr(merge_comb)
	else:
		return
	get_parent().get_node("Elements").add_child(ele)
#	element.init(who, type, dir, velocity) # identify elemnt
#	action()

func _on_mage_idle():
	$AnimationPlayer.play("idle")
	pass


func _on_mage_btn_atack_pressed():
	Global_Player_Mage.cur_player = 0
	$AnimationPlayer.play("atack")
	flag_shot = false
	yield($AnimationPlayer, "animation_finished")

func shot():
	emit_signal("shoted")
	flag_shot = true
	identify("mg", cur_type_mg)

func _on_mage_btn_dodge_pressed():
	Global_Player_Mage.cur_player = 0
	$AnimationPlayer.play("dodge")
	$CollisionShape2D.disabled = true
	yield(get_tree().create_timer(0.5), "timeout")
	$CollisionShape2D.disabled = false


func _on_mage_btn_imunity_pressed():
	Global_Player_Mage.cur_player = 0
	cur_type_mg = mage_imunity
	pass # Replace with function body.
func _on_mage_btn_mana_pressed():
	Global_Player_Mage.cur_player = 0
	cur_type_mg = mage_mana
	pass # Replace with function body.
func _on_mage_btn_item_pressed():
	Global_Player_Mage.cur_player = 0
	cur_type_mg = mage_item
	pass # Replace with function body.


#
#func hit(who):
#	if who == "cientist":
#		$Cientist/hit.visible = true
#		yield(get_tree().create_timer(.3), "timeout")
#		$Cientist/hit.visible = false


func _input(event):
	
	if event.is_pressed() and not event.is_echo():
		var text = get_parent().get_node("Elements").identify_elements(event.as_text())
		if flag_shot:
#			print(text)
			set_debug_element(text[1])
		else:
			pass
#		set_input_text(text[0], text[1])



func set_debug_element(value):
	if Global_Player_Mage.cur_player == 0:
		if value == "Mana":
			_on_mage_btn_mana_pressed()
			set_combination(0)
		if value == "Knowledge":
			_on_mage_btn_imunity_pressed()
			set_combination(1)
		if value == "Item":
			_on_mage_btn_item_pressed()
			set_combination(2)
		if value == "Dodge_Mage":
			_on_mage_btn_dodge_pressed()
		
		if mg_combinations.size() == 3:
#			var comb = get_combination()
#			print(comb)
			get_combination()
#			print(merge_comb)
			if value == "Atack_Mage" and merge_comb != null:
				_on_mage_btn_atack_pressed()
				mg_combinations.clear()
				for i in get_parent().get_node("Show_Elements/Control/HBoxContainer").get_children():
					for j in i.get_children():
						j.queue_free()
					Global_Player_Mage.cur_comb_mg = ""
			
			if value == "Atack_Mage" and okidoki == true:
				clear_ele_base()

		if mg_combinations.size() > 3:
			mg_combinations.clear()
			for i in get_parent().get_node("Show_Elements/Control/HBoxContainer").get_children():
				for j in i.get_children():
					j.queue_free()
				Global_Player_Mage.cur_comb_mg = ""
#				merge_comb = null
	
#	print(mg_combinations)

	pass
	

func set_combination(value):
	
	if Global_Player_Mage.cur_player == 0:
		mg_combinations.append(value)
		if mg_combinations.size() < 4:
			Global_Player_Mage.cur_comb_mg += str(value + 1)

			var i = get_parent().get_node("Show_Elements/Control/HBoxContainer")

			var pre = Global_Player_Mage.cur_tex_element(value).instance()

			pre.scale = Vector2(.5, .5)
			i.get_child(mg_combinations.size() - 1).add_child(pre)


func get_combination():
	var global_comb
	if Global_Player_Mage.cur_player == 0:
		global_comb = Global_Player_Mage.cur_comb_mg

	if Global_Player_Mage.cur_player == 0:
		if global_comb == "112" or global_comb == "211" or global_comb == "121":
			Global_Player_Mage.cur_comb_mg = "112"
			get_global_combination(0, 0, global_comb)
		elif global_comb == "113" or global_comb == "311" or global_comb == "131":
			Global_Player_Mage.cur_comb_mg = "113"
			get_global_combination(0, 1, global_comb)
		elif global_comb == "221" or global_comb == "212" or global_comb == "122":
			Global_Player_Mage.cur_comb_mg = "221"
			get_global_combination(0, 2, global_comb)
		elif global_comb == "223" or global_comb == "232" or global_comb == "322":
			Global_Player_Mage.cur_comb_mg = "223"
			get_global_combination(0, 3, global_comb)
		elif global_comb == "331" or global_comb == "313" or global_comb == "133":
			Global_Player_Mage.cur_comb_mg = "331"
			get_global_combination(0, 4, global_comb)
		elif global_comb == "332" or global_comb == "323" or global_comb == "233":
			Global_Player_Mage.cur_comb_mg = "332"
			get_global_combination(0, 5, global_comb)
		else:
			if global_comb == "123" or global_comb == "132" or global_comb == "213" or global_comb == "231" or global_comb == "321" or global_comb == "312" or global_comb == "111" or global_comb == "222" or global_comb == "333":
				if not okidoki:
					critical()
				else: clear_ele_base()
			
#			
			return


func get_global_combination(type, value, global_comb):
#	print(global_comb)
	flag_shot = true
	
	if Global_Player_Mage.cur_player == 0:
		var i = Global_Player_Mage.mg_comb_name[value] #String name
#		print("i: ",i)
		cur_type_mg = i
		var j = Global_Player_Mage.mg_comb_path[value].instance() #packet scene
		merge_comb = get_parent().get_node("Elements").mage_combinations[i]
	pass

func critical():
	okidoki = true
#	Global_Player_Cientist.cur_comb_ct = ""
#	merge_comb = null
#	clear_ele_base()
	pass

func clear_ele_base():
	
	for i in get_parent().get_node("Show_Elements/Control/HBoxContainer").get_children():
		for j in i.get_children():
			j.queue_free()
	
		Global_Player_Mage.cur_comb_mg = ""
		merge_comb = null
	
	emit_signal("critical")
	
	okidoki = false







