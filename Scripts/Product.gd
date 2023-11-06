extends Node

class_name Product

var title: String
var graphicalComplexity: int
var codingComplexity: int

func _init(_title: String, _graphicalComplexity: int, _codingComplexity: int):
	title = _title;
	graphicalComplexity = _graphicalComplexity;
	codingComplexity = _codingComplexity;
