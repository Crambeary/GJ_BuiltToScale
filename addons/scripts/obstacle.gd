extends StaticBody2D

@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var light_occluder_2d: LightOccluder2D = $LightOccluder2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_polygon_2d.polygon = polygon_2d.polygon
	var new_occluder := OccluderPolygon2D.new()
	new_occluder.polygon = polygon_2d.polygon #PoolVector2Array
	light_occluder_2d.occluder = new_occluder
	#light_occluder_2d.occluder.polygon = polygon_2d.polygon
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
