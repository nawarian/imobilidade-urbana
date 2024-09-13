extends Node

func change_to(
	next_scene: PackedScene,
	fade_out: bool = true,
	fade_out_time_sec: float = 1.0,
	fade_in: bool = true,
	fade_in_time_sec: float = 0.5,
):
	if fade_out:
		var rect = _create_fade_rect()
		await FadeInOut.fade_out(rect, fade_out_time_sec)

	await _change_scene_to_packed_await(next_scene)

	if fade_in:
		var rect = _create_fade_rect()
		await FadeInOut.fade_in(rect, fade_in_time_sec)

func _create_fade_rect() -> ColorRect:
	var screen_size = get_tree().root.get_size_with_decorations()

	var rect = ColorRect.new()
	rect.set_size(screen_size)
	rect.modulate = Color.BLACK
	rect.modulate.a = 0

	get_tree().current_scene.add_child(rect)

	return rect

func _change_scene_to_packed_await(packed: PackedScene):
	if not packed.can_instantiate():
		print("[WARN] Scene ", packed.resource_name, " could not be instantiated. Reloading from disk.")
		packed = load(packed.resource_path)

	# Wait for very first scene to initialize
	await get_tree().process_frame

	var scene = packed.instantiate()
	get_tree().root.add_child(scene)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = scene

	while get_tree().current_scene == null:
		await get_tree().process_frame
