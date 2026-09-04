extends Node2D

@export var item_id = ""

@onready var sprite = $Sprite2D

@onready var area=$Area2D

@export var source_object_id=""  #物品来自哪个容器

func _ready():
	area.clicked.connect(take_item)

func show_item(id,object_id):
	item_id = id
	source_object_id = object_id
	print("$Sprite2D:",sprite)
	load_texture()

func load_texture():
	match item_id:
		"key":
			sprite.texture = preload("res://key.webp")
		"photo":
			sprite.texture = preload("res://photo.png")

func take_item():
	GameState.player.add_item(item_id)
	GameState.set_object_state(source_object_id,"content_taken",true)
	#将box中key的content_taken修改为true
	queue_free()
