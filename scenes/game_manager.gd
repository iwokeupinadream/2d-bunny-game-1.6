extends Node

@onready var label: Label = $Label2


var score = 0
var shark_dead = false

func add_point():
	score += 1
	print(score)
	
func sharkDead():
	shark_dead = true

func _process(delta: float) -> void:
	if shark_dead == true:
		label.text = "You Win! " + str(score) + " Carrots were found!
		Thank you for playing!"
