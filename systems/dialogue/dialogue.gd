extends ColorRect

class_name Dialogue

signal next_sentence(text_label, speaker, index)
signal dialogue_finished

@export var dialogue_prefix_key: String
@export var total_messages: int

@onready var label: RichTextLabel = $TextContainer/RichTextLabel
@onready var tick_sfx: AudioStreamPlayer2D = $TextContainer/CharacterTickSfx

var tween: Tween
var sfx_tween: Tween

var current_line: int = 0
var finished: bool = false

func _input(event):
	if tween is not Tween:
		return

	if event is InputEventKey and event.is_pressed():
		if tween.is_running():
			label.visible_ratio = 1
			tween.kill()
			sfx_tween.kill()
		else:
			next_line()

func start(prefix_key, total):
	current_line = 0
	finished = false
	dialogue_prefix_key = prefix_key
	total_messages = total
	
	set_process_input(true)

	next_line()

func next_line():
	if finished:
		return

	if current_line > total_messages - 1:
		finished = true
		set_process_input(false)
		emit_signal("dialogue_finished")
		return

	var label_text = "%s.%d.text" % [dialogue_prefix_key, current_line]
	var speaker_text = "%s.%d.speaker" % [dialogue_prefix_key, current_line]

	emit_signal("next_sentence", label_text, speaker_text, current_line)
	label.text = label_text
	label.visible_ratio = 0

	sfx_tween = create_tween()
	sfx_tween.set_loops()
	sfx_tween.tween_callback(tick_sfx.play).set_delay(0.05)

	tween = create_tween()
	tween.tween_property(label, "visible_ratio", 1, 5)
	current_line = current_line + 1

	await tween.finished
	sfx_tween.kill()
	tick_sfx.stop()
