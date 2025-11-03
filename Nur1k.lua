local PASSWORD = "DOSASASALI123"
local authenticated = false

local function promptPassword()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "PasswordPrompt"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("CoreGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 370, 0, 170)
    frame.Position = UDim2.new(0.5, -180, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(20,20,25)
    frame.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1,-20,0,28)
    title.Position = UDim2.new(0,10,0,10)
    title.BackgroundTransparency = 1
    title.Text = "Введите пароль:"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1,-20,0,36)
    textBox.Position = UDim2.new(0,10,0,60)
    textBox.BackgroundColor3 = Color3.fromRGB(25,25,30)
    textBox.TextColor3 = Color3.fromRGB(255,255,255)
    textBox.Font = Enum.Font.GothamBold
    textBox.TextSize = 16
    textBox.ClearTextOnFocus = true
    textBox.PlaceholderText = "Пароль"
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.Text = "" -- пустое поле, чтобы пользователь вводил свой пароль
    textBox.Parent = frame

    local submitBtn = Instance.new("TextButton")
    submitBtn.Size = UDim2.new(1,-20,0,36)
    submitBtn.Position = UDim2.new(0,10,0,110)
    submitBtn.BackgroundColor3 = Color3.fromRGB(0,150,255)
    submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
    submitBtn.Font = Enum.Font.GothamBold
    submitBtn.TextSize = 16
    submitBtn.Text = "Подтвердить"
    submitBtn.Parent = frame

    local function checkPassword()
        if textBox.Text == PASSWORD then
            authenticated = true
            screenGui:Destroy()
        else
            textBox.Text = ""
            textBox.PlaceholderText = "Неверный пароль!"
        end
    end

    submitBtn.MouseButton1Click:Connect(checkPassword)
    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then checkPassword() end
    end)
end

promptPassword()

-- Ждём правильный пароль
while not authenticated do
    task.wait()
end

-- После правильного пароля загружаем скрипт
local url = "https://raw.githubusercontent.com/Nur1kScrp/Nur1k-Script/refs/heads/main/Nur1k%20Script.lua"
local source = game:HttpGet(url)
if source then
    local func, err = loadstring(source)
    if func then
        func()
    else
        warn("Ошибка при запуске скрипта: "..tostring(err))
    end
else
    warn("Не удалось получить скрипт.")
end

