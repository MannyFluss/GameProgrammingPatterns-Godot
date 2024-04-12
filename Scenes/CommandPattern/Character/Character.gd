extends Node2D
class_name MovementCharacter


func moveTo(destination : Vector2)->void:
	var myTween : Tween = get_tree().create_tween()
	myTween.tween_property(self,"position",destination,.3).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
	
	
