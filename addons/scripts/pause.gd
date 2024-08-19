extends CanvasLayer
@onready var click_sfx: AudioStreamPlayer = $ClickSFX
@onready var hover_sfx: AudioStreamPlayer = $HoverSFX



func unpause() -> void:
	get_tree().paused = false
	hide()

func _input(event: InputEvent):
	if(event.is_action_pressed("pause")):
		get_viewport().set_input_as_handled()
		if get_tree().paused:
			unpause()

func _play_click_sfx():
	click_sfx.play()

func _play_hover_sfx():
	hover_sfx.play()

func _on_unpause_button_down() -> void:
	_play_click_sfx()
	unpause()


func _on_exit_pressed() -> void:
	_play_click_sfx()
	unpause()
	get_tree().change_scene_to_file("res://addons/scenes/main_menu.tscn")


func _on_restart_pressed() -> void:
	_play_click_sfx()
	unpause()
	get_tree().reload_current_scene()


func _on_unpause_mouse_entered() -> void:
	_play_hover_sfx()


func _on_restart_mouse_entered() -> void:
	_play_hover_sfx()


func _on_exit_mouse_entered() -> void:
	_play_hover_sfx()
