extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_input_manager_command_added(command: Command) -> void:
	if command is MoveCommand:
		var newItem : Button = $Control/DupeMe.duplicate()
		newItem.text = "move to " + (str(command.destination)) + "\n from " + (str(command.previousPosition))
		$Control/MarginContainer/VBoxContainer.add_child(newItem)
	if command is SwapCharacterCommand:
		var newItem : Button = $Control/DupeMe.duplicate()
		newItem.text = "swap to " + str(command.selectedUnit) + "\n from " + (str(command.previousSelectedUnit))
		$Control/MarginContainer/VBoxContainer.add_child(newItem)
		
	


func _on_input_manager_command_removed(command: Command) -> void:
	
	var count : int = $Control/MarginContainer/VBoxContainer.get_child_count()
	if count >0:
		$Control/MarginContainer/VBoxContainer.get_child(count-1).queue_free()
	pass # Replace with function body.
