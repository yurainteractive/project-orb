class_name BouncePad
extends Area2D

@export var bounce_velocity: float = -600.0

signal player_bounced(player: CharacterBody2D)
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D :
		player_bounced.emit(body)
