extends Sprite2D

@export var train_speed: float = 999.0

var exploded: bool = false

func loop_bump():
	if exploded:
		return

	var bump_tween = create_tween()
	bump_tween.tween_property(self, "position:y", self.position.y + 5, 200.0 / float(train_speed))
	bump_tween.tween_property(self, "position:y", self.position.y, 200.0 / float(train_speed))
	bump_tween.tween_callback(loop_bump)

func _ready():
	loop_bump()

func _process(delta):
	self.position.x += delta * train_speed
