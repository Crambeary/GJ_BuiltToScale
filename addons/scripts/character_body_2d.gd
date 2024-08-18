extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2(0,0);

	move_and_slide()
