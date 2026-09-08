extends Node

signal interacted #这个对象发生交互。

@onready var hotspot = $"Hotspot"

@export var action = "open_box"

func _ready():
	hotspot.clicked.connect(_on_clicked)


func _on_clicked():
	interacted.emit(action)
