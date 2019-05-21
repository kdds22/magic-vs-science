extends Node


onready var cur_comb_mg : String = ""

# Mage = 0 | Cientist = 1
onready var cur_player : int

onready var life = 20

onready var cur_tex_element : String


onready var cur_tex_element_mg : Array = [
					preload("res://scenes/Elements_Mana.tscn"),
					preload("res://scenes/Elements_Grim.tscn"),
					preload("res://scenes/Elements_Item.tscn")]

# template = 112 - 113 - 221 - 223 - 331 - 332
onready var mg_comb_name : Array = [
	"Magic Missiles", 
	"Magic Grenade", 
	"Fire Ball", 
	"Voodoo", 
	"Magic Slingshot", 
	"Guided Cobra"]

onready var mg_comb_path : Array = [
	preload("res://scenes/mg_comb/Elements_MM.tscn"),
	preload("res://scenes/mg_comb/Elements_GM.tscn"),
	preload("res://scenes/mg_comb/Elements_FireB.tscn"),
	preload("res://scenes/mg_comb/Elements_VD.tscn"),
	preload("res://scenes/mg_comb/Elements_MS.tscn"),
	preload("res://scenes/mg_comb/Elements_GS.tscn")
	]





func cur_tex_element(value):
	if cur_player == 0:
		return cur_tex_element_mg[value]


func reset_life():
	life = 20
	pass







