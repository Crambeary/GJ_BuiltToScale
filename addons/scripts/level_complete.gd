extends CanvasLayer

signal next_level


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func go_to_main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://addons/scenes/main_menu.tscn")

func _on_next_level_button_down() -> void:
	get_tree().paused = false
	next_level.emit()
	#go_to_main_menu()
