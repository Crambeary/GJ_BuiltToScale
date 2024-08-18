extends Polygon2D

@onready var collision_polygon_2d: CollisionPolygon2D = $StaticBody2D/CollisionPolygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var paths = polygons;
	
	for path in paths:
		collision_polygon_2d.polygon.append(path)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
