extends Node


const APP_ID: int = 1401222024478851244


var details: String = "Twisted Team's take on ULB"
var state: String = "Hello, World!"

var large_image: String = "icon-temp"
var large_image_text: String = "Available on GameJolt"

var small_image: String = ""
var small_image_text: String = ""


func _ready() -> void:
	update()


func update() -> void:
	DiscordRPC.app_id = APP_ID
	DiscordRPC.details = details
	DiscordRPC.state = state
	DiscordRPC.large_image = large_image
	DiscordRPC.large_image_text = large_image_text
	DiscordRPC.small_image = small_image
	DiscordRPC.small_image_text = small_image_text
	
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	# DiscordRPC.end_timestamp = int(Time.get_unix_time_from_system()) + 3600 # +1 hour in unix time / "01:00:00 remaining"
	
	DiscordRPC.refresh()
