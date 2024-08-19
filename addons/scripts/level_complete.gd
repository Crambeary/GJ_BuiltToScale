extends CanvasLayer

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
