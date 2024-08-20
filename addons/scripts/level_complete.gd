extends CanvasLayer
@onready var star_1: TextureRect = $Control/VBoxContainer/HBoxContainer/Star1
@onready var star_2: TextureRect = $Control/VBoxContainer/HBoxContainer/Star2
@onready var star_3: TextureRect = $Control/VBoxContainer/HBoxContainer/Star3
@onready var star_empty_1: TextureRect = $Control/VBoxContainer/HBoxContainer/StarEmpty1
@onready var star_empty_2: TextureRect = $Control/VBoxContainer/HBoxContainer/StarEmpty2
@onready var star_empty_3: TextureRect = $Control/VBoxContainer/HBoxContainer/StarEmpty3
@onready var click_sfx: AudioStreamPlayer = $Control/ClickSFX
@onready var hover_sfx: AudioStreamPlayer = $Control/HoverSFX
@onready var complete_sfx: AudioStreamPlayer = $CompleteSFX

signal next_level

func play_complete_zinger():
	complete_sfx.play()

func go_to_main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://addons/scenes/main_menu.tscn")

func _on_next_level_button_down() -> void:
	get_tree().paused = false
	click_sfx.play()
	next_level.emit()


func _on_restart_level_pressed() -> void:
	get_tree().paused = false
	click_sfx.play()
	get_tree().reload_current_scene()


func _on_exit_game_pressed() -> void:
	click_sfx.play()
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


func _on_click_sfx_finished() -> void:
	pass # Replace with function body.


func _on_next_level_mouse_entered() -> void:
	hover_sfx.play()
	


func _on_restart_level_mouse_entered() -> void:
	hover_sfx.play()
	


func _on_exit_game_mouse_entered() -> void:
	hover_sfx.play()
	
