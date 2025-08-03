extends Node2D

# this is to storage the aniamtions i think? --- hi cucas im asking to chatgpt for it to teach me
@onready var head_sprite: AnimatedSprite2D = $SansHead
@onready var torso_sprite: AnimatedSprite2D = $SansTorso
@onready var legs_sprite: AnimatedSprite2D = $SansLegs

func _ready():
	# testing if this shit works
	change_animation("head", "blueEye")
	change_animation("torso", "default")
	change_animation("legs", "default")

# change animation on a selected part
func change_animation(part: String, anim_name: String) -> void:
	match part:
		"head":
			if head_sprite.frames.has_animation(anim_name):
				head_sprite.play(anim_name)
			else:
				push_warning("Animation '%s' not found in SansHead." % anim_name)
		"torso":
			if torso_sprite.frames.has_animation(anim_name):
				torso_sprite.play(anim_name)
			else:
				push_warning("Animation '%s' not found in SansTorso." % anim_name)
		"legs":
			if legs_sprite.frames.has_animation(anim_name):
				legs_sprite.play(anim_name)
			else:
				push_warning("Animation '%s' not found in SansLegs." % anim_name)
		_:
			push_warning("Unknown part: %s" % part)

# change multiple at once
func set_full_animation(head_anim: String, torso_anim: String, legs_anim: String) -> void:
	change_animation("head", head_anim)
	change_animation("torso", torso_anim)
	change_animation("legs", legs_anim)
