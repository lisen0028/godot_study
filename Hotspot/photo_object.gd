extends Node2D

@export var object_id="room1_photo"


@onready var sprite=$Sprite2D
@onready var interaction=$Interaction

func _ready():
	interaction.interacted.connect(
		_on_interacted
	)



func _on_interacted(action):
	if action=="inspect":
		print("查看照片")
