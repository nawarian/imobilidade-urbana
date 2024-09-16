extends Control

@onready var intro_scene: PackedScene = preload("res://scenes/intro/intro.tscn")
@onready var headphones_image: Resource = preload("res://scenes/mainmenu/logo-put-headphones.png")

@onready var logo: TextureRect = $Logo
@onready var bgm: AudioStreamPlayer2D = $bgm
@onready var text_label: RichTextLabel = $PressAnyKey
@onready var disclaimer_text_label: RichTextLabel = $Disclaimer

func _ready():
	bgm.volume_db = -20
	bgm.play()

	var bgm_tween = create_tween()
	bgm_tween.tween_property(bgm, "volume_db", 0, 4)

	_blink(text_label)

func _blink(target: Node):
	var tween = create_tween()
	tween.tween_property(target, "modulate:a", 0.4, 0.2)
	tween.tween_property(target, "modulate:a", 1, 0.1)
	tween.tween_property(target, "modulate:a", 0.4, 0.2)
	tween.tween_property(target, "modulate:a", 1, 0.4)
	tween.tween_interval(randf() * 5)
	tween.tween_callback(_blink.bind(target))
	

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		if logo.texture != headphones_image:
			await FadeInOut.fade_out($".", 1)
			logo.texture = headphones_image
			disclaimer_text_label.text = "ui.put.headphones"
			await FadeInOut.fade_in($".", 2, Color.WHITE)
		else:
			SceneManager.change_to(intro_scene)
