class_name Player
extends CharacterBody2D
@onready var movement : PlayerMovement = $Movement
@onready var bounce : PlayerBounce = $Bounce
@export var fall_limit : float = 1000.0

func _ready() -> void:
	movement.player = self
	bounce.player = self

func _physics_process(delta: float) -> void:
	movement.update_movement(delta)
	
	move_and_slide();
	
	if global_position.y > fall_limit :
		global_position = Vector2(0,0)
		velocity = Vector2.ZERO
	

func apply_bounce(strength: float) -> void:
	bounce.bounce(strength)

func _on_bounce_pad_player_bounced(player: CharacterBody2D) -> void:
	if player == self:
		apply_bounce(-600.0)

func reset_to_position(position: Vector2) -> void:
	global_position = position
	velocity = Vector2.ZERO
