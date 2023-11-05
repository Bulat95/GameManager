extends Node

var dropdown_select_product
var dropdown_select_action
var line_edit_name_product

var nameProject
var action
var type

var coefficientForTimer = 0.1

var games = {}
var softs = {}
var engines = {}

func _ready():
	load_products_from_json()

func load_products_from_json() -> void:
	var file = FileAccess.open("res://Games/test.json", FileAccess.READ)
	var test_json_conv = JSON.parse_string(file.get_as_text())
	file.close()
	if test_json_conv != null:
		nameProject = test_json_conv["name"]
		type = test_json_conv["type"]
		action = test_json_conv["action"]
		nameProject = test_json_conv["name"]
	else:
		print("Error parsing JSON")

func save_products_to_json() -> void:
	var file = FileAccess.open("res://Games/test.json", FileAccess.WRITE)
	var json_str = JSON.stringify(to_dict())
	file.store_string(json_str)
	file.close()
	to_dict()

func to_dict() -> Dictionary:
	var dict = {}
	dict["type"] = type
	dict["action"] = action
	dict["name"] = nameProject
	return dict

func console():
	print(nameProject)

func add_to_games(name: String, dictionary: Dictionary) -> void:
	games[name] = dictionary

func add_to_softs(name: String, dictionary: Dictionary) -> void:
	softs[name] = dictionary

func add_to_engine(name: String, dictionary: Dictionary) -> void:
	engines[name] = dictionary

func remove_from_games(name: String) -> void:
	if games.has(name):
		games.erase(name)

func remove_from_softs(name: String) -> void:
	if softs.has(name):
		softs.erase(name)

func remove_from_engine(name: String) -> void:
	if engines.has(name):
		engines.erase(name)












