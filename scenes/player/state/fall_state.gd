class_name FallState extends State

@onready var idle_state: IdleState = $"../IdleState"
@onready var run_state: RunState = $"../RunState"
@onready var jump_state: JumpState = $"../JumpState"


#what happens when you enter
func enter() -> void:
	player.animation_player.play("fall")
	print("fall")

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
	
	if player.is_on_floor():
		return idle_state if player.direction == 0 else run_state
	return null
	
#called when events occur
func unhandled_input(event: InputEvent) -> State:
	return null
