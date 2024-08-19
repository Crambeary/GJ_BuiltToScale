extends Area2D
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var sprite_2d: Sprite2D = $Exit
@onready var cross: Sprite2D = $Cross
@onready var extraction_timer: Timer = $ExtractionTimer
@onready var material_count_label: Label = $MaterialCountLabel

signal extraction_timer_end


var collected_material = 0
@export var minimum_goal_material = 3


func remove_cross():
	cross.visible = false 
	
func show_cross():
	cross.visible = true
	
func set_collected_material(value):
	collected_material = value
	_update_score_label()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_polygon_2d.polygon = polygon_2d.polygon
	_update_score_label()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and cross.visible == false:
		polygon_2d.set_color(Color.html("007d92"))
		sprite_2d.visible = false
		extraction_timer.start()
		material_count_label.visible = false


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player") and cross.visible == false:
		polygon_2d.set_color(Color.html("a8eeff"))
		sprite_2d.visible = true
		extraction_timer.stop()
		material_count_label.visible = true


func _on_extraction_timer_timeout() -> void:
	extraction_timer_end.emit()
	
func _update_score_label():
	var format_string = "%s/%s"
	var actual_string = format_string % [str(collected_material), str(minimum_goal_material)]
	material_count_label.text = actual_string
