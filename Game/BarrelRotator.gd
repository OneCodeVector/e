extends Node2D

@export var Bullet : Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Shoot():
	var NewBullet = Bullet.duplicate()
	NewBullet.transform = global_transform
	get_parent().get_parent().add_child(NewBullet)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
var ShotDelay = 1
var ShotDebounce = 0
func _process(delta):
	look_at(get_global_mouse_position())
	ShotDebounce -= delta
	if Input.is_action_just_pressed("ui_accept") and ShotDebounce <= 0:
		Shoot()
		ShotDebounce = ShotDelay
		
	pass
