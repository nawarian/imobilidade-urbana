extends CharacterBody2D

const SPEED = 300.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

enum PlayerState {
	IDLE,
	WALKING,
	TALKING,
}
@export var player_state: PlayerState = PlayerState.IDLE

enum PlayerLightState {
	ON,
	OFF,
}
@export var player_light_state: PlayerLightState = PlayerLightState.OFF

enum PlayerDirection {
	LEFT,
	RIGHT,
}
@export var player_direction: PlayerDirection = PlayerDirection.RIGHT

func _process(delta):
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		player_direction = PlayerDirection.RIGHT
		player_state = PlayerState.WALKING
		velocity.x = direction * SPEED
	elif direction < 0:
		player_direction = PlayerDirection.LEFT
		player_state = PlayerState.WALKING
		velocity.x = direction * SPEED
	else:
		player_state = PlayerState.IDLE
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("ui_accept"):
		player_light_state = PlayerLightState.ON if player_light_state == PlayerLightState.OFF else PlayerLightState.OFF
	
	_process_anim(delta)

func _process_anim(delta):
	if player_state == PlayerState.IDLE or player_state == PlayerState.TALKING:
		anim.play("idle")
	elif player_state == PlayerState.WALKING:
		anim.play("walk")

	anim.flip_h = true if player_direction == PlayerDirection.LEFT else false

func _physics_process(delta: float) -> void:
	move_and_slide()
