extends Node2D

func _ready() -> void:
	
	print("Room2启动")
	print("GameState.has_key:", GameState.has_key)
	print("GameState.box_opened:", GameState.box_opened)
	print("GameState.key_taken:", GameState.key_taken)
	print("GameState.door_opened:", GameState.door_opened)
