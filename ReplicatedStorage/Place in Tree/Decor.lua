local module = {}

function module.RetH(Percentage)
	local Change	= Percentage or math.random(1, 100)/100
	return Change
end

local Cap = 45

function module.angle(Angle)
	local X	= Angle or math.rad(math.random(-Cap,Cap))
	return X
end


function module.Leaf(CF, Color, S)
	local Leaf = Instance.new("Part")
	Leaf.Anchored = true
	Leaf.Size = Vector3.new(S,S,S)
	Leaf.CFrame = CF * CFrame.fromEulerAnglesXYZ(module.angle(360),module.angle(360),module.angle(360))
	Leaf.BrickColor = Color
	Leaf.Material = Enum.Material.Grass
	Leaf.Parent = game.Workspace
end

function module.New_Branch(Previous, Size, CF)
	local PreviousSize = Previous.Size.Y/2
	local Part			= script.Parent.Cylinder:Clone()
	Part.Anchored 		= true
	Part.Size 			= Size
	Part.Color 			= Color3.fromRGB(86, 66, 54)
	Part.Material 		= Enum.Material.SmoothPlastic
	Part.CFrame 		= Previous.CFrame * CF
	Part.Parent 		= Previous.Parent
	
	return Part
end



return module
