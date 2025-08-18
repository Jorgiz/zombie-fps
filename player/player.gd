extends CharacterBody3D
class_name Player

@export var camera: Camera3D

@export var walking_speed: int = 4
@export var running_speed: int = 8
@export var crouching_speed: int = 2
@export var jump_velocity: float = 4.5

var speed: int = 0

@onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _enter_tree() -> void:
	Global.player = self


func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	align_player_rotation_with_view()
	move_and_slide()


func apply_gravity(delta: float) -> void:
	velocity.y -= gravity * delta


func align_player_rotation_with_view() -> void:
	self.rotation.y = camera.rotation.y


func get_inputs() -> Vector2:
	return Input.get_vector("left", "right", "forward", "backward")


func move() -> void:
	var direction = get_inputs()
	var target_velocity = basis * Vector3(direction.x, 0, direction.y) * speed
	var friction = Global.floor_friction if is_on_floor() else Global.air_friction
	velocity.x = move_toward(velocity.x, target_velocity.x, friction)
	velocity.z = move_toward(velocity.z, target_velocity.z, friction)
