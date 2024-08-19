extends Node2D

@onready var goal_block: StaticBody2D = $GoalBlock
@onready var pickups: Node2D = $Pickups
@onready var player: CharacterBody2D = $Player
@onready var timer: Timer = $Timer
@onready var obstacle: StaticBody2D = $Obstacle
@onready var drop_zones: Node2D = $"drop zones"
@onready var transfer_sfx: AudioStreamPlayer = $TransferSFX
@onready var level_complete_overlay: CanvasLayer = $LevelComplete


var drop_area := ""
var collected_matter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pickup_nodes = pickups.get_children()
	for node in pickup_nodes:
		node.connect("pickup", _on_pickup_pickup)
	for zone in drop_zones.get_children():
		zone.connect("player_in_drop_zone", _on_drop_zone_player_in_drop_zone)
		zone.connect("player_left_drop_zone", _on_drop_zone_player_left_drop_zone)
		
	
func _input(event: InputEvent):
	if(event.is_action_pressed("pause")):
		get_viewport().set_input_as_handled()
		if get_tree().paused == false:
			get_tree().paused = true
			$Pause.visible = true

func check_goal_size():
	if (goal_block.scale >= Vector2(2.5, 2.5)):
		level_complete()
		#get_tree().reload_current_scene()
		
func check_collection_count():
	return collected_matter
	
func check_goal_collection():
	if (check_collection_count() >= 3):
		level_complete()

func level_complete():
	level_complete_overlay.visible = true
	get_tree().paused = true

func _on_pickup_pickup() -> void:
	player.pickup_material()

func _on_drop_zone_player_in_drop_zone(area) -> void:
	drop_area = "up" if area.is_in_group("up") else "down"
	var player_materials_count = player.get_material_count()
	if player_materials_count >= 1:
		player.start_transfer_ui()
		transfer_sfx.play()
		timer.start()
		

func submit_material():
	player.submit_material()
	collected_matter += 1
	goal_block.scale = goal_block.scale + Vector2(0.5, 0.5)
	if drop_area == "up":
		obstacle.scale += Vector2(0.1, 0.1)
	elif drop_area == "down":
		obstacle.scale -= Vector2(0.1, 0.1)
	#check_goal_size()
	check_goal_collection()
	var player_materials_count = player.get_material_count()
	if player_materials_count == 0:
		timer.stop()
	
func stop_submitting_material():
	player.stop_transfer_ui()
	timer.stop()



func _on_drop_zone_player_left_drop_zone(area) -> void:
	drop_area = ""
	transfer_sfx.stop()
	stop_submitting_material()



func _on_timer_timeout() -> void:
	submit_material()
