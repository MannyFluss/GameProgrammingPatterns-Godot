extends Command
class_name SwapCharacterCommand


var inputManager : CommandInputManager
var previousSelectedUnit : MovementCharacter
var selectedUnit : MovementCharacter

func _init(_unit : MovementCharacter, _inputManager : CommandInputManager) -> void:
	previousSelectedUnit = _inputManager.targetCharacter
	selectedUnit = _unit
	inputManager = _inputManager

	
	
func _execute()->void:
	inputManager.swapControl(selectedUnit)
	pass
func _undo()->void:
	inputManager.swapControl(previousSelectedUnit)
	pass
