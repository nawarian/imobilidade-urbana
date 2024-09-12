extends Control

@onready var menu_scene: PackedScene = preload("res://scenes/mainmenu/mainmenu.tscn")

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		SceneManager.change_to(menu_scene)
