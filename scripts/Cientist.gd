tool
extends Area2D






var cur_type_ct = "nucleo"
var ct_combinations : Array
var dir : Vector2
var cur_velocity_element_ct = 320

#enum player_type {CIENTISTA, MAGO}

var cientist = "ct"
var cientist_nucleo = "nucleo"
var cientist_gama = "gama"
var cientist_lazer = "lazer"
var dir_ct = Vector2(0,1)

var flag_shot = false

onready var pre_element = preload("res://elemento.tscn")






var Player

var combination : Array = []
var merge_comb

signal game_over_cientist
signal hit_cientist

# Called when the node enters the scene tree for the first time.
func _ready():
	Global_Player_Cientist.cur_player = 1 #set Player
	Player = 1
	$Sprite.scale.y = 0.8
#	$Sprite.texture = load(cientist_sprite)
	add_to_group("cientist")
	flag_shot = true
	

func hit(value):
	
	Global_Player_Cientist.life -= value
	emit_signal("hit_cientist", value)
	
	if Global_Player_Cientist.life <= 0:
		emit_signal("game_over_cientist")
	
	for i in 5:
		$Sprite.visible = false
		yield(get_tree().create_timer(.1), "timeout")
		$Sprite.visible = true
		yield(get_tree().create_timer(.1), "timeout")


func _process(delta):
#	print(flag_shot)
	pass



























func identify(player, cur_type):
	var pos
	var velocity
	if player == "ct":
#		dir.y = 1
		dir = dir_ct
		pos = get_parent().get_node("Pos_CT_Action").position
		velocity = cur_velocity_element_ct
	
	action(player, cur_type, dir, pos, velocity)
	
	pass


func action(who:String, type:String, dir:Vector2, pos:Vector2, velocity:int):
#	yield(get_tree().create_timer(2, true), "timeout")
#	if !flag_shot:
#		return
	var element = pre_element.instance()
	element.init(who, type, dir, velocity)
	var pre_ele = element.get_ele()
#	print("pre-ele: ",pre_ele)
	var ele = pre_ele[0].instance()
#	print("ele: ",ele)
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

func _on_cientist_idle():
	$AnimationPlayer.play("idle")
	pass

func _on_cientist_btn_atack_pressed():
	Global_Player_Cientist.cur_player = 1
	$AnimationPlayer.play("atack")
	#shot after atack animation
	flag_shot = false
	yield($AnimationPlayer, "animation_finished")
	flag_shot = true
	#now, shot
	identify("ct", cur_type_ct)
	pass
func _on_cientist_btn_dodge_pressed():
	Global_Player_Cientist.cur_player = 1
	$AnimationPlayer.play("dodge")
	$CollisionShape2D.disabled = true
	yield(get_tree().create_timer(0.5), "timeout")
	$CollisionShape2D.disabled = false
	pass # Replace with function body.


func _on_cientist_btn_nucleo_pressed():
	Global_Player_Cientist.cur_player = 1
	cur_type_ct = cientist_nucleo
func _on_cientist_btn_gama_pressed():
	Global_Player_Cientist.cur_player = 1
	cur_type_ct = cientist_gama
	pass # Replace with function body.
func _on_cientist_btn_lazer_pressed():
	Global_Player_Cientist.cur_player = 1
	cur_type_ct = cientist_lazer
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
			set_debug_element(text[1])
		else:
			pass
#		set_input_text(text[0], text[1])



func set_debug_element(value):
	if Global_Player_Cientist.cur_player == 1:
		if value == "Nucleus":
			_on_cientist_btn_nucleo_pressed()
			set_combination(0)
		if value == "Energy":
			_on_cientist_btn_gama_pressed()
			set_combination(1)
		if value == "UV":
			_on_cientist_btn_lazer_pressed()
			set_combination(2)
		if value == "Dodge_Cientist":
			_on_cientist_btn_dodge_pressed()
		
		if ct_combinations.size() == 3:
#			var comb = get_combination()
#			print(comb)
			get_combination()
			if value == "Atack_Cientist" and merge_comb != null:
				_on_cientist_btn_atack_pressed()
				ct_combinations.clear()
				for i in get_parent().get_node("Show_Elements2/Control/HBoxContainer").get_children():
					for j in i.get_children():
						j.queue_free()
					Global_Player_Cientist.cur_comb_ct = ""
		
		if ct_combinations.size() > 3:
			ct_combinations.clear()
			for i in get_parent().get_node("Show_Elements2/Control/HBoxContainer").get_children():
				for j in i.get_children():
					j.queue_free()
				Global_Player_Cientist.cur_comb_ct = ""
				merge_comb = null
	
#	print(mg_combinations)

	pass
	

func set_combination(value):
	
	if Global_Player_Cientist.cur_player == 1:
		ct_combinations.append(value)
		if ct_combinations.size() < 4:
			Global_Player_Cientist.cur_comb_ct += str(value + 1)
	
			var i = get_parent().get_node("Show_Elements2/Control/HBoxContainer")
	
			var pre = Global_Player_Cientist.cur_tex_element(value).instance()
	
			pre.scale = Vector2(.5, .5)
			i.get_child(ct_combinations.size() - 1).add_child(pre)


func get_combination():
	var global_comb
	if Global_Player_Cientist.cur_player == 1:
		global_comb = Global_Player_Cientist.cur_comb_ct

	if Global_Player_Cientist.cur_player == 1:
		if global_comb == "112" or global_comb == "211" or global_comb == "121":
			Global_Player_Cientist.cur_comb_ct = "112"
			get_global_combination(1, 0, global_comb)
		elif global_comb == "113" or global_comb == "311" or global_comb == "131":
			Global_Player_Cientist.cur_comb_ct = "113"
			get_global_combination(1, 1, global_comb)
		elif global_comb == "221" or global_comb == "212" or global_comb == "122":
			Global_Player_Cientist.cur_comb_ct = "221"
			get_global_combination(1, 2, global_comb)
		elif global_comb == "223" or global_comb == "232" or global_comb == "322":
			Global_Player_Cientist.cur_comb_ct = "223"
			get_global_combination(1, 3, global_comb)
		elif global_comb == "331" or global_comb == "313" or global_comb == "133":
			Global_Player_Cientist.cur_comb_ct = "331"
			get_global_combination(1, 4, global_comb)
		elif global_comb == "332" or global_comb == "323" or global_comb == "233":
			Global_Player_Cientist.cur_comb_ct = "332"
			get_global_combination(1, 5, global_comb)
		else:
			for i in get_parent().get_node("Show_Elements2/Control/HBoxContainer").get_children():
				for j in i.get_children():
					j.queue_free()
				Global_Player_Cientist.cur_comb_ct = ""
				merge_comb = null
			return


func get_global_combination(type, value, global_comb):
	flag_shot = true
	
	if Global_Player_Cientist.cur_player == 1:
		var i = Global_Player_Cientist.ct_comb_name[value] #String name
		cur_type_ct = i
		var j = Global_Player_Cientist.ct_comb_path[value].instance() #packet scene
		merge_comb = get_parent().get_node("Elements").cientist_combinations[i]
	pass











