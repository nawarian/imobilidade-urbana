extends Control

@onready var gameover_scene: PackedScene = preload("res://scenes/gameover/gameover.tscn")
@onready var jumpscare_scene: PackedScene = preload("res://scenes/jumpscare/jumpscare.tscn")
@onready var outro_scene: PackedScene = preload("res://scenes/outro/outro.tscn")

@onready var dialogue_container = $DialogueContainer
@onready var announcements_player = $AnnouncementsPlayer

func _ready():
	dialogue_container.visible = true
	dialogue_container.start("intro.monolog", 2)

func _process(delta):
	if Input.is_action_just_released("ui_left"):
		SceneManager.change_to(gameover_scene)
	if Input.is_action_just_released("ui_up"):
		SceneManager.change_to(jumpscare_scene)
	if Input.is_action_just_released("ui_right"):
		SceneManager.change_to(outro_scene)

func _on_dialogue_container_next_sentence(text_label, speaker, index):
	if index == 1:
		announcements_player.stream = load("res://scenes/gameplay/announcements/sfx_trem_aviso_sonoro_anunciante_0.mp3")
		announcements_player.play()

func _on_dialogue_container_dialogue_finished():
	dialogue_container.visible = false
