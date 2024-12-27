extends CharacterBody2D

var speed = 50
var player_position
var target_direction
# Get a reference to the player
@onready var player = get_parent().get_node("player")

func _physics_process(delta):
	if player:  # Ensure the player exists
		# Set player_position to the position of the player node
		player_position = player.position
		# Calculate the direction vector towards the player
		target_direction = (player_position - position).normalized()

		# Check if the enemy is outside a 3px range of the player
		if position.distance_to(player_position) > 3:
			velocity = target_direction * speed
			move_and_slide()
