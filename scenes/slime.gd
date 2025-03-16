extends Node2D

@onready var ray_cast_left: RayCast2D = $AnimatedSprite2D/RayCast2D
@onready var ray_cast_right: RayCast2D = $AnimatedSprite2D/RayCast2D2

const SPEED = 80

var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _process(delta: float) -> void:
	pass


func slimeMoving(delta):
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
	position.x += direction * SPEED * delta
