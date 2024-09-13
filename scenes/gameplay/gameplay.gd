extends Control

@onready var gameover_scene: PackedScene = preload("res://scenes/gameover/gameover.tscn")
@onready var jumpscare_scene: PackedScene = preload("res://scenes/jumpscare/jumpscare.tscn")
@onready var outro_scene: PackedScene = preload("res://scenes/outro/outro.tscn")

func _process(delta):
	if Input.is_action_just_released("ui_left"):
		SceneManager.change_to(gameover_scene)
	if Input.is_action_just_released("ui_up"):
		SceneManager.change_to(jumpscare_scene)
	if Input.is_action_just_released("ui_right"):
		SceneManager.change_to(outro_scene)
