
local function SetupTestScene(world, gui)
    assert(typeof(gui) == "Instance" and gui:IsA("GuiBase2d"), "Arg 2 is not a GUI")

    --- create test level

    -- create floor
    do
        local floorInstance = Instance.new("Frame")
        floorInstance.Size = UDim2.new(0, 512, 0, 16)
        floorInstance.BorderSizePixel = 0
        floorInstance.BackgroundColor3 = Color3.new(0, 0, 0)
        floorInstance.Parent = gui

        local floorEntity = world:CreateEntityFromInstance(floorInstance)

        local positionComponent = world:CreateComponent("PositionComponent")
        positionComponent.Position = Vector2.new(256, 256)

        local collisionComponent = world:CreateComponent("CollisionComponent")
        collisionComponent.Bounds = Vector2.new(512, 16)

        local guiObjectComponent = world:CreateComponent("GuiObjectComponent")
        guiObjectComponent.GuiObject = floorInstance

        floorEntity:AddComponents(positionComponent, collisionComponent, guiObjectComponent)

        world:AddEntity(floorEntity)
    end

    do
        local floorInstance = Instance.new("Frame")
        floorInstance.Size = UDim2.new(0, 512, 0, 16)
        floorInstance.BorderSizePixel = 0
        floorInstance.BackgroundColor3 = Color3.new(0, 0, 0)
        floorInstance.Parent = gui

        local floorEntity = world:CreateEntityFromInstance(floorInstance)

        local positionComponent = world:CreateComponent("PositionComponent")
        positionComponent.Position = Vector2.new(64, 192)

        local collisionComponent = world:CreateComponent("CollisionComponent")
        collisionComponent.Bounds = Vector2.new(512, 16)

        local guiObjectComponent = world:CreateComponent("GuiObjectComponent")
        guiObjectComponent.GuiObject = floorInstance

        floorEntity:AddComponents(positionComponent, collisionComponent, guiObjectComponent)

        world:AddEntity(floorEntity)
    end

    -- create player
    do
        local playerInstance = Instance.new("Frame")
        playerInstance.Size = UDim2.new(0, 16, 0, 32)
        playerInstance.BorderSizePixel = 0
        playerInstance.BackgroundColor3 = Color3.new(1, 0, 0)
        playerInstance.Parent = gui

        local playerEntity = world:CreateEntityFromInstance(playerInstance)

        local characterComponent = world:CreateComponent("CharacterComponent")
        characterComponent.PositiveYIsDown = true

        local positionComponent = world:CreateComponent("PositionComponent")
        positionComponent.Position = Vector2.new(384, 128)

        local velocityComponent = world:CreateComponent("VelocityComponent")
        velocityComponent.Velocity = Vector2.new(0, 0)

        local collisionComponent = world:CreateComponent("CollisionComponent")
        collisionComponent.Bounds = Vector2.new(16, 32)

        local guiObjectComponent = world:CreateComponent("GuiObjectComponent")
        guiObjectComponent.GuiObject = playerInstance

        playerEntity:AddComponents(characterComponent, positionComponent, velocityComponent, collisionComponent, guiObjectComponent)

        world:AddEntity(playerEntity)
    end

    -- create follow camera

end


return SetupTestScene