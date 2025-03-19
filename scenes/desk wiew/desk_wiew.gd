extends Node2D

@onready var newspaper = preload("res://scenes/desk wiew/newspaper.tscn")
@onready var letter = preload("res://scenes/desk wiew/letter.tscn")
#@onready var document = preload("res://scenes/desk wiew/document.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/office/office.tscn")

func _ready():
	var news = newspaper.instantiate()
	var lett = letter.instantiate()
	for x in globals.desk_items[globals.current_day]:
		if x == "newspaper":
			add_child(news)
			news.global_position = $newspaper_spawn.global_position
		elif x == "letter":
			add_child(lett)
			lett.global_position = $letter_spawn.global_position
