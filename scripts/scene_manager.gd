extends Node

func change_to(next_scene: PackedScene):
	get_tree().change_scene_to_packed(next_scene)
