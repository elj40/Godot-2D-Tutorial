extends KinematicBody2D


const GRAVITY = 10;
const SPEED = 30;

var velocity = Vector2()
var direction = 1
var is_dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("Dead")
	$CollisionShape2D.set_deferred("disabled", true);
	$Timer.start()

func _physics_process(delta):
	if not is_dead:
		velocity.x = SPEED * direction
		$AnimatedSprite.play("Walk")
		velocity.y += GRAVITY
		
		velocity = move_and_slide(velocity, Vector2.UP)
		
		if is_on_wall():
			direction *= -1
			$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		
		if $RayCast2D.is_colliding() == false:
			direction *= -1
			$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
			$RayCast2D.position.x *= -1


func _on_Timer_timeout():
	queue_free()
