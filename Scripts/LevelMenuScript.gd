extends Button

func _on_MENU_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("esc"):
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
