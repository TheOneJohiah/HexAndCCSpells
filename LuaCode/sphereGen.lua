-- Function to generate a list of coordinates for a sphere
function GenerateSphere(centerX, centerY, centerZ, radius)
    local coordinates = {}

    for x = math.floor(centerX - radius), math.floor(centerX + radius) do
        for y = math.floor(centerY - radius), math.floor(centerY + radius) do
            for z = math.floor(centerZ - radius), math.floor(centerZ + radius) do
                local distance = math.sqrt((x - centerX)^2 + (y - centerY)^2 + (z - centerZ)^2)
                if math.floor(distance + 0.5) == radius then
                    table.insert(coordinates, {x = x, y = y, z = z})
                end
            end
        end
    end

    return coordinates
end

-- Example usage
local centerX = 1691.5
local centerY = 167
local centerZ = 27.5
local radius = 22

local sphereCoordinates = GenerateSphere(centerX, centerY, centerZ, radius)

-- Print the generated coordinates
for _, coord in ipairs(sphereCoordinates) do
    print(string.format("(%d, %d, %d)", coord.x, coord.y, coord.z))
end