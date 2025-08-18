extends AnimationPlayer

@export var crouching_speed: float = 5


func _on_crouching_is_crouching(state: bool) -> void:
	var target_speed = crouching_speed if state else -crouching_speed
	var reverse = false if state else true
	
	play("crouch placeholder", .2, target_speed, reverse)
