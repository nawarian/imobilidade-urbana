extends Control

@onready var credits_scene: PackedScene = preload("res://scenes/credits/credits.tscn")

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		SceneManager.change_to(credits_scene)
