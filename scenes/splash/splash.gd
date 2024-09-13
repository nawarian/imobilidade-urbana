extends Control

@onready var menu_scene: PackedScene = preload("res://scenes/mainmenu/mainmenu.tscn")

@onready var stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready():
	stream_player.play()
	await stream_player.finished
	await get_tree().create_timer(0.5).timeout
	SceneManager.change_to(menu_scene)
