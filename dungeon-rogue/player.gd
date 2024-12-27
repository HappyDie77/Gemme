extends CharacterBody2D

var SPEED = 100.0

func _physics_process(delta: float) -> void:
	# Cleaner movement using Input.get_vector()
	velocity = Input.get_vector("a", "d", "w", "s") * SPEED
	
	move_and_slide()  # Move the player
