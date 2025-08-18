extends State


func enter() -> void:
	Global.player.speed = Global.player.running_speed


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	if not Global.player.is_running():
		emit_signal("change_state", "walking")
		return
	
	if Global.player.is_crouching():
		emit_signal("change_state", "crouching")
		return
	
	if Global.player.is_jumping():
		emit_signal("change_state", "jumping")
		return
	
	Global.player.move()


func exit() -> void:
	pass
