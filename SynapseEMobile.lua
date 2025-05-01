-- Synapse E Compact Executor (Mobile Patched)
local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "SynapseE_Compact"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0.6, 0, 0.4, 0)
frame.Position = UDim2.new(0.4, 0, 0.55, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
frame.Active = true
frame.Draggable = true

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -80, 0, 30)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "Synapse E - Mobile"
title.TextColor3 = Color3.fromRGB(0, 255, 170)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

local minimize = Instance.new("TextButton", frame)
minimize.Size = UDim2.new(0, 30, 0, 25)
minimize.Position = UDim2.new(1, -70, 0, 2)
minimize.Text = "-"
minimize.TextSize = 20
minimize.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
minimize.Font = Enum.Font.GothamBold
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)

local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 30, 0, 25)
close.Position = UDim2.new(1, -35, 0, 2)
close.Text = "X"
close.TextSize = 18
close.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
close.Font = Enum.Font.GothamBold
close.TextColor3 = Color3.fromRGB(255, 255, 255)

local scroll = Instance.new("ScrollingFrame", frame)
scroll.Position = UDim2.new(0.05, 0, 0, 35)
scroll.Size = UDim2.new(0.9, 0, 0.5, 0)
scroll.CanvasSize = UDim2.new(0, 0, 2, 0)
scroll.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 6
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local scriptBox = Instance.new("TextBox", scroll)
scriptBox.Size = UDim2.new(1, -10, 0, 500)
scriptBox.Position = UDim2.new(0, 5, 0, 0)
scriptBox.TextWrapped = true
scriptBox.ClearTextOnFocus = false
scriptBox.Font = Enum.Font.Code
scriptBox.TextSize = 16
scriptBox.Text = "-- Paste your script here"
scriptBox.TextColor3 = Color3.fromRGB(0, 255, 170)
scriptBox.BackgroundTransparency = 1
scriptBox.TextXAlignment = Enum.TextXAlignment.Left
scriptBox.TextYAlignment = Enum.TextYAlignment.Top
scriptBox.MultiLine = true

local exec = Instance.new("TextButton", frame)
exec.Position = UDim2.new(0.05, 0, 1, -50)
exec.Size = UDim2.new(0.425, 0, 0, 40)
exec.Text = "Execute"
exec.Font = Enum.Font.GothamBold
exec.TextSize = 16
exec.BackgroundColor3 = Color3.fromRGB(0, 170, 127)
exec.TextColor3 = Color3.fromRGB(255, 255, 255)

local clear = Instance.new("TextButton", frame)
clear.Position = UDim2.new(0.525, 0, 1, -50)
clear.Size = UDim2.new(0.425, 0, 0, 40)
clear.Text = "Clear"
clear.Font = Enum.Font.GothamBold
clear.TextSize = 16
clear.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
clear.TextColor3 = Color3.fromRGB(255, 255, 255)

exec.MouseButton1Click:Connect(function()
	local s = scriptBox.Text
	local ok, err = pcall(function()
		local f = loadstring(s)
		setfenv(f, getgenv()) -- full global env access
		f()
	end)
	if not ok then warn("Executor error: "..err) end
end)

clear.MouseButton1Click:Connect(function()
	scriptBox.Text = ""
end)

close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

local minimized = false
minimize.MouseButton1Click:Connect(function()
	minimized = not minimized
	scroll.Visible = not minimized
	exec.Visible = not minimized
	clear.Visible = not minimized
end)
