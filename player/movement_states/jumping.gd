extends State


func enter() -> void:
	Global.player.velocity.y = Global.player.jump_velocity


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	Global.player.move()
	
	if Global.player.is_on_floor():
		emit_signal("change_state", "idle")
		return
	
	if Global.player.is_crouching():
		emit_signal("change_state", "crouching")
		return


func exit() -> void:
	pass
