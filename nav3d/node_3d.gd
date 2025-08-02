extends Node3D

signal mouse_clicked(point: Vector3)

@onready var camera: Camera3D = $Camera3D
@onready var raycast: RayCast3D = $Camera3D/RayCast3D

func _physics_process(delta: float) -> void:
	handle_rotation()
	handle_mouse_click()


func handle_rotation() -> void:
	if Input.is_action_pressed("left"):
		rotation_degrees.y = rotation_degrees.y - 5 * .5
	if Input.is_action_pressed("right"):
		rotation_degrees.y = rotation_degrees.y + 5 * .5


func handle_mouse_click() -> void:
	if Input.is_action_just_pressed("click"):
		var mouse_position: Vector3 = camera.project_local_ray_normal(get_viewport().get_mouse_position())
		raycast.target_position = mouse_position * 100
		
		raycast.force_raycast_update()
		
		if raycast.is_colliding():
			emit_signal("mouse_clicked", raycast.get_collision_point())
