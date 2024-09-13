extends Node

func fade_in(target: Node, time_sec: float):
	var orig_modulate = target.modulate
	target.modulate = Color.BLACK
	
	var tween = create_tween()
	tween.tween_property(target, "modulate", orig_modulate, time_sec)
	tween.tween_interval(0.1)
	
	await tween.finished

func fade_out(target: Node, time_sec: float):
	var tween = create_tween()
	tween.tween_property(target, "modulate", Color.BLACK, time_sec)
	tween.tween_interval(0.1)
	
	await tween.finished
