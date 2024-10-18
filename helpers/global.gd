extends Node

# openlabserver is 30.30.28.52
var host_ip = "localhost"
# for smithing mini game
var ores_inside:int = 0

# for snekkers battle scene
var Enemy_HP = 100
var Current_HP = 100
var Question = false
var tilemap: TileMapLayer

# tutorial
var has_done_same_denum_tutorial: bool = false
var has_done_diff_denum_tutorial: bool = false
