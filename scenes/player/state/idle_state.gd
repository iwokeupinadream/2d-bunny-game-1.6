class_name IdleState extends State

@onready var run_state: Node = $"../RunState"
@onready var jump_state: Node = $"../JumpState"
@onready var fall_state: Node = $"../FallState"



#what happens when you enter
func enter() -> void:
	player.velocity.x = 0
	player.animation_player.play("idle")
	print("idle")

#what happens when you exit
func exit() -> void:
	pass

#called every frame during the _process function (for non physics changes, animation changes)
func process(delta: float) -> State:
	if player.direction != 0:
		return run_state
	return null
	
#called every physics frame during physics process
func physics(delta: float) -> State:
	if not player.is_on_floor():
		return fall_state
	return null
	
#called when events occur
func unhandled_input(event: InputEvent) -> State:
	if event.is_action_pressed("jump") and player.is_on_floor():
		return jump_state
	return null
