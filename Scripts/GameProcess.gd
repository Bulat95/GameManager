extends Label

func _ready():
	var file = FileAccess.open("res://Games/test.json", FileAccess.READ)
	var test_json_conv = JSON.parse_string(file.get_as_text())
	file.close()
	if test_json_conv != null:
		if test_json_conv["name"] == null:
			text = "ПРОЕКТ НЕ ВЫБРАН!"
		else:
			text = test_json_conv["name"]
	else:
		print("Error parsing JSON")

