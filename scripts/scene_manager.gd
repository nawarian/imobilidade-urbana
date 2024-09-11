extends Node

var fade_rect: ColorRect
var scene_container: Node2D

func _ready():
	fade_rect = get_node("/root/Game/MainControl/FadeRect")
	fade_rect.visible = false
	fade_rect.modulate.a = 0
	
	scene_container = get_node("/root/Game/SceneContainer")

func change_to(
	next_scene: PackedScene,
	fade_out: bool = true,
	fade_out_seconds: float = 1,
	fade_in: bool = true,
	fade_in_seconds: float = 1,
) -> void:
	var fade_tween = create_tween()
	var new_scene = next_scene.instantiate()
	
	if fade_out:
		fade_rect.visible = true
		fade_tween.tween_property(fade_rect, "modulate:a", 1, fade_out_seconds)

	fade_tween.tween_callback(_do_change_to.bind(new_scene))

	if fade_in:
		fade_tween.tween_property(fade_rect, "modulate:a", 0, fade_in_seconds)
		fade_tween.tween_property(fade_rect, "visible", false, 0)

func _do_change_to(scene: Node):
	for c in scene_container.get_children():
		c.queue_free()

	scene_container.add_child(scene)
