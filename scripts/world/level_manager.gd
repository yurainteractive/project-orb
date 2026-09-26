extends Node2D

var current_level_id : int = 1

var level_scenes: Array[PackedScene] = [
	preload("res://scenes/level/level_01.tscn"),
	preload("res://scenes/level/level_02.tscn")
]

func load_level(level_id:int) -> void :
	if level_id < 1 or level_id > level_scenes.size() :
		return
	
	current_level_id = level_id
	
	var  level_scene := level_scenes[level_id - 1]
	get_tree().change_scene_to_packed(level_scene)

func load_next_level() -> void :
	var next_level_id := current_level_id + 1
	
	if next_level_id > level_scenes.size():
		return
	
	load_level(next_level_id)
