extends Control

@onready var menu_scene: PackedScene = preload("res://scenes/mainmenu/mainmenu.tscn")

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		if not menu_scene.can_instantiate():
			menu_scene = load("res://scenes/mainmenu/mainmenu.tscn")

		SceneManager.change_to(menu_scene)
