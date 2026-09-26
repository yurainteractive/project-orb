class_name Level
extends Node2D

@export var level_id:int = 1
@export var player_scene:PackedScene

@onready var player_spawn:Marker2D = $PlayerSpawn
@onready var goal: LevelGoal = $Goal
@onready var hazard: Hazard = $Hazards/Hazard
@onready var collectible: Collectible = $Collectibles/Collectible
@onready var checkpoint: Checkpoint = $Checkpoints/Checkpoint

var player : Player
var active_spawn_position : Vector2

func _ready() -> void:
	goal.level_completed.connect(_on_goal_reached)
	
	active_spawn_position = player_spawn.global_position
	spawn_player()
	
	for hazard in get_tree().get_nodes_in_group("Hazard"):
		hazard.player_hit.connect(_on_player_hit)
	for collectible in get_tree().get_nodes_in_group("collectible"):
		collectible.collected.connect(_on_collectible_collected)
	for checkpoint in get_tree().get_nodes_in_group("checkpoint") :
		checkpoint.activated.connect(_on_checkpoint_activated)
	

func get_spawn_position() -> Vector2:
	return active_spawn_position
	
func _on_goal_reached() -> void:
	print("Level Completed: ", level_id)
	LevelManager.load_next_level()

func spawn_player() -> void:
	player = player_scene.instantiate()
	add_child(player)
	
	_reset_player()

func respawn_player() -> void:
	_reset_player()

func _reset_player() -> void:
	if player == null:
		return
	player.reset_to_position(get_spawn_position())

func _on_player_hit(hit_player:CharacterBody2D) -> void:
	if hit_player != player:
		return
	print("Player hit!")
	respawn_player()

func _on_collectible_collected(collectible: Collectible, id: StringName)->void :
	print("Collected:", id)
	collectible.queue_free()

func _on_checkpoint_activated(checkpoint: Checkpoint) -> void :
	print("Checkpoint Activated!")
	active_spawn_position = checkpoint.global_position
