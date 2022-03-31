extends Node2D

var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("UI/GUI/PauseMenu/CenterContainer/VBoxContainer/SaveBtn").connect("pressed", self, "save_state")

func save_state():
	# Save player settings
	config.set_value("Player", "position", get_parent().get_node("Player").position)
	config.set_value("Player", "current_area", get_parent().get_node("Player").currentArea)
	
	# Save camera settings
	config.set_value("Camera", "limit_top", get_parent().get_node("Camera2D").limit_top)
	config.set_value("Camera", "limit_left", get_parent().get_node("Camera2D").limit_left)
	config.set_value("Camera", "limit_right", get_parent().get_node("Camera2D").limit_right)
	config.set_value("Camera", "limit_bottom", get_parent().get_node("Camera2D").limit_bottom)
	config.set_value("Camera", "pos", get_parent().get_node("Camera2D").position)
	config.set_value("Camera", "zoom_x", get_parent().get_node("Camera2D").zoom.x)
	config.set_value("Camera", "zoom_y", get_parent().get_node("Camera2D").zoom.y)
	
	# Save music settings
	if get_parent().get_node("Player").currentArea == "hometown":
		config.set_value("Music", "currently_playing", get_parent().get_node("Camera2D/Music/Hometown Song").get_path())
	elif get_parent().get_node("Player").currentArea == "player_house" || get_parent().get_node("Player").currentArea == "player_room":
		config.set_value("Music", "currently_playing", get_parent().get_node("Camera2D/Music/Home Song").get_path())
	elif get_parent().get_node("Player").currentArea == "route_1":
		config.set_value("Music", "currently_playing", get_parent().get_node("Camera2D/Music/Route1").get_path())
	
	config.save("user://game.cfg")
	print("Game Saved")
	
	get_parent().get_node("UI/GUI/PauseMenu/CenterContainer/VBoxContainer/SaveBtn").text = "Game Saved"
