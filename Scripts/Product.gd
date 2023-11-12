extends Node

class_name Product

var title: String
var graphicalComplexity: int
var codingComplexity: int
var startHoursPassed: float
var durationInHours: float

func _init(_title: String, _graphicalComplexity: int, _codingComplexity: int, _startHoursPassed: float):
	title = _title;
	graphicalComplexity = _graphicalComplexity;
	codingComplexity = _codingComplexity;
	startHoursPassed = _startHoursPassed;
	durationInHours = 20;
	
func getProgress():
	if isCompleted():
		return 1;
	return (GlobalConst.hoursPassed - startHoursPassed) / durationInHours;

func isCompleted():
	return GlobalConst.hoursPassed >= startHoursPassed + durationInHours;
