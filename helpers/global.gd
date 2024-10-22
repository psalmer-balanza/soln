extends Node

# openlabserver is 30.30.28.52
var host_ip = "localhost"

# to know if the game is on online or offline mode
var is_online = false # set to true if student logs into online mode

# for smithing mini game
var ores_inside:int = 0

# for snekkers battle scene
var Enemy_HP = 100
var Current_HP = 100
var Question = false
var tilemap: TileMapLayer
var total_score

var user_energy = 3

# tutorial
var is_simplified_tutorial: bool = false
