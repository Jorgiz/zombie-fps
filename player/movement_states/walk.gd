extends State


func enter() -> void:
	Global.player.speed = Global.player.walking_speed


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	if not Global.player.is_moving():
		emit_signal("change_state", "idle")
		return
	
	if Global.player.is_running():
		emit_signal("change_state", "running")
		return
	
	if Global.player.is_jumping():
		emit_signal("change_state", "jump")
		return
	
	if Global.player.is_crouching():
		emit_signal("change_state", "crouch")
		return
	
	Global.player.move()


func exit() -> void:
	pass
