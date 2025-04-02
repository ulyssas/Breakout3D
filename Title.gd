extends Node


func _on_Button_pressed():
    #トランジション追加したい
    get_tree().change_scene_to_file("res://Select.tscn")
    

func _input(event):
    if event.is_action_pressed("ui_cancel"):
        get_tree().quit()
        
