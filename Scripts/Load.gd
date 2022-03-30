extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var config = ConfigFile.new()
	var err = config.load("user://game.cfg")

	if err != OK:
		print("Error loading game save")
	
	# Load player settings
	if config.get_value("Player", "position") != null:
		get_parent().get_node("Player").position = config.get_value("Player", "position")
	if config.get_value("Player", "current_area") != null:
		get_parent().get_node("Player").currentArea = config.get_value("Player", "current_area")
	
	# Load camera settings
	if config.get_value("Camera", "limit_top") != null:
		get_parent().get_node("Camera2D").limit_top = config.get_value("Camera", "limit_top")
	if config.get_value("Camera", "limit_left") != null:
		get_parent().get_node("Camera2D").limit_left = config.get_value("Camera", "limit_left")
	if config.get_value("Camera", "limit_right") != null:
		get_parent().get_node("Camera2D").limit_right = config.get_value("Camera", "limit_right")
	if config.get_value("Camera", "limit_bottom") != null:
		get_parent().get_node("Camera2D").limit_bottom = config.get_value("Camera", "limit_bottom")
	if config.get_value("Camera", "zoom_x") != null:
		get_parent().get_node("Camera2D").zoom.x = config.get_value("Camera", "zoom_x")
	if config.get_value("Camera", "zoom_y") != null:
		get_parent().get_node("Camera2D").zoom.y = config.get_value("Camera", "zoom_y")
	
	# Load music settings
	if config.get_value("Music", "currently_playing") != null:
		var song = config.get_value("Music", "currently_playing")
		print("Playing: " + song)
		get_parent().get_node(song).play()
	else:
		if get_parent().get_node("Player").currentArea == "player_house":
			get_parent().get_node("Camera2D/Music/Home Song").play()
		if get_parent().get_node("Player").currentArea == "hometown":
			get_parent().get_node("Camera2D/Music/Hometown Song").play()
		if get_parent().get_node("Player").currentArea == "route_1":
			get_parent().get_node("Camera2D/Music/Route1").play()
	
	print("Game loaded successfully")
