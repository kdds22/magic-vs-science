extends Node


onready var cur_comb_mg : String = ""
onready var cur_comb_ct : String = ""

# Mage = 0 | Cientist = 1
onready var cur_player : int

onready var cur_tex_element : String


onready var cur_tex_element_mg : Array = [
					preload("res://scenes/Elements_Mana.tscn"),
					preload("res://scenes/Elements_Grim.tscn"),
					preload("res://scenes/Elements_Item.tscn")]
onready var cur_tex_element_ct : Array = [
					preload("res://scenes/Elements_Nucleo.tscn"),
					preload("res://scenes/Elements_Energy.tscn"),
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


onready var ct_comb_name : Array = [
	"Black Hole",
	"Plasma",
	"Star",
	"Radiation",
	"Bazooka",
	"Pistol Lazer"]

# template = 112 - 113 - 221 - 223 - 331 - 332
onready var ct_comb_path : Array = [
	preload("res://scenes/ct_comb/Elements_BH.tscn"),
	preload("res://scenes/ct_comb/Elements_PL.tscn"),
	preload("res://scenes/ct_comb/Elements_ST.tscn"),
	preload("res://scenes/ct_comb/Elements_RD.tscn"),
	preload("res://scenes/ct_comb/Elements_LB.tscn"),
	preload("res://scenes/ct_comb/Elements_LP.tscn")
	]




func cur_tex_element(value):
	if cur_player == 0:
		return cur_tex_element_mg[value]

	if cur_player == 1:
		return cur_tex_element_ct[value]








