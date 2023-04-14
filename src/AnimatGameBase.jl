module AnimatGameBase

using Animat
using Base.Threads

export GAME_SETTINGS, STAGE, SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_BORDER

export Card, bd

const bd = "$(@__DIR__)/.."

# cheating in local decks
#const decks_dir = "C:/Users/dusty/My Drive/AnimatProjects/AnimatGames/AniMage/decks"
const default_font = "$bd/assets/fonts/OpenSans-Regular.ttf"
const bold_font = "$bd/assets/fonts/OpenSans-Bold.ttf"


# Loading card db

include("settings.jl")
include("rules.jl")
#include("stage.jl")
#include("game_state.jl")
#include("stage_funcs.jl")
#include("card_funcs.jl")
#include("game.jl")

end