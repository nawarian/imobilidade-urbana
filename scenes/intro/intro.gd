extends Control

@onready var gameplay_scene: PackedScene = preload("res://scenes/gameplay/gameplay.tscn")

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		SceneManager.change_to(gameplay_scene)
