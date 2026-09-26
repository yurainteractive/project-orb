class_name PlayerMovement
extends Node

@export_category("Horizontal Movement")
@export var move_speed : float = 200.0
@export var acceleration : float = 1200.0
@export var declaration : float = 1600.0

@export_category("vertical Movement")
@export var gravity :  float = 1200.0
@export var jump_velocity :  float = -420.0

@export_category("cayote timing")
@export var cayote_time : float = 0.1
var cayote_timer : float = 0

var player : CharacterBody2D

func update_movement(delta: float) -> void:
	if player == null :
		return
	
	_update_cayote_time(delta)
	_apply_gravity(delta)
	_handle_horizontal_movement(delta)
	_hanlde_jump()
	
func _apply_gravity(delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y += gravity * delta

func _handle_horizontal_movement(delta:float)->void:
	var direction :=  Input.get_axis("move_left","move_right")
	
	var target_speed := direction * move_speed
	var rate := acceleration if direction != 0.0 else declaration
	
	player.velocity.x = move_toward(
		player.velocity.x,
		target_speed,
		rate * delta
	)

func _hanlde_jump()->void:
	if Input.is_action_pressed("jump") and player.is_on_floor() :
		player.velocity.y += jump_velocity
		cayote_timer = 0.0

func _update_cayote_time(delta:float) -> void:
	if player.is_on_floor():
		cayote_timer = cayote_time
	else:
		cayote_timer -= delta
