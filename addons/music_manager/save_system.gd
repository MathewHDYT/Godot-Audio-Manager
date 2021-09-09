extends Node

# Allows to save and load data into and from the config file.

#-----------------------------------------------------------------------------
# Public API
#-----------------------------------------------------------------------------

# Save a value into our config file.
# section (string): section we want to set the value into. 
# key (string): name of the key we want to save the value into.
# value (var): value we want to save.
func save_value(section, key, value):
    if _directory.file_exists(_save_path):
        _config.load_encrypted_pass(_save_path, _password)
    _config.set_value(section, key, value)
    _config.save_encrypted_pass(_save_path, _password)

# Load a value from our config file.
# section (string): section we want to get the value from.
# key (string): name of the key we want to read the value from.
# return: value we wanted to read
func load_value(section, key):
    _config.load_encrypted_pass(_save_path, _password)
    return _config.get_value(section, key)

#-----------------------------------------------------------------------------
# Private
#-----------------------------------------------------------------------------

# Dictionariy holding each value in our config file.
# Change path to user:// instead of res:// when on mobile.
var _save_path = "res://save-file.cfg"
var _password = "C_Lrj32n?&.:L_'q"
var _directory = Directory.new()
var _config = ConfigFile.new()
# Load the Encrpyted File and save it's data into the ConfigFile Object
var _load_response = _config.load_encrypted_pass(_save_path, _password)
