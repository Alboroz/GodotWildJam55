extends Node

signal dream_cells_changed(new_amount)
signal max_dream_cells_reached()

var dream_cells := 0
export(int) var max_dream_cells := 20

func reset_dream_cells():
	dream_cells = 0
	emit_signal("dream_cells_changed", dream_cells)

func take_dream_cell(amount):
	dream_cells += amount
	dream_cells = min(dream_cells, max_dream_cells)
	emit_signal("dream_cells_changed", dream_cells)
	if dream_cells == max_dream_cells:
		emit_signal("max_dream_cells_reached")
