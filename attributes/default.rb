#
# Credentials needed to download and install the Arma 3 DS
#
default['arma3']['steam_user'] = "changeme"
default['arma3']['steam_password'] = "changeme"

# Location to install the game (application-specific directory
# will be created under here.
default['arma3']['install_base'] = "/usr/local/games"

#
# Arma 3 Server configuration (server.cfg) attributes
#

#
# Global settings
#

# The name of the server that shall be displayed in the public server list
default['arma3']['hostname'] = "Fun and Test Server"
# Password for joining, eg connecting to the server
default['arma3']['password'] = ""
# Password to become server admin. When you're in Arma MP and connected to
# the server, type '#login xyz'
default['arma3']['password_admin'] = "xyz"
# Tells ArmA-server where the logfile should go and what it should be called
default['arma3']['log_file'] = "server_console.log"

# WELCOME MESSAGE ("message of the day")
# It can be several lines, separated by comma
# Empty messages "" will not be displayed at all but are only for increasing
# the interval
default['arma3']['motd'] = [ "",
                             "",
                             "Two empty lines above for increasing interval",
                             "Welcome to our server",
                             "",
                             "",
                             "We are looking for fun - Join us Now !",
                             "http://www.example.com",
                             "One more empty line below for increasing interval",
                             "" ]

# Time interval (in seconds) between each message
default['arma3']['motd_interval'] = 5

#
# Joining settings
#

# Maximum amount of players. Civilians and watchers, beholder, bystanders
# and so on also count as player.
default['arma3']['max_players'] = 64

# Each ArmA version has its own ID. If kickDuplicate is set to 1, a player
# will be kicked when he joins a server where another player with the same
# ID is playing.
default['arma3']['kick_duplicate'] = 1

# Verifies .pbos against .bisign files. Valid values 0 (disabled), 1 (prefer
# v2 sigs but accept v1 too) and 2 (only v2 sigs are allowed). 
default['arma3']['verify_signatures'] = 2

#
# Voting settings
#

# Tells the server how many people must connect so that it displays the
# mission selection screen.
default['arma3']['vote_mission_players'] = 1

# 33% or more players need to vote for something, for example an admin or
# a new map, to become effective
default['arma3']['vote_threshold'] = 0.33

#
# Ingame settings
#

# If set to 1, Voice over Net will not be available
default['arma3']['disable_von'] = 1

# since 1.62.95417 supports range 1-20
# since 1.63.x will supports range 1-30
# 8kHz is 0-10, 16kHz is 11-20, 32kHz is 21-30
default['arma3']['von_codec_quality'] = 0

# If 1, missions still run on even after the last player disconnected.
default['arma3']['persistent'] = 1

# Set the timestamp format used on each report line in server-side RPT
# file. Possible values are "none" (default),"short","full".
default['arma3']['timestamp_format'] = "short"

# Server to use BattlEye system
default['arma3']['battleye'] = 1

# Only allow files with those extensions to be loaded via loadFile
# command (since Arma 3 build 1.19.124216)
default['arma3']['allowed_load_file_extensions'] = [ "hpp", "sqs", "sqf",
                                                     "fsm", "cpp", "paa",
                                                     "txt", "xml", "inc",
                                                     "ext", "sqm", "ods",
                                                     "fxy", "lip", "csv",
                                                     "kb", "bik", "bikb",
                                                     "html","htm","biedi" ]

# Only allow files with those extensions to be loaded via preprocessFile/preprocessFileLineNumber commands (since Arma 3 build 1.19.124323)
default['arma3']['allowed_preprocess_file_extensions'] = [ "hpp", "sqs", "sqf",
                                                           "fsm", "cpp", "paa",
                                                           "txt", "xml", "inc",
                                                           "ext", "sqm", "ods",
                                                           "fxy", "lip", "csv",
                                                           "kb", "bik", "bikb",
                                                           "html","htm","biedi" ]

# Only allow files with those extensions to be loaded via HTMLLoad command (since Arma 3 build 1.27.126715)
default['arma3']['allowed_hmtl_load_extensions'] = [ "htm", "html", "xml", "txt" ]

#
# Scripting issues
#
default['arma3']['on_user_connected'] = ""
default['arma3']['on_user_disconnected'] = ""
default['arma3']['double_id_detected'] = ""

#
# Signature Verification
#

# Unsigned data detected
default['arma3']['on_unsigned_data'] = "kick (_this select 0)"

# Tampering of the signature detected
default['arma3']['on_unsigned_data'] = "ban (_this select 0)"

# Data with a valid signature, but different version than the one present on server detected
default['arma3']['on_different_data'] = ""

#
# Mission Cycle - TODO
#


