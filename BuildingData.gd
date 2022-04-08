extends Node

enum BUILDING {BASE=0, MINE, GREENHOUSE, SOLARPANEL}
enum RESOURCE {NONE, FOOD = 1, METAL=2, OXYGEN=3, ENERGY=4}

var base = Building.new(BUILDING.BASE, preload("res://Sprites/Base.png"), RESOURCE.NONE, 0, RESOURCE.NONE, 0)
var mine = Building.new(BUILDING.MINE, preload("res://Sprites/Mine.png"), RESOURCE.METAL, 1, RESOURCE.ENERGY, 1)
var greenhouse = Building.new(BUILDING.GREENHOUSE, preload("res://Sprites/Greenhouse.png"), RESOURCE.FOOD, 1, RESOURCE.NONE, 0)
var solarpanel = Building.new(BUILDING.SOLARPANEL, preload("res://Sprites/SolarPanel.png"), RESOURCE.ENERGY, 1, RESOURCE.NONE, 0)

class Building:
	# building type
	var type : int
	
	# building texture
	var iconTexture : Texture
	
	# resource that building produces
	# 0 - produce nothing
	var prodResource : int = 0
	var prodResourceAmount : int
	# resource the building needs to be mentained
	var upkeepResource : int = 0
	var upkeepResourceAmount : int
	func _init(type, iconTexture, prodResource, prodResourceAmount, upkeepResource, upkeepResourceAmount):
		self.type = type
		self.iconTexture = iconTexture
		self.prodResource = prodResource
		self.prodResourceAmount = prodResourceAmount
		self.upkeepResource = upkeepResource
		self.upkeepResourceAmount = upkeepResourceAmount
