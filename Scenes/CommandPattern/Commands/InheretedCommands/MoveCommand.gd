extends Command
class_name MoveCommand

var previousPosition : Vector2
var destination : Vector2
var unit : MovementCharacter

func _init(_unit : MovementCharacter, _destination : Vector2) -> void:
	destination = _destination
	unit = _unit
	previousPosition = unit.position
	
func _execute()->void:
	unit.moveTo(destination)

func _undo()->void:
	unit.moveTo(previousPosition)
