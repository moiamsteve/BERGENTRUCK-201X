extends Item
class_name ItemSword

func _physics_process(delta: float) -> void :
	if lifetime <= 0 and lifetime != -1.0:
		use()

	if $DraggableItem.drag:
		global_position = player.hand.global_position
		#$DraggableItem.global_position = player.hand.global_position
		global_rotation = player.hand.global_rotation
		#$DraggableItem.global_rotation = player.hand.global_rotation*2
	else:
		pass
		#$DraggableItem.global_position = global_position
		#$DraggableItem.global_rotation = global_rotation

func _on_input_event(event: InputEvent) -> void :
	if event is InputEventMouseButton:
		var new_event = event
		print("GLOBAL POSITION ", global_position, "  GLOBAL MOUSE POSITION ", get_global_mouse_position())
		new_event.position = get_global_mouse_position()
		$DraggableItem / MouseDragComponent.object_held_down(event)
