extends Node2D
class_name EvilItem

enum Target {HAND, FACE, BOTH}
@export var targets: Target = Target.HAND
@export var range: float = 20.0
@export var active: bool = true
@export var player: CharacterBody3D
@export var damage: int = 3

func _physics_process(delta: float) -> void:
	if not active:
		return
	
	if get_global_mouse_position().distance_to(global_position) < range:
		player.hp -= damage
		queue_free()
