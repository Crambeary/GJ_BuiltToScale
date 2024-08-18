extends Node2D

@onready var goal_block: StaticBody2D = $GoalBlock
@onready var pickups: Node2D = $Pickups
@onready var player: CharacterBody2D = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pickup_nodes = pickups.get_children()
	for node in pickup_nodes:
		node.connect("pickup", _on_pickup_pickup)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_goal_size():
	if (goal_block.scale >= Vector2(3.4, 3.4)):
		get_tree().reload_current_scene()

func _on_pickup_pickup() -> void:
	goal_block.scale = goal_block.scale + Vector2(0.5, 0.5)
	check_goal_size()
	player.pickup_material()
