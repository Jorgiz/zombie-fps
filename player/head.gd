extends Node3D

@export var head: Node3D

var sensibility: float = .2


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
	self.global_position = head.global_position


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.rotation_degrees.y -= event.relative.x * sensibility
		self.rotation_degrees.x -= event.relative.y * sensibility
		self.rotation_degrees.x = clamp(self.rotation_degrees.x, -80, 80)
