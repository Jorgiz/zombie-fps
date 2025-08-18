extends State


func enter() -> void: 
	print("walking")
	Global.player.speed = Global.player.walking_speed


func physics_update(delta: float) -> void:
	var not_walking = not Global.player.get_inputs()
	if not_walking:
		emit_signal("change_state", "idle")
		return
	
	var is_running = Input.is_action_pressed("run")
	if is_running:
		emit_signal("change_state", "running")
		return
	
	var is_jumping = Input.is_action_just_pressed("jump") and Global.player.is_on_floor()
	if is_jumping:
		emit_signal("change_state", "jump")
		return
	
	var is_crouching = Input.is_action_pressed("crouch")
	if is_crouching:
		emit_signal("change_state", "crouch")
		return
	
	Global.player.move()
