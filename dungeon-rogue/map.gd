extends Node2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
var floor_tile := Vector2i(0,0)


func _ready() -> void:
	var tile_position=Vector2i(-36,-20.5)
	for v1 in range(41):
		
		for v2 in range(72):
			tile_map_layer.set_cell(tile_position,4,floor_tile)
			tile_position += Vector2i(1,0)
		tile_position = Vector2i(-36, tile_position.y + 1)
