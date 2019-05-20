extends Node
class_name Elements

var ct_index : int
onready var cientists_elements : Array = ["Nucleus", "Energy", "UV"]
onready var cientist_combinations : Dictionary = {
	# 112
	"Black Hole" : {
		"Dano" : 3,
		"Vel" : 1,
		"chance" : 66
	},
	
	# 221
	"Star" : {
		"Dano" : 2,
		"Vel" : 1,
		"chance" : 99
	},
	
	# 223
	"Radiation" : {
		"Dano" : 1,
		"Vel" : 2,
		"chance" : 99
	},
	
	# 332
	"Pistol Lazer" : {
		"Dano" : 1,
		"Vel" : 3,
		"chance" : 66
	},
	
	# 331
	"Bazooka" : {
		"Dano" : 2,
		"Vel" : 3,
		"chance" : 33
	},
	
	# 113
	"Plasma" : {
		"Dano" : 3,
		"Vel" : 2,
		"chance" : 33
	},
}

var mg_index : int
onready var mage_elements : Array = ["Mana", "Knowledge", "Item"]
onready var mage_combinations : Dictionary = {
	# 112
	"Magic Missiles" : {
		"Dano" : 3,
		"Vel" : 1,
		"chance" : 66
	},
	
	# 221
	"Fire Ball" : {
		"Dano" : 2,
		"Vel" : 1,
		"chance" : 99
	},
	
	# 223
	"Voodoo" : {
		"Dano" : 1,
		"Vel" : 2,
		"chance" : 99
	},
	
	# 332
	"Guided Cobra" : {
		"Dano" : 1,
		"Vel" : 3,
		"chance" : 66
	},
	
	# 331
	"Magic Slingshot" : {
		"Dano" : 2,
		"Vel" : 3,
		"chance" : 33
	},
	
	# 113
	"Magic Grenade" : {
		"Dano" : 3,
		"Vel" : 2,
		"chance" : 33
	}
}


var flag_input : bool
var key : String = ""
var ele : String = ""


func identify_elements(value):
	key = ""
	if Global_Player_Mage.cur_player == 0:
		match value:
			"Q": key = value
			"W": key = value
			"E": key = value
			"R": key = value
			"Space": key = value
		
	if Global_Player_Cientist.cur_player == 1:
#		print(value)
		match value:
			"I": key = value
			"O": key = value
			"P": key = value
			"BackSpace": key = value
			"Enter": key = value
	
	return [key, elements(key)]

func elements(value):
	ele = ""
	if Global_Player_Mage.cur_player == 0:
		match value:
			"Q" : 
				mg_index = 0
				ele = mage_elements[mg_index]
			"W" : 
				mg_index = 1
				ele = mage_elements[mg_index]
			"E" : 
				mg_index = 2
				ele = mage_elements[mg_index]
			"R" : 
				ele = "Atack_Mage"
			"Space" : 
				ele = "Dodge_Mage"
		
	if Global_Player_Cientist.cur_player == 1:
		match value:
			"I" : 
				ct_index = 0
				ele = cientists_elements[ct_index]
			"O" : 
				ct_index = 1
				ele = cientists_elements[ct_index]
			"P" : 
				ct_index = 2
				ele = cientists_elements[ct_index]
			"BackSpace" : 
				ele = "Atack_Cientist"
			"Enter" : 
				ele = "Dodge_Cientist"
	
	return ele



#func _input(event):
##	print(event.as_text())
#	if event.as_text() == "Q":
#		print("Nucleo")

