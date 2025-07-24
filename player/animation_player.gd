extends AnimationPlayer

@export var crouching_speed: float = 5


func _ready() -> void:
	get_parent().connect("is_crouching", on_is_crouching)


func on_is_crouching(state: bool) -> void:
	if state:
		play("crouch placeholder", -1, crouching_speed)
	else:
		play("crouch placeholder", -1, -crouching_speed, true)
