extends RigidBody

# Declare member variables here. Examples:
export var speed = 500
var velocity = Vector3.FORWARD

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	rotate_y(rand_range(PI / 6, 5 * PI / 6))
	velocity = velocity * speed
	velocity = velocity.rotated(Vector3.FORWARD, rotation.y)
	add_central_force(velocity)
	
func _integrate_forces(state):
	print("v", self.linear_velocity)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
	#pass
