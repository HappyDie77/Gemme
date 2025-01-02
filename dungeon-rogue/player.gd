extends CharacterBody2D

var SPEED = 100.0

func _physics_process(delta: float) -> void:
	
	velocity = Input.get_vector("a", "d", "w", "s") * SPEED
	
	
	if Input.is_action_pressed("a"):
		$AnimatedSprite2D.play("left")
	elif Input.is_action_pressed("d"):
		$AnimatedSprite2D.play("right")
	elif Input.is_action_pressed("w"):
		$AnimatedSprite2D.play("up")
	else:
		$AnimatedSprite2D.play("default")
	
	move_and_slide()  # Move the player
