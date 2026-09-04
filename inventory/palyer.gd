extends Node2D

#玩家背包
var inventory=[]

signal inventory_changed 

func _ready():
	GameState.player = self

func add_item(item):
	if item in inventory:
		return

	inventory.append(item)
	inventory_changed.emit()

func remove_item(item):
	if item not in inventory:
		return

	inventory.erase(item)
	inventory_changed.emit()

func has_item(item):
	return item in inventory
