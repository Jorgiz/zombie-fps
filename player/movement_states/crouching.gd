extends State

signal is_crouching(state: bool)

func enter() -> void:
	Global.player.speed = Global.player.crouching_speed
	emit_signal("is_crouching", true)


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	if not Global.player.is_crouching():
		emit_signal("change_state", "idle")
		return
	
	if Global.player.is_jumping():
		emit_signal("change_state", "jumping")
		return
	
	Global.player.move()


func exit() -> void:
	emit_signal("is_crouching", false)
