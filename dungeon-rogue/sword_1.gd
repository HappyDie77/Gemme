extends Area2D



@onready var bullet = preload("res://bullet.tscn")

var shooting = false


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("->"):
		position.y=-0
		position.x=100
		rotation = deg_to_rad(90)
		if not shooting:
			
			shooting=true
			

			$Timer.start()
			await $Timer.timeout
			shooting=false
			
		


	if Input.is_action_pressed("<-"):
		position.y=-0
		position.x=-100
		rotation = deg_to_rad(270)
		if not shooting:
			shooting=true
			$AnimationPlayer.play("swing")
			
			$Timer.start()
			await $Timer.timeout
			shooting=false

	if Input.is_action_pressed("down"):
		position.x=-0
		position.y=100
		rotation = deg_to_rad(180)
		if not shooting:
			shooting=true

			$Timer.start()
			await $Timer.timeout
			shooting=false

	if Input.is_action_pressed("up"):
		position.x=-0
		position.y=-100
		rotation = deg_to_rad(360)
		if not shooting:
			shooting=true
			play_time()
			
			$Timer.start()
			await $Timer.timeout

			
			shooting=false

		
func play_time():
	$anitimer.start()
	$AnimationPlayer.play("swing")
	await $anitimer.timeout
	$AnimationPlayer.play("reset")
