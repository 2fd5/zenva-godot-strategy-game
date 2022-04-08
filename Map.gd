extends Node

var allTiles : Array
var tilesWithBuildings : Array 
var tileSize : float = 64.0

func _ready():
	allTiles = get_tree().get_nodes_in_group("Tiles")
	# find start tiles.
	for x in range(allTiles.size()):
		if allTiles[x].startTile == true:
			place_building(allTiles[x], BuildingData.base.iconTexture)

func get_tile_at_positon(position):
	for x in range(allTiles.size()):
		if allTiles[x].position == position and allTiles[x].hasBuilding == false:
			return allTiles[x]
	return null
	
	
func disable_tile_highlights():
	for x in range(allTiles.size()):
		 allTiles[x].toggle_highlight(false)

func higlight_available_tiles():
	for x in range(tilesWithBuildings.size()):
		var northTile = get_tile_at_positon(tilesWithBuildings[x].position + Vector2(0, tileSize))
		var southTile = get_tile_at_positon(tilesWithBuildings[x].position + Vector2(0, -tileSize))
		var eastTile = get_tile_at_positon(tilesWithBuildings[x].position + Vector2(tileSize, 0))
		var westTile = get_tile_at_positon(tilesWithBuildings[x].position + Vector2(-tileSize, 0))
		if northTile != null :
			northTile.toggle_highlight(true)
		if southTile != null :
			southTile.toggle_highlight(true)
		if eastTile != null :
			eastTile.toggle_highlight(true)
		if westTile != null :
			westTile.toggle_highlight(true)
		
# place building on the map
func place_building(tile, texture):
	tilesWithBuildings.append(tile)
	tile.place_building(texture)
	
	disable_tile_highlights()
