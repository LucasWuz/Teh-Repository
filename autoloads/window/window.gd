extends Node


# Hey Lucas, this is one of those codes you write it once and never
# touch it again, so don't worry about anything that is going on here.
# But feel free to try to understand it - I tried my best to make
# the code self-documented.


signal fullscreen_toggled(is_fullscreen: bool)
signal aspect_ratio_changed(new_ratio: AspectRatios)


enum AspectRatios {
	DEFAULT, # 16:9
	CLASSIC # Goofy ahh 4:3
}


const VIEWPORT_SIZES: Dictionary[AspectRatios, Vector2i] = {
	AspectRatios.DEFAULT: Vector2i(1072, 603), # I know it sucks but it works
	AspectRatios.CLASSIC: Vector2i(804, 603),
}

const WINDOW_SIZES: Dictionary[AspectRatios, Vector2i] = {
	AspectRatios.DEFAULT: Vector2i(1280, 720),
	AspectRatios.CLASSIC: Vector2i(960, 720),
}


var aspect_ratio: AspectRatios = AspectRatios.DEFAULT


func _input(event: InputEvent) -> void:
	# F4, F11 or ALT + Enter
	if event.is_action_pressed(&"toggle_fullscreen"):
		toggle_fullscreen()
	
	# F3 because F1 and F2 are my OBS bindings
	elif event.is_action_pressed(&"toggle_aspect_ratio"):
		toggle_aspect_ratio()


func toggle_fullscreen() -> void:
	var is_fullscreen: bool = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	fullscreen_toggled.emit(is_fullscreen)


func toggle_aspect_ratio() -> void:
	var cur_win_size: Vector2i = get_window().content_scale_size
	
	if aspect_ratio == AspectRatios.DEFAULT:
		aspect_ratio = AspectRatios.CLASSIC
	else:
		aspect_ratio = AspectRatios.DEFAULT
	
	DisplayServer.window_set_size(WINDOW_SIZES[aspect_ratio])
	
	get_window().content_scale_size = VIEWPORT_SIZES[aspect_ratio]
	get_window().position += Vector2i((cur_win_size - get_window().content_scale_size) / 2.0)
	get_viewport().get_camera_2d()
	
	aspect_ratio_changed.emit(aspect_ratio)
