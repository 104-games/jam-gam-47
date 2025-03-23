extends Node

func _process(_delta):
	var current_scene = get_tree().current_scene
	if current_scene:
		var root_name = current_scene.name
		if root_name == "office":
			
			FmodServer.set_global_parameter_by_name("AmbienceVolume", 1)
			FmodServer.set_global_parameter_by_name("AmbienceFilter", 0)
		elif root_name == "desk_wiew":
			
			FmodServer.set_global_parameter_by_name("AmbienceVolume", 0.8)
			FmodServer.set_global_parameter_by_name("AmbienceFilter", 0)
		elif root_name == "pc_wiew":
			
			FmodServer.set_global_parameter_by_name("AmbienceVolume", 0.8)
			FmodServer.set_global_parameter_by_name("AmbienceFilter", 0.7)
		else:
			FmodServer.set_global_parameter_by_name("AmbienceVolume", 0)
			FmodServer.set_global_parameter_by_name("AmbienceFilter", 0)
			
	else:
		pass
	
	
