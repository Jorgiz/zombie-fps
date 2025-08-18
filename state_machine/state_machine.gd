extends Node
class_name StateMachine

var states: Dictionary [String, State]
var current_state: State


func _ready() -> void:
	for state in get_children():
		states.set(state.name.to_lower(), state)
		state.connect("change_state", on_change_state)
	
	if states.is_empty():
		push_error("State Machine has no States as childs")
		return
	
	current_state = states.values()[0]
	current_state.enter()
	print(current_state)


func _process(delta: float) -> void:
	current_state.update(delta)


func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)


func on_change_state(state_name: String) -> void:
	state_name = state_name.to_lower()
	
	if state_name == current_state.name: return
	if not states.get(state_name): return
	
	current_state.exit()
	current_state = states.get(state_name)
	current_state.enter()
	print(current_state)
