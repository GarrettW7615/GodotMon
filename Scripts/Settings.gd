extends Control

func _ready():
	if OS.vsync_enabled == true:
		$Background/CenterContainer/VBoxContainer/VsyncBtn.pressed = true
	if OS.window_fullscreen == true:
		$Background/CenterContainer/VBoxContainer/FullscreenBtn.pressed = true
	
	$Background/CenterContainer/VBoxContainer/VolumeSlider.value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	
	$Background/CenterContainer/VBoxContainer/VsyncBtn.connect("toggled", self, "_on_VsyncBtn_toggled")
	$Background/CenterContainer/VBoxContainer/FullscreenBtn.connect("toggled", self, "_on_FullscreenBtn_toggled")
	$Background/CenterContainer/VBoxContainer/VolumeSlider.connect("value_changed", self, "_on_VolumeSlider_value_changed")

func _on_VsyncBtn_toggled(button_pressed):
	OS.vsync_enabled = !OS.vsync_enabled

func _on_FullscreenBtn_toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen

func _on_VolumeSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), $Background/CenterContainer/VBoxContainer/VolumeSlider.value)
