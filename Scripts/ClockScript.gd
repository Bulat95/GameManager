extends Label

var years = 0
var months = 0
var days = 0
var hours = 0
var paused = false
var timer

var file

func _ready():
	# Создаем узел Timer для отсчета времени
	timer = Timer.new()
	timer.wait_time = 1.0  # Устанавливаем время ожидания таймера в 1 секунду (или любое другое значение)
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)
	timer.start()

	# Считываем дату из файла при запуске игры
	load_date_from_file()

func _process(delta):
	# Обновление времени и отображения на экране
	if !paused:
		hours += delta
		if hours >= 24:
			hours -= 24
			days += 1
			if days >= 30:
				days -= 30
				months += 1
				if months >= 12:
					months -= 12
					years += 1
		update_time_label()

func _on_timer_timeout():
	# Обновление времени каждый раз, когда срабатывает таймер (проходит 1 секунда)
	if !paused:
		hours += 1
		if hours >= 24:
			hours -= 24
			days += 1
			if days >= 30:
				days -= 30
				months += 1
				if months >= 12:
					months -= 12
					years += 1
		update_time_label()

func update_time_label():
	# Функция для обновления отображения времени на экране
	var hoursString = str(int(hours)).pad_zeros(2)
	var time_string = str(years).pad_zeros(4) + ":" + str(months).pad_zeros(2) + ":" + str(days).pad_zeros(2) + ":" + hoursString
	set_text(time_string)

	# Сохраняем дату в файл
	save_date_to_file()

func toggle_pause():
	# Функция для переключения паузы
	paused = !paused

	if paused:
		timer.stop()
	else:
		timer.start()
	# Считываем или сохраняем дату в файл, в зависимости от состояния паузы
	if !paused:
		load_date_from_file()
	else:
		save_date_to_file()

func save_date_to_file():
	# Сохраняем дату в файл
	file = FileAccess.open("user://game_date.txt", FileAccess.WRITE)
	file.store_string(str(years) + ":" + str(months) + ":" + str(days) + ":" + str(hours))
	file.close()

func load_date_from_file():
	if FileAccess.file_exists("user://game_date.txt"):
		var file = FileAccess.open("user://game_date.txt", FileAccess.READ)
		var contents = file.get_as_text()
		var date_parts = contents.split(":")
		years = int(date_parts[0])
		months = int(date_parts[1])
		days = int(date_parts[2])
		hours = int(date_parts[3])
		file.close()
	else:
		var file = FileAccess.open("user://game_date.txt", FileAccess.WRITE)
		# Если файл не существует, создаем его с начальным временем
		years = 1980
		months = 1
		days = 1
		hours = 0
		file.open("user://game_date.txt", FileAccess.WRITE)
		file.store_string(str(years) + ":" + str(months) + ":" + str(days) + ":" + str(hours))
		file.close()

func _on_Board_pressed():
	get_tree().change_scene_to_file("res://Scenes/Board.tscn")
	toggle_pause()
