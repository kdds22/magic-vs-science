extends Node


onready var cur_comb_ct : String = ""

# Mage = 0 | Cientist = 1
onready var cur_player : int

onready var life = 20

onready var cur_tex_element : String



onready var cur_tex_element_ct : Array = [
					preload("res://scenes/Elements_Nucleo.tscn"),
					preload("res://scenes/Elements_Energy.tscn"),
					preload("res://scenes/Elements_UV.tscn")]

# template = 112 - 113 - 221 - 223 - 331 - 332


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

	if cur_player == 1:
		return cur_tex_element_ct[value]

func reset_life():
	life = 20
	pass






