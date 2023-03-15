extends Area2D





func _on_Collector_area_entered(area : Area2D):
	if area.is_in_group("DreamCells"):
		PlayerDreamCells.take_dream_cell(area.dream_cell_value)
	
	area.queue_free()
