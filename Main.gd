extends Node

@export var box_scene: PackedScene
@export var ball_scene: PackedScene

signal begin
signal over
signal ball_reload

var box_count: int

var time_start = 0
var elapsed_time = 0
var life = 2#残機

var counter = 3
# Called when the node enters the scene tree for the first time.
func _ready():
    randomize()
    var XBox = 8
    var YBox = Global.YBox
    box_count = XBox * YBox
    if Global.spacing == 1:
        for x in range(XBox):
            for y in range(YBox):
                var box = box_scene.instantiate()
                box.position = Vector3((6 - (1  * y)), 0.4, (4.2 - (1.2 * x)))
                #box.position = Vector3((7 - (1  * y)), 0.4, (4.2 - (1.2 * x)))
                add_child(box, true)
    else:
        for x in range(XBox):
            for y in range(YBox):
                var box = box_scene.instantiate()
                #box.translation = Vector3((2 + (1  * y)), 0.4, (-4.2 + (1.2 * x)))#OLDAlgorithm 
                box.position = Vector3((7 - (1  * y)), 0.4, (4.2 - (1.2 * x)))
                add_child(box, true)
    #ball_loader()
    initialize_starter()
    
func initialize_starter():
    $Count.show()
    $ElapsedTimeLabel.hide()
    $RemainBlockLabel.hide()
    $LifeLabel.hide()
    while counter != 0:
        $Count.text = ("%s" % counter)
        await get_tree().create_timer(1.0).timeout
        counter -= 1
    emit_signal("begin")
    $Count.hide()
    time_start = Time.get_ticks_msec()

func _on_Main_begin():
    $ElapsedTimeLabel.show()
    $RemainBlockLabel.show()
    $LifeLabel.show()

func _process(delta):
    elapsed_time = (Time.get_ticks_msec() - time_start) / 1000
    $ElapsedTimeLabel.text = ("Elapsed Time: %s" % elapsed_time)
    $RemainBlockLabel.text = ("Remaining: %s" % box_count)
    $LifeLabel.text = ("Life: %s" % life)
    #print(life)
    if box_count == 0:
        game_over("Cleared in %s seconds" % elapsed_time, "Game Clear!")
    #print(box_count)	
    
func _on_Ball_hit_box():
    box_count -= 1
    
func game_over(message: String, EMessage):
    emit_signal("over")
    await get_tree().create_timer(1.3).timeout
    Global.commentText = message
    Global.EtitleText = EMessage
    get_tree().change_scene_to_file("res://Result.tscn")
    
func _on_Ball_hit_ground():
    life -= 1
    if life == 0:
        game_over("Try Again!", "Game Over")
    else:
        emit_signal("ball_reload")

func _input(event):
    if event.is_action_pressed("ui_cancel"):
        get_tree().quit()
    if event.is_action_pressed("lifeCrazy"):
        life = 200

func _on_Main_ball_reload():
    pass # Replace with function body.
