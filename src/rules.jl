
"""
## GAME RULES (INACTIVE)
Provide the game's rules (things to check for every frame) by defining custom types, functions, and objects below. Some basic rules funcionality is provided.
"""

using Animat

abstract type AbstractToken end

abstract type AbstractCard end

abstract type AbstractAbility end

abstract type AbstractLand <: AbstractCard end

abstract type AbstractSpell <: AbstractCard end

abstract type TriggeredAbility <: AbstractAbility end

abstract type ActivatedAbility <: AbstractAbility end

stack = Union{AbstractSpell,AbstractAbility}[]

mutable struct Card <: AbstractCard
    const id::String
    name::String
    owner::String
    controller::String
    faces::Vector{Actor}
    texts::Vector{Actor}
    counters::Vector{Actor}
	tapped::Bool
    flipped::Bool
    scale::Vector{Float32}
    data::Dict{Symbol,Any}
end

mutable struct Ability <: AbstractAbility
    source::Card
    effect::Function
end

mutable struct Spell <: AbstractSpell
    card::Card
    ability::Ability
end

mutable struct Token <: AbstractToken
    id::String
    name::String
    owner::String
    controller::String
    faces::Vector{Actor}
    tapped::Bool
    flipped::Bool
    scale::Vector{Float32}
    data::Dict{Symbol,Any}
end

mutable struct Zone
    owner::String
    name::String
    cards::Vector{Card}
end

mutable struct Planeswalker
    card::Card
    loyalty::Int
end

mutable struct Player
    name::String
    portrait::Actor
    health::Int
    poison::Int
    priority::Bool
    resources::Dict{Symbol,Any}
    effects::Vector{Ability}
    zones::Vector{Zone}
end

mutable struct AnimatGame
    player_names::Vector{Player}
    global_effects::Vector{Ability}
    server_address::String
    stack::Vector{Ability}
    gs::Dict
end

gr = Dict(
    :turn_order => [:untap, :upkeep, :draw, :main_phase_one, :declare_attackers, :declare_blockers, :main_phase_two, :end_phase],
    :win_conditions => [:all_opponents_lost, :no_opponents_left],
    :loss_conditions => [:zero_health, :cant_draw, :poisoned, :commander_dmg],
)

game_step = [
    "untap",
    "upkeep",
    "draw",
    "precombat_main",
    "combat",
    "postcombat_main",
    "end",
    "cleanup",
]

begin
    resource_types = ["{W}", "{U}", "{B}", "{R}", "{G}", :E, :X, :L, :E, :P]

    """
    Resource types:

    Mana
    :W - white
    :U - blue
    :B - black
    :R - red
    :G - green
    :C - colorless

    Other
    :L - life
    :E - energy
    :P - poison

    """
end

function declare_creature_attack(target::Union{Player,Planeswalker}, creatures::Dict, opponents::Dict, planeswalkers::Dict)
end

function declare_blockers(p::Player, creatures::Dict)
end

function shuffle_deck(p::Player)
end

function draw_card(p::Player, num::Int)
end

function discard_card(p::Player, amount::Int, random=false)
end

function add_mana_to_pool(p::Player, mana_type)
end

function subtract_mana_from_pool(p::Player, mana_type)
end

function tap_card(p::Player, card)
end

function untap_card(p::Player, card)
end

function play_land(p::Player)
end

function play_spell(p::Player)
end

function take_damage(p::Player, creature=nothing)
end

function heal_damage(p::Player, creature=nothing)
end

function gain_life(p::Player)
end

function lose_life(p::Player)
end

function end_phase(p::Player)
end

function end_turn(p::Player)
end

function run_upkeep(p::Player)
end