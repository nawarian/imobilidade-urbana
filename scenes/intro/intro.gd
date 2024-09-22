extends Control

@onready var next_scene: PackedScene = load("res://scenes/gameplay/gameplay.tscn")
@onready var anim: AnimationPlayer = $ParallaxBackground/TextOverlay/TrainIntro

func _ready():
	anim.play("train_intro")
	await anim.animation_finished
	SceneManager.change_to(next_scene)
