extends CharacterBody3D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func box_hit():
    queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):

#func _on_Area_body_entered(body):
    #box_hit()
