extends Node2D

@onready var ray_cast_left: RayCast2D = $AnimatedSprite2D/RayCastLeft
@onready var ray_cast_right: RayCast2D = $AnimatedSprite2D/RayCastRight
@onready var shark: AnimatedSprite2D = $AnimatedSprite2D
@onready var kill_zone: Area2D = $AnimatedSprite2D/KillZone
@onready var game_manager: Node = %GameManager



const SPEED = 60

var swimming: bool = false
var direction = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sharkMoving(delta)


func _on_hurt_box_body_entered(body: Node2D) -> void:
	game_manager.sharkDead()
	queue_free()
	
	

func sharkMoving(delta):
	if swimming == false:
		if ray_cast_right.is_colliding():
			direction = -1
			shark.flip_h = true
		if ray_cast_left.is_colliding():
			direction = 1
			shark.flip_h = false
		position.x += direction * SPEED * delta
		#timer.start()

#func _on_timer_timeout() -> void:
	#if swimming == false:
		#timer2.start()
		#swimming = true
		#direction = 0
		#shark.play("swim")
#
#func _on_timer2_timeout() -> void:
	#print("starting timer 2")
	#swimming = false
	#direction = randfn(-1, 0)
