extends Button

func _on_BackFromSaveButton_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
