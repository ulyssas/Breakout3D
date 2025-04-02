extends CharacterBody3D

signal hit_box
signal hit_ground
#signal ai_start
#var ai_toggle = 0
# Declare member variables here. Examples:
@export var speed = 5

var if_dead = false
var init_position = Vector3(-5.55, 0.4, 0)
#velocity = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
    rotate_y(randf_range(- 5 * PI / 6, - PI / 6))
    #print(rotation.y)
    #if rotation.y >= 0:
    #	rotate_y(randi_range(- PI / 6, - 5 * PI / 6))#Again
    $Arrow.show()
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Main_begin():
    show()
    velocity = Vector3.FORWARD * speed
    velocity = velocity.rotated(Vector3.UP, rotation.y)
    $Arrow.hide()

func _physics_process(delta):
    var collide = move_and_collide(velocity * delta)
    """
    if collide != null:
        var body = collide.collider
        print("Collided with: ", body.name)
        velocity = velocity.bounce(collide.normal)
    """
    if collide != null:
        var box = collide.get_collider()
        print(box.name)
        if "Box" in box.name: #this is temporal fix so plz fix to "Box"
            emit_signal("hit_box")
            # ;print(box.name)
            box.box_hit()
        if box.name == "KabeZ2":
            emit_signal("hit_ground")
        velocity = velocity.bounce(collide.get_normal())
    elif if_dead == true:
        velocity = Vector3.ZERO

    """	
func _process(delta):
    if .x <= -4.3:
        ai_toggle = 1
        #emit_signal("ai_start")
        #print("Frck you",ai_toggle)
    else:
        ai_toggle = 0
    """
func reloading():
    if_dead = true
    #remove_child(self)
    #get_node("Collision").disabled = true
    position = init_position
    show()
    $Arrow.show()
    await get_tree().create_timer(2.0).timeout
    if_dead = false
    $Arrow.hide()
    _on_Main_begin()
    
func _on_Main_ball_reload():
    hide()
    reloading()

func _on_Main_over():
    queue_free()
