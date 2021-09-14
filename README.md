![Godot Audio Manager](https://github.com/MathewHDYT/Godot-Audio-Manager-GAM/blob/main/logo.png/)

[![MIT license](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://lbesson.mit-license.org/)
[![Godot](https://img.shields.io/badge/Godot-2%2B-green.svg?style=flat-square)](https://docs.godotengine.org/en/stable/index.html)
[![GitHub release](https://img.shields.io/github/release/MathewHDYT/Godot-Audio-Manager-GAM/all.svg?style=flat-square)](https://github.com/MathewHDYT/Godot-Audio-Manager-GAM/releases/)
[![GitHub downloads](https://img.shields.io/github/downloads/MathewHDYT/Godot-Audio-Manager-GAM/all.svg?style=flat-square)](https://github.com/MathewHDYT/Godot-Audio-Manager-GAM/releases/)

# Godot Audio Manager (GAM)
Used to play/fade... sounds at certain circumstances or events in 2D or 3D simply via. code.

## Contents
- [Godot Audio Manager (GAM)](#godot-audio-manager-gam)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Installation](#installation)
- [Documentation](#documentation)
  - [Reference to Sfx- and MusicManager Script](#reference-to-sfx--and-musicmanager-script)
  - [Adding new AutoLoad properties](#adding-new-autoload-properties)
  - [Public accesible methods](#public-accesible-methods)
  	- [Play Music method](#play-music-method)
  	- [Fade method](#fade-method)
  	- [Stop All method](#stop-all-method)
  	- [Play Sfx method](#play-sfx-method)
  	- [Play Pitched method](#play-pitched-method)

## Introduction
Nearly all games need music and soundeffects and this small and easily integrated Sfx -and MusicManager can help you play sounds in Godot for your game quick and easily.

**Godot Sfx- and MusicManager implement the following methods consisting of a way to:**
- Play music (see [Play Music method](#play-music-method))
- Fade in / out music (see [Fade method](#fade-method))
- Stop all music (see [Stop All method](#stop-all-method))
- Play soundeffects (see [Play Sfx method](#play-sfx-method))
- Play soundeffects at a random pitch level (see [Play Pitched method](#play-pitched-method))

For each method there is a description on how to call it and how to use it correctly for your game in the given section.

## Installation
**Required Software:**
- [Godot](https://godotengine.org/download/windows) Ver. 2.0

The Sfx -and MusicManager themselves are version independent, as long as the [```AudioStreamPlayer```](https://docs.godotengine.org/en/stable/classes/class_audiostreamplayer.html) object already exists. Additionally the example project can be opened with Godot itself or the newest release can be downloaded and exectued to test the functionality.

If you prefer the first method, you can simply install the shown Godot version and after installing it you can download the project and open it in Godot. Then you can start the game with the play button to test the Sfx- and MusicManagers functionality.

To simply use the Sfx- and MusicManager in your own project without downloading the Godot project get the two files in the **addons/AudioManager/** called ```MusicManager.gd``` and ```SfxManager.gd``` or alternatively get them from the newest release (may not include the newest changes) and save them in your own project. Then add them into the ```AutoLoad``` property like shown in [Adding new AutoLoad properties](#adding-new-autoload-properties).

# Documentation
This documentation strives to explain how to start using the Sfx- and MusicManager in your project and explains how to call and how to use its publicly accesible methods correctly.

## Reference to Sfx- and MusicManager Script
To use the Sfx- and MusicManager to start playing sounds outside of itself you need to reference it. As the Sfx- and MusicManager are a ```Singelton``` this can be done easily when we save the script into our Autload properties like shown in [Adding new AutoLoad properties](#adding-new-autoload-properties). After this is done they can be simply called like this.

```gdscript
func _ready()
    MusicManager.play(preload("music.ogg"))
    SfxManager.play(preload("teleport.wav"))
```

## Adding new AutoLoad properties
To add a new ```AutoLoad``` property, you simply need to click the add button and choose the Sfx -or MusicManager and given them the name you want to acces them with.

![Image of Autoload property](https://image.prntscr.com/image/CscPCmKIREa2D759lnIxhQ.png)

## Public accesible methods
This section explains all public accesible methods, especially what they do, how to call them and when using them might be advantageous instead of other methods. We always assume both scripts have already been added as new ```AutoLoad``` properties. If you haven't done that already see [Adding new AutoLoad properties](#adding-new-autoload-properties).

### Play Music method
**What it does:**
Starts playing the choosen sound.

**How to call it:**
- ```Stream``` is the ```AudioStreamPlayer``` or ```name``` we have given the sound we want to play
- ```Offset``` is the point in the sound we want to start playing at

```gdscript
var stream := preload("music.ogg")
var offset := 0
MusicManager.play(stream, offset)
```

Alternatively you can call the methods with less paramters as some of them have default arguments.

```gdscript
var stream := preload("music.ogg")
MusicManager.play(stream)
```

**When to use it:**
If you simply want to play a sound with no fading and additionaly want to ensure only one sound can be played at a time.

### Fade method
**What it does:**
Start fading in and playing the choosen sound and fades out the previous sound.

**How to call it:**
- ```Stream``` is the ```AudioStreamPlayer``` or ```name``` we have given the sound we want to play
- ```PrevDuration```is the time we want to give the previous track until it's faded out completly
- ```NextDuration```is the time we want to give the current track until it's faded in completly
- ```NextDelay```is the time we want to wait until the next sound starts playing
- ```Offset``` is the point in the sound we want to start playing at

```gdscript
var stream := preload("music.ogg")
var prev_duration := 1.0
var next_duration = null
var next_delay := 1.0
var offset := 0
MusicManager.fade(stream, prev_duration, next_duration, next_delay, offset)
```

Alternatively you can call the methods with less paramters as some of them have default arguments.

```gdscript
var stream := preload("music.ogg")
var prev_duration := 1.0
MusicManager.fade(stream, prev_duration)
```

**When to use it:**
If you want to fade smoothly between souds, when one of them should end and the other should start.

### Stop all method
**What it does:**
Immediately stops all currently playing sounds.

**How to call it:**

```gdscript
MusicManager.stop_all()
```

**When to use it:**
If you want to stop all sounds without fading.

### Play Sfx method
**What it does:**
Starts playing the choosen sound. (There can be multiple sounds running at the same time if the SfxManager is used)

**How to call it:**
- ```Stream``` is the ```AudioStreamPlayer``` or ```name``` we have given the sound we want to play

```gdscript
var stream := preload("teleport.wav")
SfxManager.play(stream)
```

**When to use it:**
If you simply want to play a sound with no pitch shift and additionaly want to ensure multiple sounds can be played at a time.


### Play Pitched method
**What it does:**
Starts playing the choosen sound with a random pitch in the given range.

**How to call it:**
- ```Stream``` is the ```AudioStreamPlayer``` or ```name``` we have given the sound we want to play
- ```MinPitch``` is the smallest pitch value the sound can have
- ```MaxPitch``` is the biggest pitch value the sound can have

```gdscript
var stream := preload("teleport.wav")
var min_pitch := 0.5
var max_pitch := 1.5
SfxManager.play_pitched(stream, min_pitch, max_pitch)
```

Alternatively you can call the methods with less paramters as some of them have default arguments.

```gdscript
var stream := preload("teleport.wav")
var min_pitch := 0.5
SfxManager.play_pitched(stream, min_pitch)
```

**When to use it:**
If you play a sound a lot of times it can be advantageous to slightly change it's pitch to make it less repetitive.
