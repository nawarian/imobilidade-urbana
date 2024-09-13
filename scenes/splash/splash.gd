extends Control

@onready var menu_scene: PackedScene = preload("res://scenes/mainmenu/mainmenu.tscn")

@onready var logo: TextureRect = $Logo
@onready var stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready():
	stream_player.play()
	await stream_player.finished

	await FadeInOut.fade_out(logo, 0.5)
	logo.texture = load("res://scenes/splash/camaradev-logo.png")
	logo.modulate = Color.WHITE
	await FadeInOut.fade_in(logo, 1)

	await get_tree().create_timer(1).timeout
	SceneManager.change_to(menu_scene)
