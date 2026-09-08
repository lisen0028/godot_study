extends Node2D

@export var object_id="room1_box"
@onready var sprite = $Sprite2D
@onready var interaction = $Interaction

var open_texture = preload("res://R.png")
var close_texture = preload("res://OIP.webp")

func _ready() -> void:
	interaction.interacted.connect(_on_interacted)
	GameState.box_opened_changed.connect(_on_box_changed)
	refresh()

func _on_box_changed(change_id):
	if change_id == object_id:
		refresh()
	

func refresh():
	var opened = GameState.get_object_state(
		object_id,
		"opened"
	)

	if opened:
		sprite.texture=open_texture
	else:
		sprite.texture=close_texture
	
func _on_interacted(action):
	if action == "open_box" :
		GameState.toggle_object_state(object_id)
	elif action =="":
		pass
	
