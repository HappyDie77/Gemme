extends Node2D


@onready var bullet = preload("res://bullet.tscn")
@onready var bow = $bow
var shooting = false


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("->"):
		position.y=-0
		position.x=100
		rotation = deg_to_rad(90)
		if not shooting:
			
			shooting=true
			
			shoot_bullet(Vector2(1, 0))  # Shoot right
			$Timer.start()
			await $Timer.timeout
			shooting=false
			
		


	if Input.is_action_pressed("<-"):
		position.y=-0
		position.x=-100
		rotation = deg_to_rad(270)
		if not shooting:
			shooting=true
			
			shoot_bullet(Vector2(-1, 0))  # Shoot left
			$Timer.start()
			await $Timer.timeout
			shooting=false

	if Input.is_action_pressed("down"):
		position.x=-0
		position.y=100
		rotation = deg_to_rad(180)
		if not shooting:
			shooting=true
			
			shoot_bullet(Vector2(0, 1))  # Shoot down
			$Timer.start()
			await $Timer.timeout
			shooting=false

	if Input.is_action_pressed("up"):
		position.x=-0
		position.y=-100
		rotation = deg_to_rad(360)
		if not shooting:
			shooting=true
			
			shoot_bullet(Vector2(0, -1))  # Shoot up
			$Timer.start()
			await $Timer.timeout
			shooting=false

		

func shoot_bullet(direction: Vector2) -> void:
	var bullet_temp = bullet.instantiate()
	get_parent().add_child(bullet_temp)  # Add the bullet to the parent's scene, not as a child of the player
	bullet_temp.position = position  # Use global position to ensure it's aligned with world space
	if bullet_temp.has_method("set_direction"):
		bullet_temp.set_direction(direction)  # Call a custom method in bullet if it exists
	elif bullet_temp.has_variable("direction"):
		bullet_temp.direction = direction  # Or directly set the variable if it exists
	if Input.is_action_pressed("->"):
		bullet_temp.rotation = deg_to_rad(90)
		bullet_temp.direction = direction  # Or directly set the variable if it exists
	if Input.is_action_pressed("down"):
		bullet_temp.rotation = deg_to_rad(180)
	if Input.is_action_pressed("<-"):
		bullet_temp.rotation = deg_to_rad(270)
