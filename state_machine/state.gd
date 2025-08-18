extends Node
class_name State

signal change_state(state_name: String)

func enter() -> void: pass
func update(delta: float) -> void: pass
func physics_update(delta: float) -> void: pass
func exit() -> void: pass
