extends State

signal is_crouching(state: bool)

@export var uncrouch_check: ShapeCast3D

func enter() -> void:
	Global.player.speed = Global.player.crouching_speed
	emit_signal("is_crouching", true)


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	Global.player.move()
	
	if uncrouch_check.is_colliding():
		return
	
	if not Global.player.is_crouching():
		emit_signal("change_state", "idle")
		return
	
	if Global.player.is_jumping():
		emit_signal("change_state", "jumping")
		return


func exit() -> void:
	emit_signal("is_crouching", false)
