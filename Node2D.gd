extends Node2D

var all_events = []
var capture = false

func _input(event):
	$Label.text = ""
	all_events.append(event)
	if all_events.size() > 10:
		all_events.pop_front()
	var text = "";
	var e = null;
	var i = 0;
	while i < all_events.size():
		e = all_events[i]
		if e is InputEventMouseButton:
			text = "clicked {clicked} double {doubleclick} factor {factor} button mask {button_mask} button index {button_index}".\
				format({"clicked": e.pressed, "doubleclick": e.doubleclick, "factor": e.factor, "button_mask": e.get_button_mask(), "button_index": e.get_button_index()})
		if e is InputEventMouseMotion:
			text = "button mask {button_mask}".\
				format({"button_mask": e.get_button_mask()})
		if e is InputEventKey:
			text = "keyboard click {key} {clicked} shift: {shift} alt: {alt} ctrl: {ctrl}".\
				format({"clicked": e.pressed, "key": e.keycode, \
					"shift": e.shift, "alt": e.alt, "ctrl": e.control})
		$Label.text += "\n %s" % text
		i += 1
	if event is InputEventMouseButton and event.doubleclick and capture:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Button_pressed():
	capture = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
