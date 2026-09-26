class_name Collectible
extends Area2D

signal collected(collectible: Collectible)
@export var collectible_id: StringName

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player"):
		return
	collected.emit(self, collectible_id)
