extends Button

func _on_PLAY_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level_1.tscn")


const Globald = preload("res://Global/GlobalConst.gd")

func _ready():
	#Globald.get_global_data()
	pass

