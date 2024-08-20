extends CanvasLayer
@onready var star_1: TextureRect = $Control/VBoxContainer/HBoxContainer/Star1
@onready var star_2: TextureRect = $Control/VBoxContainer/HBoxContainer/Star2
@onready var star_3: TextureRect = $Control/VBoxContainer/HBoxContainer/Star3
@onready var star_empty_1: TextureRect = $Control/VBoxContainer/HBoxContainer/StarEmpty1
@onready var star_empty_2: TextureRect = $Control/VBoxContainer/HBoxContainer/StarEmpty2
@onready var star_empty_3: TextureRect = $Control/VBoxContainer/HBoxContainer/StarEmpty3

signal next_level

func go_to_main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://addons/scenes/main_menu.tscn")

func _on_next_level_button_down() -> void:
	get_tree().paused = false
	next_level.emit()


func _on_restart_level_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_exit_game_pressed() -> void:
	go_to_main_menu()
	
func calculate_score(min_stars, max_stars, collected_stars) -> int:
	# collected == min = 1 star
	# collected == max = 3 stars
	# collected == floor(midpoint) = 2 stars
	if collected_stars == max_stars:
		return 3
	elif collected_stars >= floor((min_stars + max_stars) / 2):
		return 2
	else: 
		return 1

func show_stars(count: int):
	match count:
		0: 
			star_1.visible = false
			star_2.visible = false
			star_3.visible = false
			star_empty_1.visible = true
			star_empty_2.visible = true
			star_empty_3.visible = true
		1:
			star_1.visible = true
			star_2.visible = false
			star_3.visible = false
			star_empty_1.visible = false
			star_empty_2.visible = true
			star_empty_3.visible = true
		2:	
			star_1.visible = true
			star_2.visible = true
			star_3.visible = false
			star_empty_1.visible = false
			star_empty_2.visible = false
			star_empty_3.visible = true
		3:
			star_1.visible = true
			star_2.visible = true
			star_3.visible = true
			star_empty_1.visible = false
			star_empty_2.visible = false
			star_empty_3.visible = false
