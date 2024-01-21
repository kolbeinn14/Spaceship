extends Area2D


var bullet_speed = 750;

func _physics_process(delta):
	position += transform.x * bullet_speed * delta;

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()

