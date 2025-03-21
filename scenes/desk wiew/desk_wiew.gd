extends Node2D

@onready var news = preload("res://scenes/desk wiew/newspaper.tscn")
@onready var let= preload("res://scenes/desk wiew/letter.tscn")
@onready var doc = preload("res://scenes/desk wiew/document.tscn")



func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/office/office.tscn")

func _ready():
	var zoom = Callable(self, "item_zoomed")
	var unzoom = Callable(self, "item_unzoomed")
	
	for x in globals.desk_items[globals.current_day]:
		if x == "newspaper":
			var newspaper = news.instantiate()
			add_child(newspaper)
			newspaper.global_position = $newspaper_spawn.global_position
			newspaper.zoomed.connect(zoom)
			newspaper.unzoomed.connect(unzoom)
			
		elif x == "letter":
			var letter = let.instantiate()
			add_child(letter)
			letter.global_position = $letter_spawn.global_position
			letter.zoomed.connect(zoom)
			letter.unzoomed.connect(unzoom)
			
		elif x == "document":
			var document = doc.instantiate()
			add_child(document)
			document.global_position = $document_spawn.global_position

func item_zoomed():
	$cover.show()
	
func item_unzoomed():
	$cover.hide()
