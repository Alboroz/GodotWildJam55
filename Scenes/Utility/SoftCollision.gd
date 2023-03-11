extends Area2D

#set a collision layer and mask for this specific collision that
#is useful to make enemies not intersect with each other

func is_colliding():
	var areas = get_overlapping_areas()
	return areas.size() > 0

func get_push_vector() -> Vector2:
	var areas = get_overlapping_areas()
	var push_vector := Vector2.ZERO
	if is_colliding():
		var area = areas[0]
		push_vector = area.global_position.direction_to(global_position)
		push_vector = push_vector.normalized()
	return push_vector
