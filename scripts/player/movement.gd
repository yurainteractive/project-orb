class_name PlayerMovement
extends Node

@export var move_speed : float = 200.0
@export var acceleration : float = 1200.0
@export var declaration : float = 1600.0


var player : CharacterBody2D

func update_movement(delta: float) -> void:
	if player == null :
		return
	
	var direction :=  Input.get_axis("move_left","move_right")
	
	print("Direction: ", direction);
	var target_speed := direction * move_speed
	
	if direction != 0.0 :
		player.velocity.x = move_toward(
			player.velocity.x,
			target_speed,
			acceleration * delta
		)
	else : 
		player.velocity.x = move_toward(
			player.velocity.x,
			0.0,
			declaration * delta
		)
