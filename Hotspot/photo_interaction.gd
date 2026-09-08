extends Node

signal interacted

@onready var hotpot = $Hotspot

@export var action = "inspect"

func _ready() -> void:
	hotpot.clicked.connect(_on_clicked)
	
func _on_clicked():
	interacted.emit(action)
	
