extends Node2D
#
#var player
#var cur_type_ct = "nucleo"
#var ct_combinations : Array
#var cur_type_mg = "imunity"
#var mg_combinations : Array
#var dir : Vector2
#var cur_velocity_element_ct = 320
#var cur_velocity_element_mg = 320
#
##enum player_type {CIENTISTA, MAGO}
#
#var cientist = "ct"
#var cientist_nucleo = "nucleo"
#var cientist_gama = "gama"
#var cientist_lazer = "lazer"
#var dir_ct = Vector2(0,1)
#var mage = "mg"
#var mage_imunity = "imunity"
#var mage_mana = "mana"
#var mage_item = "item"
#var dir_mg = Vector2(0,-1)
#
#var flag_shot = false
#
#onready var pre_element = preload("res://elementos.tscn")
#
#onready var arrow_ct = $Node2D/Control/Cientist/arrow_ct
#onready var arrow_mg = $Node2D/Control/Mage/arrow_mg
#
#func _ready():
##	Global_Player.cur_player = 0 #set Mage
#
#	$Node2D/Control/Cientist/HSlider.min_value = 1
#	$Node2D/Control/Cientist/HSlider.max_value = 500
#	$Node2D/Control/Cientist/HSlider.step = 10
#	$Node2D/Control/Mage/HSlider.min_value = 1
#	$Node2D/Control/Mage/HSlider.max_value = 500
#	$Node2D/Control/Mage/HSlider.step = 10
#	pass
#
#func _process(delta):
##	print(flag_shot)
#	pass
#
#func identify(player, cur_type):
#	var pos
#	var velocity
#	if player == "ct":
##		dir.y = 1
#		dir = dir_ct
#		pos = $Pos_CT_Action.position
#		velocity = cur_velocity_element_ct
#	if player == "mg":
##		dir.y = -1
#		dir = dir_mg
#		pos = $Pos_MG_Action.position
#		velocity = cur_velocity_element_mg
#
#	action(player, cur_type, dir, pos, velocity)
#
#	pass
#
#
#func action(who:String, type:String, dir:Vector2, pos:Vector2, velocity:int):
##	yield(get_tree().create_timer(2, true), "timeout")
#	if !flag_shot:
#		return
#	var element = pre_element.instance()
#	element.init(who, type, dir, velocity)
#	var pre_ele = element.get_ele()
#	var ele = pre_ele[0].instance()
#	ele.position = pos
#	ele.set_flag(true)
#	ele.dir = pre_ele[1]
#	$Elements.add_child(ele)
##	element.init(who, type, dir, velocity) # identify elemnt
##	action()
#
#
#func _on_cientist_btn_atack_pressed():
#	Global_Player.cur_player = 1
#	identify("ct", cur_type_ct)
#	pass
#func _on_cientist_btn_dodge_pressed():
#	Global_Player.cur_player = 1
#	$Cientist/AnimationPlayer.play("dodge")
#	$Cientist/CollisionShape2D.disabled = true
#	yield(get_tree().create_timer(0.5), "timeout")
#	$Cientist/CollisionShape2D.disabled = false
#	pass # Replace with function body.
#
#func _on_mage_btn_atack_pressed():
#	Global_Player.cur_player = 0
#	identify("mg", cur_type_mg)
#func _on_mage_btn_dodge_pressed():
#	Global_Player.cur_player = 0
#	$Mage/AnimationPlayer.play("dodge")
#	$Mage/CollisionShape2D.disabled = true
#	yield(get_tree().create_timer(0.5), "timeout")
#	$Mage/CollisionShape2D.disabled = false
#
#func _on_cientist_btn_nucleo_pressed():
#	Global_Player.cur_player = 1
#	cur_type_ct = cientist_nucleo
#	arrow_ct.position = $Node2D/Control/Cientist/Pos_Nucleo.position
#func _on_cientist_btn_gama_pressed():
#	Global_Player.cur_player = 1
#	cur_type_ct = cientist_gama
#	arrow_ct.position = $Node2D/Control/Cientist/Pos_Gama.position
#	pass # Replace with function body.
#func _on_cientist_btn_lazer_pressed():
#	Global_Player.cur_player = 1
#	cur_type_ct = cientist_lazer
#	arrow_ct.position = $Node2D/Control/Cientist/Pos_Lazer.position
#	pass # Replace with function body.
#
#func _on_mage_btn_imunity_pressed():
#	Global_Player.cur_player = 0
#	cur_type_mg = mage_imunity
#	arrow_mg.position = $Node2D/Control/Mage/Pos_imunity.position
#	pass # Replace with function body.
#func _on_mage_btn_mana_pressed():
#	Global_Player.cur_player = 0
#	cur_type_mg = mage_mana
#	arrow_mg.position = $Node2D/Control/Mage/Pos_Mana.position
#	pass # Replace with function body.
#func _on_mage_btn_item_pressed():
#	Global_Player.cur_player = 0
#	cur_type_mg = mage_item
#	arrow_mg.position = $Node2D/Control/Mage/Pos_Item.position
#	pass # Replace with function body.
#
#func _on_cientist_HSlider_value_changed(value):
#	$Node2D/Control/Cientist/HSlider/value.text = str(int(value))
#	cur_velocity_element_ct = int(value)
#func _on_mage_HSlider_value_changed(value):
#	$Node2D/Control/Mage/HSlider/value.text = str(int(value))
#	cur_velocity_element_mg = int(value)
#
#func hit(who):
#	if who == "cientist":
#		$Cientist/hit.visible = true
#		yield(get_tree().create_timer(.3), "timeout")
#		$Cientist/hit.visible = false
#
#	if who == "mage":
#		$Mage/hit.visible = true
#		yield(get_tree().create_timer(.3), "timeout")
#		$Mage/hit.visible = false
#
#
#func _input(event):
#
#	if event.is_pressed() and not event.is_echo():
#		var text = $Elements.identify_elements(event.as_text())
#		set_debug_element(text[1])
##		set_input_text(text[0], text[1])
#
#
#func set_input_text(text, type):
#
#	$Node2D/Control/Input/lbl_Text.text = text
#	$Node2D/Control/Input/lbl_Element.text = type
#
#	pass
#
#
#func set_debug_element(value):
#	if Global_Player.cur_player == 0:
#		if value == "Mana":
#			_on_mage_btn_mana_pressed()
#			set_combination(0)
#		if value == "Knowledge":
#			_on_mage_btn_imunity_pressed()
#			set_combination(1)
#		if value == "Item":
#			_on_mage_btn_item_pressed()
#			set_combination(2)
#		if value == "Dodge":
#			_on_mage_btn_dodge_pressed()
#
#		if mg_combinations.size() == 3:
#			var comb = get_combination()
#	#		print(comb)
#			if value == "Atack":
#				_on_mage_btn_atack_pressed()
#				mg_combinations.clear()
#				for i in $Show_Elements/Control/HBoxContainer.get_children():
#					for j in i.get_children():
#						j.queue_free()
#					Global_Player.cur_comb_mg = ""
#
#		if mg_combinations.size() > 3:
#			mg_combinations.clear()
#			for i in $Show_Elements/Control/HBoxContainer.get_children():
#				for j in i.get_children():
#					j.queue_free()
#				Global_Player.cur_comb_mg = ""
#
#	if Global_Player.cur_player == 1:
#		if value == "Nucleus":
#			_on_cientist_btn_nucleo_pressed()
#			set_combination(0)
#		if value == "Energy":
#			_on_cientist_btn_gama_pressed()
#			set_combination(1)
#		if value == "UV":
#			_on_cientist_btn_lazer_pressed()
#			set_combination(2)
#		if value == "Dodge":
#			_on_cientist_btn_dodge_pressed()
#
#		if ct_combinations.size() == 3:
#			var comb = get_combination()
#	#		print(comb)
#			if value == "Atack":
#				_on_cientist_btn_atack_pressed()
#				ct_combinations.clear()
#				for i in $Show_Elements2/Control/HBoxContainer.get_children():
#					for j in i.get_children():
#						j.queue_free()
#					Global_Player.cur_comb_ct = ""
#
#		if ct_combinations.size() > 3:
#			ct_combinations.clear()
#			for i in $Show_Elements2/Control/HBoxContainer.get_children():
#				for j in i.get_children():
#					j.queue_free()
#				Global_Player.cur_comb_ct = ""
#
##	print(mg_combinations)
#
#	pass
#
#
#func set_combination(value):
#	if Global_Player.cur_player == 0:
#		mg_combinations.append(value)
#		if mg_combinations.size() < 4:
#			Global_Player.cur_comb_mg += str(value + 1)
#
#			var i = $Show_Elements/Control/HBoxContainer
#
#			var pre = Global_Player.cur_tex_element(value).instance()
#
#			pre.scale = Vector2(.5, .5)
#			i.get_child(mg_combinations.size() - 1).add_child(pre)
#
#	if Global_Player.cur_player == 1:
#		ct_combinations.append(value)
#		if ct_combinations.size() < 4:
#			Global_Player.cur_comb_ct += str(value + 1)
#
#			var i = $Show_Elements2/Control/HBoxContainer
#
#			var pre = Global_Player.cur_tex_element(value).instance()
#
#			pre.scale = Vector2(.5, .5)
#			i.get_child(ct_combinations.size() - 1).add_child(pre)
#
#
#func get_combination():
#	var global_comb
#	if Global_Player.cur_player == 0:
#		global_comb = Global_Player.cur_comb_mg
#	if Global_Player.cur_player == 1:
#		global_comb = Global_Player.cur_comb_ct
##	print(global_comb)
#	if Global_Player.cur_player == 0:
#		if global_comb == "112" or global_comb == "211" or global_comb == "121":
#				get_global_combination(0, 0, global_comb)
#		elif global_comb == "113" or global_comb == "311" or global_comb == "131":
#				get_global_combination(0, 1, global_comb)
#		elif global_comb == "221" or global_comb == "212" or global_comb == "122":
#				get_global_combination(0, 2, global_comb)
#		elif global_comb == "223" or global_comb == "232" or global_comb == "322":
#				get_global_combination(0, 3, global_comb)
#		elif global_comb == "331" or global_comb == "313" or global_comb == "133":
#				get_global_combination(0, 4, global_comb)
#		elif global_comb == "332" or global_comb == "323" or global_comb == "233":
#				get_global_combination(0, 5, global_comb)
#		else:
#			return
#
#	if Global_Player.cur_player == 1:
#		if global_comb == "112" or global_comb == "211" or global_comb == "121":
#				get_global_combination(1, 0, global_comb)
#		elif global_comb == "113" or global_comb == "311" or global_comb == "131":
#				get_global_combination(1, 1, global_comb)
#		elif global_comb == "221" or global_comb == "212" or global_comb == "122":
#				get_global_combination(1, 2, global_comb)
#		elif global_comb == "223" or global_comb == "232" or global_comb == "322":
#				get_global_combination(1, 3, global_comb)
#		elif global_comb == "331" or global_comb == "313" or global_comb == "133":
#				get_global_combination(1, 4, global_comb)
#		elif global_comb == "332" or global_comb == "323" or global_comb == "233":
#				get_global_combination(1, 5, global_comb)
#		else:
#			return
#
#
#func get_global_combination(type, value, global_comb):
#	flag_shot = true
#	var comb
#	if Global_Player.cur_player == 0:
#		var i = Global_Player.mg_comb_name[value] #String name
#		cur_type_mg = i
#		var j = Global_Player.mg_comb_path[value].instance() #packet scene
#		comb = $Elements.mage_combinations[i]
#
#	if Global_Player.cur_player == 1:
#		var i = Global_Player.ct_comb_name[value] #String name
#		cur_type_ct = i
#		var j = Global_Player.ct_comb_path[value].instance() #packet scene
#		comb = $Elements.cientist_combinations[i]
#	pass
#
#
#
#
#
#
#
