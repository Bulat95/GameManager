extends Node

func _on_save_button_pressed():
	var newProduct = Product.new($Panel/Title.text, $Panel/GraphicalComplexity.value, $Panel/CodingComplexity.value)
	GlobalConst.products.append(newProduct)
	$Panel.visible = false
