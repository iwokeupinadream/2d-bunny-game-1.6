class_name RunState extends State

@onready var idle_state: IdleState = $"../IdleState"
@onready var jump_state: JumpState = $"../JumpState"
@onready var fall_state: FallState = $"../FallState"


#what happens when you enter
func enter() -> void:
	player.animation_player.play("run")
	print("run")

#what happens when you exit
func exit() -> void:
	pass

#called every frame during the _process function (for non physics changes, animation changes)
#changed delte to _delta cause paramter was not used to get rid of debug errors
#before it was func process(delta: float) -> State:
func process(_delta: float) -> State:
	if player.direction == 0:
		return idle_state
	return null
	
#called every physics frame during physics process
func physics(delta: float) -> State:
	player.velocity.x = player.direction * player.speed
	
	if not player.is_on_floor():
		fall_state
		
	return null
	
#called when events occur
func unhandled_input(event: InputEvent) -> State:
	if event.is_action_pressed("jump") and player.is_on_floor():
		return jump_state
	return null
