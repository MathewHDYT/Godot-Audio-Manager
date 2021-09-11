extends Node

# Allows to play audio streams and to automatically create a random pitch for them.

#-----------------------------------------------------------------------------
# Public API
#-----------------------------------------------------------------------------

# Plays a stream without any pitch changes.
func play(stream):
    _pitch(stream)

# Plays a stream with a random pitch.
func play_pitched(stream, min_pitch, max_pitch=1):
    _pitch(stream, min_pitch, max_pitch)

#-----------------------------------------------------------------------------
# Private
#-----------------------------------------------------------------------------

class SFX:
    var player = null
    
    func is_active():
        return player.is_playing()

var _sfxs = []
var _volume = 1.0
var _random = RandomNumberGenerator.new();

func _ready():
    set_process(true)
    _random.randomize()

# Play a stream with random pitch between the 2 given values.
# stream (string or AudioStreamPlayer): which stream to play next. If null, nothing will play next.
# min_pitch (float): start value for the randomly generated pitch.
# max_pitch (float): end value for the randomly generated pitch.
func _pitch(stream, min_pitch=1, max_pitch=1):
    if typeof(stream) == TYPE_STRING:
        stream = load(stream)
    var sfx = null
    if stream != null:
        # Get next sfx
        sfx = _get_free_sfx(stream)
        # Get random pitch
        var random_pitch = _random.randf_range(min_pitch, max_pitch)
        # Start sfx at the given pitch
        sfx.player.set_stream(stream)
        sfx.player.set_pitch_scale(random_pitch);
        sfx.player.set_volume_db(linear2db(_volume))
        sfx.player.play()

# Get the SFX Class value responding to our current stream or create a new one.
func _get_free_sfx(stream):
    if stream != null:
        # First find a sfx that plays our song already
        for sfx in _sfxs:
            if sfx.player.get_stream() == stream:
                return sfx
    # If all else fails, create a new sfx
    var sfx = SFX.new()
    sfx.player = AudioStreamPlayer.new()
    add_child(sfx.player)
    _sfxs.append(sfx)
    return sfx
