extends Node

#它代表了一个 Object 实例的信号
#信号允许所有已连接的 Callable（以及它们各自所属的对象）去监听并响应事件，而无需彼此之间直接引用。
signal box_opened_changed # box状态变化信号
signal key_taken_changed # key的拿取状态变化信号
signal has_key_changed # key的拥有状态变化信号
signal door_opened_changed # door状态变化信号

var has_key = false
var box_opened = false
var key_taken = false
var door_opened = false

func take_key():
	if key_taken :
		return
	#状态变化
	has_key = true
	key_taken = true
	
	#通知其他状态变化
	key_taken_changed.emit()
	has_key_changed.emit()
	
