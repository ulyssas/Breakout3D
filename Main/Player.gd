extends CharacterBody3D


# Declare member variables here. Examples:
@export var speed = 7.5
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    velocity = Vector3.ZERO
    
    if Input.is_action_pressed("move_right"):
        velocity.z += 1
        
    if Input.is_action_pressed("move_left"):
        velocity.z -= 1
        
    if Input.is_action_pressed("move_forward"):
        velocity.x += 1
        
    if Input.is_action_pressed("move_back"):
        velocity.x -= 1
    
    velocity = velocity.normalized() * speed
    
    move_and_slide()#velocity, Vector3.UP)
    """
    BoxHitDebug?
    var collide = move_and_collide(velocity * delta)
    if collide != null:
        var box = collide.collider
        if "Box" in box.name:
            emit_signal("hit_box")
            print(box.name)
            box.box_hit()
    """

    
