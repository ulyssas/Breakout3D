extends Node

var selection = 0

func _on_Button_pressed():
    Global.YBox = get_node("EnterSystem").current_value
    #print(Global.YBox)
    get_tree().change_scene_to_file("res://Main.tscn")

func _input(event):
    if event.is_action_pressed("ui_cancel"):
        get_tree().change_scene_to_file("res://Title.tscn")

func _on_CheckBox_toggled(button_pressed):
    selection += 1
    Global.spacing = selection % 2
    #print(Global.spacing)
