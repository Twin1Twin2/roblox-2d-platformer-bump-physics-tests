--- ClientMain

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local require = require(ReplicatedStorage:WaitForChild("Nevermore"))

local ECSFramework = require("ECSFramework")
local InitializeControlBindingsFramework = require("InitializeControlBindingsFramework")

local EngineConfiguration = ECSFramework.EngineConfiguration
local Engine = ECSFramework.Engine


InitializeControlBindingsFramework()


-- Setup Components

local PositionComponent = require("PositionComponent").new()

local CollisionComponent = require("CollisionComponent").new()
local VelocityComponent = require("VelocityComponent").new()

local GuiObjectComponent = require("GuiObjectComponent").new()
local BasePartComponent = require("BasePartComponent").new()

local CharacterComponent = require("CharacterComponent").new()


-- Setup Systems

-- BumpSystems

local Bump = require("bump")

local bumpWorld = Bump.newWorld()

local BumpInitCollisionsSystem = require("BumpInitCollisionsSystem").new(bumpWorld)
local BumpVelocityPhysicsSystem = require("BumpVelocityPhysicsSystem").new(bumpWorld)


local TestCharacterControllerSystem = require("TestCharacterControllerSystem").new()


-- GuiRenderSystems

local GuiObjectRenderSystem = require("GuiObjectRenderSystem").new()

local BasePartObjectRenderSystem = require("BasePartObjectRenderSystem").new()


-- Setup Engine Configuration

local engineConfig = EngineConfiguration.new(
    "WORLD"
)


engineConfig:AddComponentsFromList({
    PositionComponent,

    CollisionComponent,
    VelocityComponent,

    CharacterComponent,

    GuiObjectComponent,
    BasePartComponent
})


engineConfig:AddRenderSteppedSystemsFromList({
    GuiObjectRenderSystem,
    BasePartObjectRenderSystem
})


engineConfig:AddSteppedSystemsFromList({
    TestCharacterControllerSystem,
    BumpVelocityPhysicsSystem
})


engineConfig:AddHeartbeatSystemsFromList({

})


engineConfig:AddSystemsFromList({
    BumpInitCollisionsSystem
})


local engine = ECSFramework.Engine.new(engineConfig)
local world = engine.World

-- Tests
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Parent = PlayerGui

-- require("SetupTestScene_Gui")(world, gui)
require("SetupTestScene_3D")(world)

print("Client Loaded!")