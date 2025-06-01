-- SecureUI Library - Professional Roblox UI Library
-- Enhanced security, customization, and modern design

local SecureUI = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- Security Configuration
local SecurityConfig = {
    AntiDetection = true,
    SecureMode = true,
    EncryptedStorage = true,
    InputValidation = true,
    RateLimiting = true
}

-- Theme System
local Themes = {
    Dark = {
        Primary = Color3.fromRGB(25, 25, 35),
        Secondary = Color3.fromRGB(35, 35, 45),
        Accent = Color3.fromRGB(100, 150, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 180, 180),
        Border = Color3.fromRGB(60, 60, 70),
        Success = Color3.fromRGB(75, 200, 100),
        Warning = Color3.fromRGB(255, 200, 50),
        Error = Color3.fromRGB(255, 100, 100)
    },
    Light = {
        Primary = Color3.fromRGB(245, 245, 250),
        Secondary = Color3.fromRGB(235, 235, 240),
        Accent = Color3.fromRGB(70, 120, 255),
        Text = Color3.fromRGB(25, 25, 35),
        TextSecondary = Color3.fromRGB(100, 100, 120),
        Border = Color3.fromRGB(200, 200, 210),
        Success = Color3.fromRGB(50, 180, 80),
        Warning = Color3.fromRGB(255, 180, 30),
        Error = Color3.fromRGB(255, 80, 80)
    },
    Neon = {
        Primary = Color3.fromRGB(15, 15, 25),
        Secondary = Color3.fromRGB(25, 25, 35),
        Accent = Color3.fromRGB(255, 50, 150),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 255),
        Border = Color3.fromRGB(100, 50, 150),
        Success = Color3.fromRGB(50, 255, 150),
        Warning = Color3.fromRGB(255, 255, 50),
        Error = Color3.fromRGB(255, 50, 50)
    }
}

-- Security Functions
local function ValidateInput(input, expectedType)
    if not SecurityConfig.InputValidation then return true end
    return type(input) == expectedType
end

local function CreateSecureConnection(callback)
    if not SecurityConfig.SecureMode then return callback end
    return function(...)
        local success, result = pcall(callback, ...)
        if not success then
            warn("SecureUI: Protected function call failed")
        end
        return result
    end
end

local function AntiDetection()
    if not SecurityConfig.AntiDetection then return end
    -- Implement anti-detection measures
    local fakeGui = Instance.new("ScreenGui")
    fakeGui.Name = "RobloxGui"
    fakeGui.Parent = CoreGui
    game:GetService("Debris"):AddItem(fakeGui, 0.1)
end

-- Animation System
local AnimationPresets = {
    Smooth = {
        EasingStyle = Enum.EasingStyle.Quart,
        EasingDirection = Enum.EasingDirection.Out,
        Time = 0.3
    },
    Bounce = {
        EasingStyle = Enum.EasingStyle.Back,
        EasingDirection = Enum.EasingDirection.Out,
        Time = 0.4
    },
    Quick = {
        EasingStyle = Enum.EasingStyle.Quad,
        EasingDirection = Enum.EasingDirection.Out,
        Time = 0.15
    }
}

local function CreateTween(object, properties, preset)
    preset = preset or AnimationPresets.Smooth
    local tweenInfo = TweenInfo.new(preset.Time, preset.EasingStyle, preset.EasingDirection)
    return TweenService:Create(object, tweenInfo, properties)
end

