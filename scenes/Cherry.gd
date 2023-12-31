extends Area2D


const SPEED = 100
var direction = 1;
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)

func set_cherry_direction(dir):
	direction = sign(dir)
	if direction == -1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Throw_body_entered(body):
	if "Opossum" in body.get_name():
		body.dead()
	queue_free()
