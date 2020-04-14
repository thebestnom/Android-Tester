extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if(event is InputEventMouseButton):
		$Label.text = "double {doubleclick} factor {factor} button mask {button_mask} button index {button_index}".\
			format({"doubleclick": event.doubleclick, "factor": event.factor, "button_mask": event.get_button_mask(), "button_index": event.get_button_index()})
	if(event is InputEventMouseMotion):
		$Label2.text = "button mask {button_mask}".\
			format({"button_mask": event.get_button_mask()})
