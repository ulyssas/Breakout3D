extends Control

# Declare member variables here. Examples:
@export var max_value = 12
@export var min_value = 1
var current_value = Global.YBox

@onready var label = $LabelNumBlock

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
    label.text = str(current_value)
    
func _on_ButtonUp_pressed() -> void:
    current_value += 1
    if current_value > max_value:
        current_value = min_value

func _on_ButtonDown_pressed() -> void:
    current_value -= 1
    if current_value < min_value:
        current_value = max_value
