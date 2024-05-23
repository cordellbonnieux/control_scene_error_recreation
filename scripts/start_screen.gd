extends Control

var menu: PackedScene = preload("res://scenes/main_menu.tscn")

func _input(event) -> void:
	if event is InputEventMouseButton or event is InputEventKey:
		get_tree().change_scene_to_packed(menu)
