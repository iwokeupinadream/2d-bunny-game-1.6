class_name JumpState extends State

@onready var fall_state: FallState = $"../FallState"

#what happens when you enter
func enter() -> void:
	player.velocity.y = player.jump_force
	player.animation_player.play("jump")
	print("jump")

#what happens when you exit
func exit() -> void:
	pass

#called every frame during the _process function (for non physics changes, animation changes)
func process(delta: float) -> State:
	return null
	
#called every physics frame during physics process
func physics(delta: float) -> State:
	if player.direction:
		player.velocity.x = lerp(player.velocity.x, player.direction * player.air_speed, player.air_acceleration)
	else:
		player.velocity.x = lerp(player.velocity.x, 0.0, player.air_acceleration * 0.5)
		
	if player.velocity.y >= 0:
		return fall_state
	return null
	
#called when events occur
func unhandled_input(event: InputEvent) -> State:
	return null
