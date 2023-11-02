class_name Game
extends Node2D

const player_definition: EntityDefinition = preload("res://assets/definitions/entities/actors/EntityDefinitionPlayer.tres")

@onready var player: Entity
@onready var event_handler: EventHandler = $EventHandler
@onready var entities: Node = $Entities
@onready var map: Map = $Map

func _ready() -> void:
	player = Entity.new(Vector2i.ZERO, player_definition)
	entities.add_child(player)
	map.generate(player)

func get_map_data() -> MapData:
	return map.map_data

func _physics_process(delta) -> void:
	var action: Action = event_handler.get_action()
	if action:
		action.perform(self, player)
