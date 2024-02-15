-- Define focal port
local mainPort = peripheral.wrap("top")

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

-- Function to process coordinates in batches
function ProcessCoordinatesInBatches(coordinates, batchSize)
    local totalCoordinates = #coordinates
    local batches = math.ceil(totalCoordinates / batchSize)

    for i = 1, batches do
        local startIdx = (i - 1) * batchSize + 1
        local endIdx = math.min(i * batchSize, totalCoordinates)

        local batch = {}
        for j = startIdx, endIdx do
            table.insert(batch, coordinates[j])
        end

        -- Process the batch (replace this with your actual processing code)
        ProcessBatch(batch)

        -- Pause for user input before the next batch
        print("Swap focus and press Enter to continue...")
        io.read()  -- Wait for user input
    end
end

-- Example usage
local centerX = 1691.5
local centerY = 167
local centerZ = 27.5
local radius = 22
local batchSize = 1022

local sphereCoordinates = GenerateSphere(centerX, centerY, centerZ, radius)

-- Print the generated coordinates
for _, coord in ipairs(sphereCoordinates) do
    print(string.format("(%d, %d, %d)", coord.x, coord.y, coord.z))
end

-- Process coordinates in batches
ProcessCoordinatesInBatches(sphereCoordinates, batchSize)

-- Function to process a batch (replace this with your actual processing code)
function ProcessBatch(batch)
    mainPort.writeIota(batch)
end