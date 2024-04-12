extends Node
class_name CommandInputManager

@export
var targetCharacters : Array[MovementCharacter] = []


@onready
var targetCharacter : MovementCharacter = targetCharacters[0]


	

var commandStack : Array[Command] = []

signal commandAdded(command : Command)
signal commandRemoved(command : Command)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		var newCommand : MoveCommand = MoveCommand.new(targetCharacter,event.position)
		commandStack.push_front(newCommand)
		newCommand._execute()
		emit_signal("commandAdded",newCommand)
		
	if event.is_action_pressed("right_click"):
		var currCommand : Command = commandStack.pop_front()
		if currCommand!=null:
			currCommand._undo()
			emit_signal("commandRemoved",currCommand)
			
	if event.is_action_pressed("tab"):
		#idk why modulo wasnt working
		var targetIndex : int = targetCharacters.find(targetCharacter)+1
		if targetIndex > (targetCharacters.size()-1):
			targetIndex = 0
		
		var nextCharacter : MovementCharacter = targetCharacters[targetIndex]
		var newCommand : SwapCharacterCommand = SwapCharacterCommand.new(nextCharacter,self)
		commandStack.push_front(newCommand)
		newCommand._execute()
		emit_signal("commandAdded",newCommand)
		
		
	
func swapControl(nextCharacter : MovementCharacter)->void:
	targetCharacter = nextCharacter
