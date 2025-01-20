extends CharacterBody2D

var SPEED = 100.0

	
	
	if Input.is_action_pressed("<-"):
		$AnimatedSprite2D.play("left")
	elif Input.is_action_pressed("->"):
		$AnimatedSprite2D.play("right")
	elif Input.is_action_pressed("up"):
		$AnimatedSprite2D.play("up")
	elif Input.is_action_pressed("down"):
		$AnimatedSprite2D.play("default")
	
	move_and_slide()  # Move the player

