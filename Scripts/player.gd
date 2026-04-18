extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#根据输入获取方向，左（-1），右（1），静止（0）
	var direction := Input.get_axis("ui_left", "ui_right")
	
	#移动以及翻转立绘
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = direction - 1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#播放动画
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	move_and_slide()
