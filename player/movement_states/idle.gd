extends State


func enter() -> void:
	print("idle")
	Global.player.speed = 0


func physics_update(delta: float) -> void:
	var is_walking = Global.player.get_inputs()
	if is_walking:
		emit_signal("change_state", "walking")
		return
	
	var is_jumping = Input.is_action_just_pressed("jump") and Global.player.is_on_floor()
	if is_jumping:
		emit_signal("change_state", "jump")
		return
	
	var is_crouching = Input.is_action_pressed("crouch")
	if is_crouching:
		emit_signal("change_state", "crouch")
		return
	
	Global.player.move() # moves with 0 speed (deaccelerate)
