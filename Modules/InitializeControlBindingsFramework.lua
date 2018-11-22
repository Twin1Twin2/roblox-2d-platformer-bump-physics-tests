
local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

local ControlBindingsFramework = require("ControlBindingsFramework")

local ControlBindings = ControlBindingsFramework:Get()

local DigitalInputSystem = ControlBindingsFramework.DigitalInputSystem
local MouseMovementInputSystem = ControlBindingsFramework.MouseMovementInputSystem
local MouseWheelInputSystem = ControlBindingsFramework.MouseWheelInputSystem
local DefaultGamepadInputSystem = ControlBindingsFramework.DefaultGamepadInputSystem


local function Initialize()
    ControlBindings:AddInputSystem(DigitalInputSystem)
    ControlBindings:AddInputSystem(MouseMovementInputSystem)
    ControlBindings:AddInputSystem(MouseWheelInputSystem)
    ControlBindings:AddInputSystem(DefaultGamepadInputSystem)

    ControlBindings:SetActionBindings(require("TestControlBindings"))

    ControlBindings:Enable()
end


return Initialize