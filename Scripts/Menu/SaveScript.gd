extends Button


signal on_saved

func _on_Save_pressed():
	get_tree().change_scene_to_file("res://Scenes/Save.tscn")


