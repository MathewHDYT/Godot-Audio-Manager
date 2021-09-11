extends Node

func _on_Play_pressed():
    MusicManager.fade(preload("music.ogg"), 1.0, 1.0)

func _on_StopButton_pressed():
    MusicManager.fade(null, 1.0)

func _on_PlayDelayed_pressed():
    MusicManager.fade(preload("music.ogg"), 1.0, null, 1.0)

func _on_StopButtonNow_pressed():
    MusicManager.stop_all()

func _on_PlaySfx_pressed() -> void:
    SfxManager.play(preload("teleport.wav"))

func _on_PlayPitchedSfx_pressed() -> void:
    SfxManager.play_pitched(preload("teleport.wav"), 0.5, 1.5)
