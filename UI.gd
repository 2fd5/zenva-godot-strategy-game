extends Control

onready var buildingButtons : Node = get_node("BuildingButtons")
onready var foodMetalText : Label = get_node("FoodMetalText")
onready var oxygenEnergyText : Label = get_node("OxygenEnergyText")
onready var currentTurnText : Label = get_node("TurnText")
onready var gameManager : Node = get_node("/root/MainScene")

func on_end_turn():
	currentTurnText.text = "Turn: " + str(gameManager.currentTurn)
	buildingButtons.visible = true
	
func update_resource_text():
	var foodMetal = ""
	foodMetal += str(gameManager.currentFood) + " (" + ("+" if gameManager.foodPerTurn >= 0 else "") + str(gameManager.foodPerTurn) + ")\n"
	foodMetal += str(gameManager.currentMetal) + " (" + ("+" if gameManager.metalPerTurn >= 0 else "") + str(gameManager.metalPerTurn) + ")"
	foodMetalText.text = foodMetal
	
	var oxygenEnergy = ""
	oxygenEnergy += str(gameManager.currentOxygen) + " (" + ("+" if gameManager.oxygenPerTurn >= 0 else "") + str(gameManager.oxygenPerTurn) + ")\n"
	oxygenEnergy += str(gameManager.currentEnergy) + " (" + ("+" if gameManager.energyPerTurn >= 0 else "") + str(gameManager.energyPerTurn) + ")"
	oxygenEnergyText .text = oxygenEnergy

func _on_EndTurnButton_pressed():
	gameManager.end_turn()

func _on_MineButton_pressed():
	buildingButtons.visible = false
	gameManager.on_select_building(1)

func _on_GreenhouseButton_pressed():
	buildingButtons.visible = false
	gameManager.on_select_building(2)

func _on_SolarPanelButton_pressed():
	buildingButtons.visible = false
	gameManager.on_select_building(3)
