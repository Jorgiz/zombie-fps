extends CharacterBody3D

signal crouching(state: bool)

@export var head: Camera3D
@export var uncrouch_check: ShapeCast3D

@export_category("Attributes")
@export var walking_speed: int = 4
@export var running_speed: int = 8
@export var crouching_speed: int = 2
@export var jumping_velocity: float = 4.5
@export var floor_friction: float = .5
@export var air_friction: float = .2

var speed: int = 4
var player_is_on_floor: bool

var is_crouching: bool
var waiting_to_uncrouch

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	check_if_on_floor()
	if not player_is_on_floor: apply_gravity(delta)
	align_player_with_head()
	handle_movement(Input.get_vector("left", "right", "forward", "backward"))
	handle_running()
	handle_crouching()
	handle_jumping()
	move_and_slide()


func check_if_on_floor() -> void:
	player_is_on_floor = is_on_floor()


func apply_gravity(delta: float) -> void:
	velocity.y -= gravity * delta


func align_player_with_head() -> void:
	self.global_rotation.y = head.global_rotation.y


func handle_movement(direction: Vector2) -> void:
	var target_velocity = basis * Vector3(direction.x, 0, direction.y) * speed
	var friction = floor_friction if player_is_on_floor else air_friction
	velocity.x = move_toward(velocity.x, target_velocity.x, friction)
	velocity.z = move_toward(velocity.z, target_velocity.z, friction)


func handle_running() -> void:
	if Input.is_action_pressed("run"):
		speed = running_speed
	else:
		speed = walking_speed


func handle_crouching() -> void:
	pass


func handle_jumping() -> void:
	if Input.is_action_just_pressed("jump") and player_is_on_floor: velocity.y = jumping_velocity
