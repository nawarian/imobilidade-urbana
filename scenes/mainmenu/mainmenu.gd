extends Control

@onready var intro_scene: PackedScene = preload("res://scenes/intro/intro.tscn")

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		SceneManager.change_to(intro_scene)
