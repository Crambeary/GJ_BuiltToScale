extends CharacterBody2D
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var pickup_markers: Node2D = $PickupMarkers


const SPEED := 300.0
var markers_held := 0

var marker_nodes: Array

func pickup_material():
	markers_held += 1

func _ready() -> void:
	collision_polygon_2d.polygon = polygon_2d.polygon
	marker_nodes = pickup_markers.get_children()


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(0,0);
		

	move_and_slide()
	
	
func _process(delta: float) -> void:
	match markers_held:
		0:
			for node in marker_nodes:
				node.visible = false
		1: 
			marker_nodes[0].visible = true
		2:
			marker_nodes[1].visible = true
		3:
			marker_nodes[2].visible = true
		_:
			pass
