extends Node2D

@onready var splash_scene: PackedScene = preload("res://scenes/splash/splash.tscn")

func _ready():
	SceneManager.change_to(splash_scene, false, 0, false, 0)