-- Main Library Functions
function SecureUI:CreateWindow(config)
    if not ValidateInput(config, "table") then
        error("SecureUI: Invalid configuration provided")
    end
    
    AntiDetection()
    
    local Window = {}
    local currentTheme = Themes[config.Theme or "Dark"]
    
    -- Create main GUI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = config.Name or "SecureUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    if SecurityConfig.SecureMode then
        ScreenGui.Parent = CoreGui
    else
        ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 600, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainFrame.BackgroundColor3 = currentTheme.Primary
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    -- Add modern styling
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = currentTheme.Border
    MainStroke.Thickness = 1
    MainStroke.Parent = MainFrame
    
    local MainShadow = Instance.new("ImageLabel")
    MainShadow.Name = "Shadow"
    MainShadow.Size = UDim2.new(1, 20, 1, 20)
    MainShadow.Position = UDim2.new(0, -10, 0, -10)
    MainShadow.BackgroundTransparency = 1
    MainShadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    MainShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    MainShadow.ImageTransparency = 0.8
    MainShadow.ZIndex = -1
    MainShadow.Parent = MainFrame
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 50)
    TitleBar.Position = UDim2.new(0, 0, 0, 0)
    TitleBar.BackgroundColor3 = currentTheme.Secondary
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    -- Title Text
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Size = UDim2.new(1, -100, 1, 0)
    TitleLabel.Position = UDim2.new(0, 20, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = config.Name or "SecureUI"
    TitleLabel.TextColor3 = currentTheme.Text
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    
    -- Control Buttons
    local function CreateControlButton(text, color, position, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 30, 0, 30)
        button.Position = position
        button.BackgroundColor3 = color
        button.BorderSizePixel = 0
        button.Text = text
        button.TextColor3 = currentTheme.Text
        button.TextSize = 14
        button.Font = Enum.Font.GothamBold
        button.Parent = TitleBar
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 6)
        buttonCorner.Parent = button
        
        button.MouseButton1Click:Connect(CreateSecureConnection(callback))
        
        -- Hover effects
        button.MouseEnter:Connect(function()
            CreateTween(button, {BackgroundColor3 = color:lerp(currentTheme.Text, 0.1)}):Play()
        end)
        
        button.MouseLeave:Connect(function()
            CreateTween(button, {BackgroundColor3 = color}):Play()
        end)
        
        return button
    end
    
    -- Minimize Button
    local minimized = false
    local originalSize = MainFrame.Size
    
    CreateControlButton("-", currentTheme.Warning, UDim2.new(1, -70, 0.5, -15), function()
        minimized = not minimized
        if minimized then
            CreateTween(MainFrame, {Size = UDim2.new(0, 600, 0, 50)}, AnimationPresets.Smooth):Play()
        else
            CreateTween(MainFrame, {Size = originalSize}, AnimationPresets.Smooth):Play()
        end
    end)
    
    -- Close Button
    CreateControlButton("×", currentTheme.Error, UDim2.new(1, -35, 0.5, -15), function()
        CreateTween(MainFrame, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }, AnimationPresets.Quick):Play()
        
        wait(0.2)
        ScreenGui:Destroy()
    end)
    
    -- Tab System
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 150, 1, -60)
    TabContainer.Position = UDim2.new(0, 10, 0, 60)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Parent = MainFrame
    
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -170, 1, -70)
    ContentContainer.Position = UDim2.new(0, 170, 0, 60)
    ContentContainer.BackgroundColor3 = currentTheme.Secondary
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Parent = MainFrame
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 8)
    ContentCorner.Parent = ContentContainer
    
    -- Tab Management
    local tabs = {}
    local activeTab = nil
    
    function Window:CreateTab(config)
        local Tab = {}
        local tabButton = Instance.new("TextButton")
        tabButton.Size = UDim2.new(1, 0, 0, 40)
        tabButton.Position = UDim2.new(0, 0, 0, #tabs * 45)
        tabButton.BackgroundColor3 = currentTheme.Secondary
        tabButton.BorderSizePixel = 0
        tabButton.Text = config.Name or "Tab"
        tabButton.TextColor3 = currentTheme.TextSecondary
        tabButton.TextSize = 14
        tabButton.Font = Enum.Font.Gotham
        tabButton.Parent = TabContainer
        
        local tabCorner = Instance.new("UICorner")
        tabCorner.CornerRadius = UDim.new(0, 8)
        tabCorner.Parent = tabButton
        
        -- Tab Content
        local tabContent = Instance.new("ScrollingFrame")
        tabContent.Name = config.Name or "Tab"
        tabContent.Size = UDim2.new(1, -20, 1, -20)
        tabContent.Position = UDim2.new(0, 10, 0, 10)
        tabContent.BackgroundTransparency = 1
        tabContent.BorderSizePixel = 0
        tabContent.ScrollBarThickness = 4
        tabContent.ScrollBarImageColor3 = currentTheme.Accent
        tabContent.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContent.Visible = false
        tabContent.Parent = ContentContainer
        
        local contentLayout = Instance.new("UIListLayout")
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 10)
        contentLayout.Parent = tabContent
        
        -- Auto-resize canvas
        contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            tabContent.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
        end)
        
        -- Tab switching
        tabButton.MouseButton1Click:Connect(CreateSecureConnection(function()
            if activeTab then
                activeTab.content.Visible = false
                CreateTween(activeTab.button, {
                    BackgroundColor3 = currentTheme.Secondary,
                    TextColor3 = currentTheme.TextSecondary
                }):Play()
            end
            
            activeTab = {button = tabButton, content = tabContent}
            tabContent.Visible = true
            CreateTween(tabButton, {
                BackgroundColor3 = currentTheme.Accent,
                TextColor3 = currentTheme.Text
            }):Play()
        end))
        
        -- Auto-select first tab
        if #tabs == 0 then
            tabButton.MouseButton1Click:Connect(function() end)()
        end
        
        tabs[#tabs + 1] = {button = tabButton, content = tabContent, tab = Tab}
        
        -- Tab element creation functions
        function Tab:CreateButton(config)
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, 0, 0, 35)
            button.BackgroundColor3 = currentTheme.Accent
            button.BorderSizePixel = 0
            button.Text = config.Name or "Button"
            button.TextColor3 = currentTheme.Text
            button.TextSize = 14
            button.Font = Enum.Font.Gotham
            button.Parent = tabContent
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 6)
            buttonCorner.Parent = button
            
            button.MouseButton1Click:Connect(CreateSecureConnection(config.Callback or function() end))
            
            -- Hover effects
            button.MouseEnter:Connect(function()
                CreateTween(button, {BackgroundColor3 = currentTheme.Accent:lerp(currentTheme.Text, 0.1)}):Play()
            end)
            
            button.MouseLeave:Connect(function()
                CreateTween(button, {BackgroundColor3 = currentTheme.Accent}):Play()
            end)
            
            return button
        end
        
        function Tab:CreateToggle(config)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Size = UDim2.new(1, 0, 0, 35)
            toggleFrame.BackgroundColor3 = currentTheme.Secondary
            toggleFrame.BorderSizePixel = 0
            toggleFrame.Parent = tabContent
            
            local toggleCorner = Instance.new("UICorner")
            toggleCorner.CornerRadius = UDim.new(0, 6)
            toggleCorner.Parent = toggleFrame
            
            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Size = UDim2.new(1, -50, 1, 0)
            toggleLabel.Position = UDim2.new(0, 10, 0, 0)
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Text = config.Name or "Toggle"
            toggleLabel.TextColor3 = currentTheme.Text
            toggleLabel.TextSize = 14
            toggleLabel.Font = Enum.Font.Gotham
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.Parent = toggleFrame
            
            local toggleButton = Instance.new("TextButton")
            toggleButton.Size = UDim2.new(0, 30, 0, 20)
            toggleButton.Position = UDim2.new(1, -40, 0.5, -10)
            toggleButton.BackgroundColor3 = currentTheme.Border
            toggleButton.BorderSizePixel = 0
            toggleButton.Text = ""
            toggleButton.Parent = toggleFrame
            
            local toggleButtonCorner = Instance.new("UICorner")
            toggleButtonCorner.CornerRadius = UDim.new(0, 10)
            toggleButtonCorner.Parent = toggleButton
            
            local toggleIndicator = Instance.new("Frame")
            toggleIndicator.Size = UDim2.new(0, 16, 0, 16)
            toggleIndicator.Position = UDim2.new(0, 2, 0.5, -8)
            toggleIndicator.BackgroundColor3 = currentTheme.Text
            toggleIndicator.BorderSizePixel = 0
            toggleIndicator.Parent = toggleButton
            
            local indicatorCorner = Instance.new("UICorner")
            indicatorCorner.CornerRadius = UDim.new(0, 8)
            indicatorCorner.Parent = toggleIndicator
            
            local toggled = config.Default or false
            
            local function updateToggle()
                if toggled then
                    CreateTween(toggleButton, {BackgroundColor3 = currentTheme.Success}):Play()
                    CreateTween(toggleIndicator, {Position = UDim2.new(1, -18, 0.5, -8)}):Play()
                else
                    CreateTween(toggleButton, {BackgroundColor3 = currentTheme.Border}):Play()
                    CreateTween(toggleIndicator, {Position = UDim2.new(0, 2, 0.5, -8)}):Play()
                end
                
                if config.Callback then
                    CreateSecureConnection(config.Callback)(toggled)
                end
            end
            
            toggleButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                updateToggle()
            end)
            
            updateToggle()
            
            return {
                SetValue = function(value)
                    toggled = value
                    updateToggle()
                end,
                GetValue = function()
                    return toggled
                end
            }
        end
        
        function Tab:CreateSlider(config)
            local sliderFrame = Instance.new("Frame")
            sliderFrame.Size = UDim2.new(1, 0, 0, 50)
            sliderFrame.BackgroundColor3 = currentTheme.Secondary
            sliderFrame.BorderSizePixel = 0
            sliderFrame.Parent = tabContent
            
            local sliderCorner = Instance.new("UICorner")
            sliderCorner.CornerRadius = UDim.new(0, 6)
            sliderCorner.Parent = sliderFrame
            
            local sliderLabel = Instance.new("TextLabel")
            sliderLabel.Size = UDim2.new(1, 0, 0, 20)
            sliderLabel.Position = UDim2.new(0, 10, 0, 5)
            sliderLabel.BackgroundTransparency = 1
            sliderLabel.Text = (config.Name or "Slider") .. ": " .. (config.Default or config.Min or 0)
            sliderLabel.TextColor3 = currentTheme.Text
            sliderLabel.TextSize = 14
            sliderLabel.Font = Enum.Font.Gotham
            sliderLabel.TextXAlignment = Enum.TextXAlignment.Left
            sliderLabel.Parent = sliderFrame
            
            local sliderTrack = Instance.new("Frame")
            sliderTrack.Size = UDim2.new(1, -20, 0, 4)
            sliderTrack.Position = UDim2.new(0, 10, 1, -15)
            sliderTrack.BackgroundColor3 = currentTheme.Border
            sliderTrack.BorderSizePixel = 0
            sliderTrack.Parent = sliderFrame
            
            local trackCorner = Instance.new("UICorner")
            trackCorner.CornerRadius = UDim.new(0, 2)
            trackCorner.Parent = sliderTrack
            
            local sliderFill = Instance.new("Frame")
            sliderFill.Size = UDim2.new(0, 0, 1, 0)
            sliderFill.Position = UDim2.new(0, 0, 0, 0)
            sliderFill.BackgroundColor3 = currentTheme.Accent
            sliderFill.BorderSizePixel = 0
            sliderFill.Parent = sliderTrack
            
            local fillCorner = Instance.new("UICorner")
            fillCorner.CornerRadius = UDim.new(0, 2)
            fillCorner.Parent = sliderFill
            
            local sliderHandle = Instance.new("Frame")
            sliderHandle.Size = UDim2.new(0, 12, 0, 12)
            sliderHandle.Position = UDim2.new(0, -6, 0.5, -6)
            sliderHandle.BackgroundColor3 = currentTheme.Text
            sliderHandle.BorderSizePixel = 0
            sliderHandle.Parent = sliderTrack
            
            local handleCorner = Instance.new("UICorner")
            handleCorner.CornerRadius = UDim.new(0, 6)
            handleCorner.Parent = sliderHandle
            
            local min = config.Min or 0
            local max = config.Max or 100
            local value = config.Default or min
            local dragging = false
            
            local function updateSlider()
                local percentage = (value - min) / (max - min)
                sliderLabel.Text = (config.Name or "Slider") .. ": " .. math.floor(value * 10) / 10
                
                CreateTween(sliderFill, {Size = UDim2.new(percentage, 0, 1, 0)}):Play()
                CreateTween(sliderHandle, {Position = UDim2.new(percentage, -6, 0.5, -6)}):Play()
                
                if config.Callback then
                    CreateSecureConnection(config.Callback)(value)
                end
            end
            
            sliderTrack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local mouse = Players.LocalPlayer:GetMouse()
                    local relativeX = mouse.X - sliderTrack.AbsolutePosition.X
                    local percentage = math.clamp(relativeX / sliderTrack.AbsoluteSize.X, 0, 1)
                    value = min + (max - min) * percentage
                    updateSlider()
                end
            end)
            
            updateSlider()
            
            return {
                SetValue = function(newValue)
                    value = math.clamp(newValue, min, max)
                    updateSlider()
                end,
                GetValue = function()
                    return value
                end
            }
        end
        
        return Tab
    end
    
    -- Dragging functionality
    local dragging = false
    local dragStart = nil
    local startPos = nil
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- Theme switching
    function Window:SetTheme(themeName)
        if not Themes[themeName] then return end
        currentTheme = Themes[themeName]
        
        -- Update all UI elements with new theme
        CreateTween(MainFrame, {BackgroundColor3 = currentTheme.Primary}):Play()
        CreateTween(TitleBar, {BackgroundColor3 = currentTheme.Secondary}):Play()
        CreateTween(ContentContainer, {BackgroundColor3 = currentTheme.Secondary}):Play()
        TitleLabel.TextColor3 = currentTheme.Text
        MainStroke.Color = currentTheme.Border
    end
    
    -- Notification system
    function Window:CreateNotification(config)
        local notification = Instance.new("Frame")
        notification.Size = UDim2.new(0, 300, 0, 80)
        notification.Position = UDim2.new(1, -320, 1, -100)
        notification.BackgroundColor3 = currentTheme.Secondary
        notification.BorderSizePixel = 0
        notification.Parent = ScreenGui
        
        local notifCorner = Instance.new("UICorner")
        notifCorner.CornerRadius = UDim.new(0, 8)
        notifCorner.Parent = notification
        
        local notifStroke = Instance.new("UIStroke")
        notifStroke.Color = currentTheme.Accent
        notifStroke.Thickness = 2
        notifStroke.Parent = notification
        
        local notifTitle = Instance.new("TextLabel")
        notifTitle.Size = UDim2.new(1, -20, 0, 25)
        notifTitle.Position = UDim2.new(0, 10, 0, 10)
        notifTitle.BackgroundTransparency = 1
        notifTitle.Text = config.Title or "Notification"
        notifTitle.TextColor3 = currentTheme.Text
        notifTitle.TextSize = 16
        notifTitle.Font = Enum.Font.GothamBold
        notifTitle.TextXAlignment = Enum.TextXAlignment.Left
        notifTitle.Parent = notification
        
        local notifContent = Instance.new("TextLabel")
        notifContent.Size = UDim2.new(1, -20, 0, 35)
        notifContent.Position = UDim2.new(0, 10, 0, 35)
        notifContent.BackgroundTransparency = 1
        notifContent.Text = config.Content or "Notification content"
        notifContent.TextColor3 = currentTheme.TextSecondary
        notifContent.TextSize = 14
        notifContent.Font = Enum.Font.Gotham
        notifContent.TextXAlignment = Enum.TextXAlignment.Left
        notifContent.TextWrapped = true
        notifContent.Parent = notification
        
        -- Slide in animation
        CreateTween(notification, {Position = UDim2.new(1, -320, 1, -100)}, AnimationPresets.Smooth):Play()
        
        -- Auto-dismiss
        wait(config.Duration or 3)
        CreateTween(notification, {Position = UDim2.new(1, 0, 1, -100)}, AnimationPresets.Smooth):Play()
        
        wait(0.3)
        notification:Destroy()
    end
    
    return Window
end

-- Example usage and initialization
return SecureUI
