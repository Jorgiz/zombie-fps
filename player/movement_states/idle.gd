extends State


func enter() -> void:
	Global.player.speed = 0


func update(delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	Global.player.move() # moves with 0 speed (deaccelerate)
	
	if Global.player.is_moving():
		emit_signal("change_state", "walking")
		return
	
	if Global.player.is_jumping():
		emit_signal("change_state", "jumping")
		return
	
	if Global.player.is_crouching():
		emit_signal("change_state", "crouching")
		return


func exit() -> void:
	pass
