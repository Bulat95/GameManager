extends Node2D

var games = []

@onready var product = get_node("Panel/select_product")
@onready var action = get_node("Panel/select_genre")
@onready var nameProduct = get_node("Panel/LineEdit")

func _on_Start_build_game_pressed():
	GlobalConst.dropdown_select_product = product.text
	GlobalConst.dropdown_select_action = action.text
	GlobalConst.line_edit_name_product = nameProduct.text
	save_products_to_json()
	get_tree().change_scene_to_file("res://Scenes/Level_1.tscn")

func _ready():
	initTableProducts()

func _on_genre_selected():
	action.clear()
	product.set("Game", 1)
	if product.text == "Game":
		action.add_item("Action", 1)
		action.add_item("RPG")
		action.add_item("Strategy")
		action.add_item("Racing")
		action.add_item("Adventure")
		action.add_item("Shooter")
		action.add_item("Sports")
		action.add_item("Platformer")
	if product.text == "Engine":
		action.add_item("Product 1")
		action.add_item("Product 2")
	action.select(0)

func initTableProducts():
	product.add_item("Game")
	product.add_separator()
	product.add_item("Engine")
	product.add_separator()
	product.add_item("Soft")
	product.connect("item_selected", Callable(self, "_on_genre_selected"))

func _on_select_product_item_selected(index):
	_on_genre_selected()

func save_products_to_json() -> void:
	var file = FileAccess.open("res://Games/test.json", FileAccess.WRITE)
	var json_str = JSON.stringify(to_dict())
	file.store_string(json_str)
	file.close()
	to_dict()

func to_dict() -> Dictionary:
	var dict = {}
	dict["type"] = product.text
	dict["action"] = action.text
	dict["name"] = nameProduct.text
	return dict
