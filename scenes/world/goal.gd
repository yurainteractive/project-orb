class_name LevelGoal
extends Area2D

signal level_completed

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
		
	level_completed.emit()
