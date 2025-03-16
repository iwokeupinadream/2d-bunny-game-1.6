class_name State extends Node

static var player: Player
static var state_machine: StateMachine

#what happens when you enter
func enter() -> void:
	pass

#what happens when you exit
func exit() -> void:
	pass

#called every frame during the _process function (for non physics changes, animation changes)
func process(delta: float) -> State:
	return null
	
#called every physics frame during physics process
func physics(delta: float) -> State:
	return null
	
#called when events occur
func unhandled_input(event: InputEvent) -> State:
	return null
