extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Alert.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Caution_Area_area_entered(area):
	$Alert.visible = true
	yield(get_tree().create_timer(.8), "timeout")
	$Alert.visible = false
	pass # Replace with function body.
