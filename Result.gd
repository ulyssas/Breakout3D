extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    $GameOver.text = Global.EtitleText
    $Comment.text = Global.commentText
    

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
    if event.is_action_pressed("ui_cancel"):
        get_tree().quit()

func _on_Button_pressed():
    get_tree().change_scene_to_file("res://Select.tscn")
