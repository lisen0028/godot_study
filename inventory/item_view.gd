extends Node2D

@export var item_id = "" #要展示的物品
@export var source_object_id=""  #物品来自哪个容器

@onready var sprite = $Sprite2D

@onready var area=$Area2D


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
	var res = GameState.take_content(source_object_id)
	#将box中key的content_taken修改为true
	if res:
		queue_free()
