extends CanvasLayer
@onready var audio_stream_player: AudioStreamPlayer = $Control/VBoxContainer/Button/ClickSFX
@onready var hover_sfx: AudioStreamPlayer = $Control/VBoxContainer/Button/HoverSFX




func _on_button_button_down() -> void:
	audio_stream_player.play()
	


func _on_audio_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://addons/scenes/Level.tscn")


func _on_button_mouse_entered() -> void:
	hover_sfx.play()
