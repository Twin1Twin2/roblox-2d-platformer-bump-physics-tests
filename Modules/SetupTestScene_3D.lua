
local function SetupTestScene(world)
    --- create test level

    -- create floor
    do
        local floorInstance = Instance.new("Part")
        floorInstance.Size = Vector3.new(512, 16, 1)
        floorInstance.Anchored = true
        floorInstance.Color = Color3.new(0, 0, 0)
        floorInstance.Parent = workspace

        local floorEntity = world:CreateEntityFromInstance(floorInstance)

        local positionComponent = world:CreateComponent("PositionComponent")
        positionComponent.Position = Vector2.new(0, 0)

        local collisionComponent = world:CreateComponent("CollisionComponent")
        collisionComponent.Bounds = Vector2.new(512, 16)

        local basePartComponent = world:CreateComponent("BasePartComponent")
        basePartComponent.BasePart = floorInstance

        floorEntity:AddComponents(positionComponent, collisionComponent, basePartComponent)

        world:AddEntity(floorEntity)
    end

    -- create floor
    do
        local floorInstance = Instance.new("Part")
        floorInstance.Size = Vector3.new(512, 16, 1)
        floorInstance.Anchored = true
        floorInstance.Color = Color3.new(0, 0, 0)
        floorInstance.Parent = workspace

        local floorEntity = world:CreateEntityFromInstance(floorInstance)

        local positionComponent = world:CreateComponent("PositionComponent")
        positionComponent.Position = Vector2.new(-512, 64)

        local collisionComponent = world:CreateComponent("CollisionComponent")
        collisionComponent.Bounds = Vector2.new(512, 16)

        local basePartComponent = world:CreateComponent("BasePartComponent")
        basePartComponent.BasePart = floorInstance

        floorEntity:AddComponents(positionComponent, collisionComponent, basePartComponent)

        world:AddEntity(floorEntity)
    end

    -- create player
    do
        local playerInstance = Instance.new("Part")
        playerInstance.Size = Vector3.new(16, 32, 1)
        playerInstance.Anchored = true
        playerInstance.Color = Color3.new(1, 0, 0)
        playerInstance.Parent = workspace

        local playerEntity = world:CreateEntityFromInstance(playerInstance)

        local characterComponent = world:CreateComponent("CharacterComponent")

        local positionComponent = world:CreateComponent("PositionComponent")
        positionComponent.Position = Vector2.new(0, 128)

        local velocityComponent = world:CreateComponent("VelocityComponent")
        velocityComponent.Velocity = Vector2.new(0, 0)

        local collisionComponent = world:CreateComponent("CollisionComponent")
        collisionComponent.Bounds = Vector2.new(16, 32)

        local basePartComponent = world:CreateComponent("BasePartComponent")
        basePartComponent.BasePart = playerInstance

        playerEntity:AddComponents(characterComponent, positionComponent, velocityComponent, collisionComponent, basePartComponent)

        world:AddEntity(playerEntity)
    end

    -- create follow camera

end


return SetupTestScene