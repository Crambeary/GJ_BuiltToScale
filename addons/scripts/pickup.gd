extends Area2D
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var pickup_sfx: AudioStreamPlayer = $PickupSFX

signal pickup

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_polygon_2d.polygon = polygon_2d.polygon
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		
		if (body.get_material_count() < 
			body.get_pickup_limit() &&
			visible == true):
			pickup.emit()
			visible = false
			pickup_sfx.play()
			
	


func _on_pickup_sfx_finished() -> void:
	queue_free()
