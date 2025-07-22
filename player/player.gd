extends CharacterBody3D
class_name Player

@export var head: Camera3D

@export_category("Attributes")
@export var walking_speed: int = 4
@export var running_speed: int = 8
@export var crouching_speed: int = 2
@export var jumping_velocity: float = 4.5
@export var floor_friction: float = .5
@export var air_friction: float = .1

var speed: int = 4

var on_floor: bool

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	check_is_on_floor()
	match_heads_rotation()
	handle_movement()
	move_and_slide()


func apply_gravity(delta: float) -> void:
	velocity.y -= gravity * delta


func check_is_on_floor() -> void:
	on_floor = is_on_floor()


func match_heads_rotation() -> void:
	self.global_rotation.y = head.global_rotation.y


#region movement region
func handle_movement() -> void:
	if velocity.is_equal_approx(Vector3.ZERO): idle_logic()
	walk_logic()
	if Input.is_action_pressed("run"): run_logic()
	if Input.is_action_pressed("crouch"): crouch_logic()
	if Input.is_action_just_pressed("jump"): jump_logic()
	
	var direction: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	
	var target_velocity = basis * Vector3(direction.x, 0, direction.y) * speed
	
	var friction = floor_friction if on_floor else air_friction
	
	velocity.x = move_toward(velocity.x, target_velocity.x, friction)
	velocity.z = move_toward(velocity.z, target_velocity.z, friction)


func idle_logic() -> void:
	pass


func walk_logic() -> void:
	speed = walking_speed if on_floor else speed


func run_logic() -> void:
	speed = running_speed if on_floor else speed


func crouch_logic() -> void:
	speed = crouching_speed if on_floor else speed


func jump_logic() -> void:
	if on_floor: velocity.y += jumping_velocity
#endregion
