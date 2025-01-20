extends Node2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
var floor_tile := Vector2i(0,0)
var wall_tile := Vector2i(1,2)

func _ready() -> void:
	var tile_position=Vector2i(-14,-7)
	var wall_tile_position=Vector2i(-14,-8)
	for v1 in range(15):
		
		for v2 in range(28):
			tile_map_layer.set_cell(tile_position,1,floor_tile)
			tile_position += Vector2i(1,0)
		tile_position = Vector2i(-14, tile_position.y + 1)
		
	for v3 in range(28):
		tile_map_layer.set_cell(wall_tile_position,1,wall_tile)
		wall_tile_position+=Vector2i(1,0)
		
	wall_tile_position = Vector2i(-14,8)
	for v3 in range(28):
		
		tile_map_layer.set_cell(wall_tile_position,1,wall_tile)
		wall_tile_position+=Vector2i(1,0)
		
