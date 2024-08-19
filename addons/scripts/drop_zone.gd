@tool
extends Area2D
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var up_arrow: Sprite2D = $UPArrow
@onready var down_arrow: Sprite2D = $DOWNArrow

signal player_in_drop_zone
signal player_left_drop_zone

func _ready() -> void:
	collision_polygon_2d.polygon = polygon_2d.polygon
	if is_in_group("up"):
		up_arrow.visible = true
		down_arrow.visible = false
	elif is_in_group("down"):
		up_arrow.visible = false
		down_arrow.visible = true
		


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_drop_zone.emit(self)
		#polygon_2d.modulate.v = 100
		polygon_2d.set_color(Color.html("c2c25f"))
		
		
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_left_drop_zone.emit(self)
		#polygon_2d.modulate.v = 50
		polygon_2d.set_color(Color.html("80803e"))
