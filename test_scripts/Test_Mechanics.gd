extends Node2D

var player
var cur_type_ct = "nucleo"
var cur_type_mg = "imunity"
var dir : Vector2
var cur_velocity_element_ct = 0
var cur_velocity_element_mg = 0

#enum player_type {CIENTISTA, MAGO}

var cientist = "ct"
var cientist_nucleo = "nucleo"
var cientist_gama = "gama"
var cientist_lazer = "lazer"
var dir_ct = Vector2(0,1)
var mage = "mg"
var mage_imunity = "imunity"
var mage_mana = "mana"
var mage_item = "item"
var dir_mg = Vector2(0,-1)

onready var pre_element = preload("res://elementos.tscn")

onready var element = $Node2D

onready var arrow_ct = $Node2D/Control/Cientist/arrow_ct
onready var arrow_mg = $Node2D/Control/Mage/arrow_mg

func _ready():
	$Node2D/Control/Cientist/HSlider.min_value = 1
	$Node2D/Control/Cientist/HSlider.max_value = 500
	$Node2D/Control/Cientist/HSlider.step = 10
	$Node2D/Control/Mage/HSlider.min_value = 1
	$Node2D/Control/Mage/HSlider.max_value = 500
	$Node2D/Control/Mage/HSlider.step = 10
	pass


func identify(player, cur_type):
	var pos
	var velocity
	if player == "ct":
		dir.y = 1
		pos = $Pos_CT_Action.position
		velocity = cur_velocity_element_ct
	if player == "mg":
		dir.y = -1
		pos = $Pos_MG_Action.position
		velocity = cur_velocity_element_mg
	
	action(player, cur_type, dir, pos, velocity)
	
	pass


func action(who:String, type:String, dir:Vector2, pos:Vector2, velocity:int):
#	yield(get_tree().create_timer(2, true), "timeout")

	var element = pre_element.instance()
	element.position = pos
	$Elements.add_child(element)
	element.init(who, type, dir, velocity)
#	action()


func _on_cientist_btn_atack_pressed():
	identify("ct", cur_type_ct)
	pass
func _on_cientist_btn_dodge_pressed():
	$Cientist/AnimationPlayer.play("dodge")
	$Cientist/CollisionShape2D.disabled = true
	yield(get_tree().create_timer(0.5), "timeout")
	$Cientist/CollisionShape2D.disabled = false
	pass # Replace with function body.

func _on_mage_btn_atack_pressed():
	identify("mg", cur_type_mg)
func _on_mage_btn_dodge_pressed():
	$Mage/AnimationPlayer.play("dodge")
	$Mage/CollisionShape2D.disabled = true
	yield(get_tree().create_timer(0.5), "timeout")
	$Mage/CollisionShape2D.disabled = false

func _on_cientist_btn_nucleo_pressed():
	cur_type_ct = cientist_nucleo
	arrow_ct.position = $Node2D/Control/Cientist/Pos_Nucleo.position
func _on_cientist_btn_gama_pressed():
	cur_type_ct = cientist_gama
	arrow_ct.position = $Node2D/Control/Cientist/Pos_Gama.position
	pass # Replace with function body.
func _on_cientist_btn_lazer_pressed():
	cur_type_ct = cientist_lazer
	arrow_ct.position = $Node2D/Control/Cientist/Pos_Lazer.position
	pass # Replace with function body.

func _on_mage_btn_imunity_pressed():
	cur_type_mg = mage_imunity
	arrow_mg.position = $Node2D/Control/Mage/Pos_imunity.position
	pass # Replace with function body.
func _on_mage_btn_mana_pressed():
	cur_type_mg = mage_mana
	arrow_mg.position = $Node2D/Control/Mage/Pos_Mana.position
	pass # Replace with function body.
func _on_mage_btn_item_pressed():
	cur_type_mg = mage_item
	arrow_mg.position = $Node2D/Control/Mage/Pos_Item.position
	pass # Replace with function body.

func _on_cientist_HSlider_value_changed(value):
	$Node2D/Control/Cientist/HSlider/value.text = str(int(value))
	cur_velocity_element_ct = int(value)
func _on_mage_HSlider_value_changed(value):
	$Node2D/Control/Mage/HSlider/value.text = str(int(value))
	cur_velocity_element_mg = int(value)


func hit(who):
	if who == "cientist":
		$Cientist/hit.visible = true
		yield(get_tree().create_timer(.3), "timeout")
		$Cientist/hit.visible = false

	if who == "mage":
		$Mage/hit.visible = true
		yield(get_tree().create_timer(.3), "timeout")
		$Mage/hit.visible = false




