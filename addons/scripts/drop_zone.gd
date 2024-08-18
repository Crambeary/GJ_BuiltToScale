extends Area2D
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D

signal player_in_drop_zone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_polygon_2d.polygon = polygon_2d.polygon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_drop_zone.emit()
