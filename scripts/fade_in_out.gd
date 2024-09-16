extends Node

func fade_in(target: Node, time_sec: float, modulate: Color = Color.WHITE):
	var tween = create_tween()
	tween.tween_property(target, "modulate", modulate, time_sec)
	tween.tween_interval(0.1)
	
	await tween.finished

func fade_out(target: Node, time_sec: float, modulate: Color = Color.BLACK):
	var tween = create_tween()
	tween.tween_property(target, "modulate", modulate, time_sec)
	tween.tween_interval(0.1)
	
	await tween.finished
