extends Node


onready var cur_comb : String = ""

# Mage = 0 | Cientist = 1
onready var cur_player : int

onready var cur_tex_element : String

onready var cur_tex_element_ct : Array =  ["res://test_assets/nucleo.png",
					"res://test_assets/gama.png",
					"res://test_assets/lazer.png"]
onready var cur_tex_element_mg : Array = ["res://test_assets/imunity.png",
					"res://test_assets/mana.png",
					"res://test_assets/item.png"]


func cur_tex_element(value):
	if cur_player == 0:
		return cur_tex_element_mg[value]

	if cur_player == 1:
		return cur_tex_element_ct[value]
		
	return