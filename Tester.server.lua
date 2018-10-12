
local TestEZ = require(script.Parent:FindFirstChild("TestEZ"))

local rootFolder = script.Parent:FindFirstChild("Tests")

local results = TestEZ.TestBootstrap:run({rootFolder})

print("Number of errors = " .. tostring(#results))