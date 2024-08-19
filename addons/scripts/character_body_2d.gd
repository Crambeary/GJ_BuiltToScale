extends CharacterBody2D
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var pickup_markers: Node2D = $PickupMarkers
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const SPEED := 300.

var markers_held := 0
var pickup_limit := 3
var marker_nodes: Array

func get_pickup_limit() -> int:
	return pickup_limit
	
func set_pickup_limit(value: int):
	pickup_limit = value

func pickup_material():
	markers_held += 1
	
func get_material_count():
	return markers_held
	
func submit_material():
	if markers_held >= 1:
		markers_held -= 1

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
			marker_nodes[1].visible = false
			marker_nodes[2].visible = false
		2:
			marker_nodes[1].visible = true
			marker_nodes[2].visible = false
		3:
			marker_nodes[2].visible = true
		_:
			pass

func start_transfer_ui():
	animation_player.play(&"Transfer")
	
func stop_transfer_ui():
	animation_player.stop()
