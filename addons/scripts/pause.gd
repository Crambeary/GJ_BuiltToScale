extends CanvasLayer

func unpause() -> void:
	get_tree().paused = false
	hide()

func _input(event: InputEvent):
	if(event.is_action_pressed("pause")):
		get_viewport().set_input_as_handled()
		if get_tree().paused:
			unpause()


func _on_unpause_button_down() -> void:
	unpause()


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://addons/scenes/main_menu.tscn")


func _on_restart_pressed() -> void:
	unpause()
	get_tree().reload_current_scene()
