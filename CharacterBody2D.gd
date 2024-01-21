extends CharacterBody2D

@export var Bullet : PackedScene

func shoot():
	var b = Bullet.instantiate()
	get_tree().root.add_child(b)
	b.transform = $Marker2D.global_transform

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if input_vector:
		if Input.get_action_strength("shift"):
			velocity = input_vector * 150
		else:
			velocity = input_vector * 250
	else:
		velocity = input_vector
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
