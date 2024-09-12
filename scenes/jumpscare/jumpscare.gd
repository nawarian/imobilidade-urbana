extends Control

@onready var gameplay_scene: PackedScene = preload("res://scenes/gameplay/gameplay.tscn")

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		if not gameplay_scene.can_instantiate():
			gameplay_scene = load("res://scenes/gameplay/gameplay.tscn")

		SceneManager.change_to(gameplay_scene)
