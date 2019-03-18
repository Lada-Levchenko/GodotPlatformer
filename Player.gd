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
		linear_velocity = Vector2(speed,linear_velocity.y)
	if Input.is_action_pressed("ui_left"):
		linear_velocity = Vector2(-speed,linear_velocity.y)
	if Input.is_action_just_pressed("ui_up") and canJump:
		self.apply_central_impulse (Vector2.UP*jumpForce)
		canJump = false
	


func _on_RigidBody2D_body_entered(body):
	if body.is_in_group("Ground"):
		canJump = true

