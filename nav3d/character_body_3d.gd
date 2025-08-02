extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var node_3d: Node3D = $"../Node3D"

func _ready() -> void:
	node_3d.connect("mouse_clicked", on_mouse_clicked)

func _physics_process(delta: float) -> void:
	move_towards_target()
	move_and_slide()


func move_towards_target() -> void:	
	if navigation_agent_3d.is_navigation_finished():
		velocity = Vector3.ZERO
		return
	
	var direction = global_position.direction_to(navigation_agent_3d.get_next_path_position())
	velocity = direction * 5


func on_mouse_clicked(point: Vector3) -> void:
	navigation_agent_3d.target_position = point
