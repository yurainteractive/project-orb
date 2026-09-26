class_name Hazard
extends Area2D

signal player_hit


func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Player"):
		player_hit.emit(body)
