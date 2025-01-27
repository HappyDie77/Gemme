extends Node2D

var shooting = false
@onready var sword: Node2D = $sword1
var Anipa = false


# Direction mapping for input actions
const DIRECTIONS = {
	"<-": Vector2(-1, 0),
	"->": Vector2(1, 0),
	"up": Vector2(0, 1),
	"down": Vector2(0, 1)
}
const ROTATIONS = {
	"<-": 270,
	"->": 90,
	"up": 0,
	"down": 180
}

func _physics_process(delta: float) -> void:
	var active_action = get_highest_priority_action()
	if active_action != "":
		handle_shooting(active_action, DIRECTIONS[active_action], ROTATIONS[active_action])

func get_highest_priority_action() -> String:
	# Define priority order: left > right > up > down
	var priority = ["<-", "->", "up", "down"]
	for action in priority:
		if Input.is_action_pressed(action):
			return action
	return ""

func handle_shooting(action: String, direction: Vector2, rotation_deg: float) -> void:
	sword.z_index = 2 if action in ["<-", "down","->"] else 0
	
	rotation = deg_to_rad(rotation_deg)
	
	if Input.is_action_pressed("down"):

		position.y=-4
		
	if not shooting:
		shooting = true
		

			$sword1/AnimationPlayer.play("swing")
			Anipa = true
		else:
			$sword1/AnimationPlayer.play("Swing reset")
			Anipa = false
		
