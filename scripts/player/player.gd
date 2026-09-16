extends CharacterBody2D

@onready var movement : PlayerMovement = $Movement

func _ready() -> void:
	movement.player = self

func _physics_process(delta: float) -> void:
	movement.update_movement(delta)
	move_and_slide();
