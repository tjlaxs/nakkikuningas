class_name Game
extends Node2D

signal player_created(player: Entity)

const player_definition: EntityDefinition = preload("res://assets/definitions/entities/actors/EntityDefinitionPlayer.tres")

@onready var player: Entity
@onready var input_handler: InputHandler = $InputHandler
@onready var map: Map = $Map
@onready var camera: Camera2D = $Camera2D

func _ready() -> void:
	player = Entity.new(null, Vector2i.ZERO, player_definition)
	player_created.emit(player)
	remove_child(camera)
	player.add_child(camera)
	map.generate(player)
	map.update_fov(player.grid_position)
	MessageLog.send_message.bind(
		"Welcome to the dark dungeons!",
		GameColors.WELCOME_TEXT
	).call_deferred()

func get_map_data() -> MapData:
	return map.map_data

func _physics_process(_delta) -> void:
	var action: Action = input_handler.get_action(player)
	if action:
		var previous_player_position: Vector2i = player.grid_position
		action.perform()
		if player.grid_position != previous_player_position:
			map.update_fov(player.grid_position)
		_handle_enemy_turns()

func _handle_enemy_turns() -> void:
	for entity in get_map_data().get_actors():
		if entity.is_alive() and entity != player:
			entity.ai_component.perform()
