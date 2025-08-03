extends Enemy

# this is to storage the aniamtions i think? --- hi cucas im asking to chatgpt for it to teach me
# that's ok dude - just use "Access as Unique Nickname" next time ;)
@onready var head_sprite: AnimatedSprite2D = %Head
@onready var torso_sprite: AnimatedSprite2D = %Torso
@onready var legs_sprite: AnimatedSprite2D = %Legs


func _ready():
	# testing if this shit works
	#change_animation("head", "blueEye")
	#change_animation("torso", "default")
	#change_animation("legs", "default")
	
	# Change the "Autoplay on Load" property of an animation (next to the
	# loop button) to set it as the default animation.
	
	# Remove this useless code once you read it, please.
	
	pass


# Change animation on a selected part
func change_animation(part: String, anim_name: String) -> void:
	match part:
		"head":
			if head_sprite.sprite_frames.has_animation(anim_name):
				head_sprite.play(anim_name)
			else:
				push_warning("Animation '%s' not found in Sans Head." % anim_name)
		
		"torso":
			if torso_sprite.sprite_frames.has_animation(anim_name):
				torso_sprite.play(anim_name)
			else:
				push_warning("Animation '%s' not found in Sans Torso." % anim_name)
		
		"legs":
			if legs_sprite.sprite_frames.has_animation(anim_name):
				legs_sprite.play(anim_name)
			else:
				push_warning("Animation '%s' not found in Sans Legs." % anim_name)
		
		_:
			push_warning("Unknown part: %s" % part)


# Change multiple at once
func set_full_animation(head_anim: String, torso_anim: String, legs_anim: String) -> void:
	change_animation("head", head_anim)
	change_animation("torso", torso_anim)
	change_animation("legs", legs_anim)
