class_name PlayerBounce
extends Node

@export var bounce_velocity: float = -820.0

var player: CharacterBody2D

func bounce(strength:float) -> void:
	if player == null:
		return
	
	player.velocity.y = strength if strength != null else bounce_velocity
