extends Node2D

@onready var goal_block: StaticBody2D = $GoalBlock
@onready var pickups: Node2D = $Pickups
@onready var player: CharacterBody2D = $Player
@onready var timer: Timer = $Timer
@onready var obstacle: StaticBody2D = $Obstacle
@onready var drop_zones: Node2D = $"drop zones"


var drop_area := "";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pickup_nodes = pickups.get_children()
	for node in pickup_nodes:
		node.connect("pickup", _on_pickup_pickup)
	for zone in drop_zones.get_children():
		zone.connect("player_in_drop_zone", _on_drop_zone_player_in_drop_zone)
		zone.connect("player_left_drop_zone", _on_drop_zone_player_left_drop_zone)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_goal_size():
	if (goal_block.scale >= Vector2(3.4, 3.4)):
		get_tree().reload_current_scene()

func _on_pickup_pickup() -> void:
	player.pickup_material()

func _on_drop_zone_player_in_drop_zone(area) -> void:
	drop_area = "up" if area.is_in_group("up") else "down"
	var player_materials_count = player.get_material_count()
	if player_materials_count >= 1:
		timer.start()
		

func submit_material():
	player.submit_material()
	goal_block.scale = goal_block.scale + Vector2(0.5, 0.5)
	if drop_area == "up":
		obstacle.scale += Vector2(0.1, 0.1)
	elif drop_area == "down":
		obstacle.scale -= Vector2(0.1, 0.1)
	check_goal_size()
	var player_materials_count = player.get_material_count()
	if player_materials_count == 0:
		timer.stop()
	
func stop_submitting_material():
	timer.stop()



func _on_drop_zone_player_left_drop_zone(area) -> void:
	drop_area = ""
	stop_submitting_material()



func _on_timer_timeout() -> void:
	submit_material()
