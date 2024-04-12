extends Resource
class_name Command

#base class to inheret all commands from'

func _init() -> void:
	if has_method("_execute")==false:assert(false,"Missing _execute() implementation")
	if has_method("_undo")==false:assert(false,"Missing _undo() implementation")
	


#GD script does not allow overridable signatures

#func _execute()->void:
	#
	#
#
#func _undo()->void:
	#assert(false,"Missing _undo() implementation")
	#
