extends Area2D
class_name Checkpoint

signal activated(checkpoint: Checkpoint)

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("Player") :
		return
	activated.emit(self)
