class_name Player extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var state_machine: StateMachine = $StateMachine

@export var speed: float = 150
#gravity controls falling and jumping
@export var gravity: float = 1150.0
#for jumping
@export var air_speed: float = 150.0
@export var air_acceleration: float = 0.1
@export var jump_force: float = -400
@export var coyote_time: float = 0.2

var direction: float

func _ready() -> void:
	state_machine.configure(self)
	print(state_machine)

#similar to _pysics_process(delta) method except it doesnt use delta. runs all times
#in our case its running at all times to get the input of left or right
func _process(delta: float) -> void:
	direction = Input.get_axis("left", "right")
	if direction:
		sprite.flip_h = direction < 0

func _physics_process(delta: float) -> void:
	
	
	if not is_on_floor():
		if not is_on_floor():
			velocity.y += gravity * delta
		
		#handle_air_movement()
	#else:
		#pass
		#handle_ground_movement(delta)
	
	#handle_jump()
	#update_animations()
	move_and_slide()

#func handle_ground_movement(delta : float) -> void:
	#if direction:
		#velocity.x = direction * speed
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed)
		#
#func handle_air_movement() -> void:
	#if direction:
		#velocity.x = lerp(velocity.x, direction * air_speed, air_acceleration)
	#else:
		#velocity.x = lerp(velocity.x, 0.0, air_acceleration * 0.5)
	
#func handle_jump() -> void:
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = jump_force

#func update_animations() -> void:
	#if not is_on_floor():
		#if velocity.y < 0:
			#animation_player.play("jump")
		#else:
			#animation_player.play("fall")
	#else:
			#if velocity.x != 0:
				#animation_player.play("run")
			#else:
				#animation_player.play("idle")
