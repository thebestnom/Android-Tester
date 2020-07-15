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
	if event is InputEventMouseButton:
		$Label.text = "clicked {clicked} double {doubleclick} factor {factor} button mask {button_mask} button index {button_index}".\
			format({"clicked": event.pressed, "doubleclick": event.doubleclick, "factor": event.factor, "button_mask": event.get_button_mask(), "button_index": event.get_button_index()})
		if event.pressed:
			$Label3.text = "{button} was pressed".format({"button": event.button_index})
			
	if event is InputEventMouseMotion:
		$Label2.text = "button mask {button_mask}".\
			format({"button_mask": event.get_button_mask()})
	if event is InputEventKey:
		$Label4.text = "keyboard click {key} {clicked} shift: {shift} alt: {alt} ctrl: {ctrl}".\
			format({"clicked": event.pressed, "key": event.keycode, \
			 "shift": event.shift, "alt": event.alt, "ctrl": event.control})
