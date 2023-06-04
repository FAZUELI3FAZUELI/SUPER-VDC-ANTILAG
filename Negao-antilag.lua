local runService = game:GetService("RunService")

local lighting = game:GetService("Lighting")

-- Defina as configurações gráficas para valores mais baixos

lighting.GlobalShadows = false

lighting.Outlines = false

lighting.Brightness = 0.5

-- Remova elementos desnecessários que podem causar lag

-- Exemplo: Remova todas as partículas no jogo

for _, particleEmitter in ipairs(game:GetService("Workspace"):GetDescendants()) do

    if particleEmitter:IsA("ParticleEmitter") then

        particleEmitter:Destroy()

    end

end

-- Otimize as roupas dos jogadores

local function optimizeClothing(character)

    for _, descendant in ipairs(character:GetDescendants()) do

        if descendant:IsA("Clothing") or descendant:IsA("ShirtGraphic") or descendant:IsA("Pants") then

            descendant:Destroy()

        end

    end

end

for _, player in ipairs(game.Players:GetPlayers()) do

    if player ~= game.Players.LocalPlayer then

        player.CharacterAdded:Connect(function(character)

            optimizeClothing(character)

        end)

    end

end

game.Players.PlayerAdded:Connect(function(player)

    if player ~= game.Players.LocalPlayer then

        player.CharacterAdded:Connect(function(character)

            optimizeClothing(character)

        end)

    end

end)

-- Otimize a taxa de atualização do jogo para 60 FPS

runService.Stepped:Connect(function()

    if runService:GetFrameRate() > 60 then

        runService.Heartbeat:Wait()

    end

end)

-- Crie o GUI com o texto em vermelho

local gui = Instance.new("ScreenGui")

local frame = Instance.new("Frame")

frame.Size = UDim2.new(0, 200, 0, 50)

frame.Position = UDim2.new(0.5, -100, 0.5, -25)

frame.BackgroundTransparency = 0.5

frame.BackgroundColor3 = Color3.new(0, 0, 0)

local textLabel = Instance.new("TextLabel")

textLabel.Text = "Created by SUPER VDC"

textLabel.Size = UDim2.new(1, 0, 1, 0)

textLabel.BackgroundTransparency = 1

textLabel.TextColor3 = Color3.new(1, 0, 0)

textLabel.Font = Enum.Font.SourceSans

textLabel.TextSize = 20

textLabel.Parent = frame

frame.Parent = gui

gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Remova o GUI após 7 segundos

wait(7)

gui:Destroy()
1
