extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var canJump = false
var speed = 150
var jumpForce = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _integrate_forces (delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = false
		linear_velocity = Vector2(speed,linear_velocity.y)
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true
		linear_velocity = Vector2(-speed,linear_velocity.y)
	elif canJump:
		$AnimatedSprite.play("Idle")
	if Input.is_action_just_pressed("ui_up") and canJump:
		self.apply_central_impulse (Vector2.UP*jumpForce)
		canJump = false
		$AnimatedSprite.play("Jump")
	


func _on_RigidBody2D_body_entered(body):
	if body.is_in_group("Ground"):
		canJump = true
		$AnimatedSprite.play("Idle")

