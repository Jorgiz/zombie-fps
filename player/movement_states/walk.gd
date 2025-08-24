extends State


func enter() -> void:
	Global.player.speed = Global.player.walking_speed


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	Global.player.move()
	
	if not Global.player.is_moving():
		emit_signal("change_state", "idle")
		return
	
	if Global.player.is_running():
		emit_signal("change_state", "running")
		return
	
	if Global.player.is_jumping():
		emit_signal("change_state", "jumping")
		return
	
	if Global.player.is_crouching():
		emit_signal("change_state", "crouching")
		return


func exit() -> void:
	pass
