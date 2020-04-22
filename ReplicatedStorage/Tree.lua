local Tree = {}
Tree.__index = Tree

local Decor = require(script.Decor)

function Tree.new()
	local Fractal = {}
    setmetatable(Fractal, Tree)
	Fractal.First 		= true
	Fractal.Consistent	= false
	return Fractal
end

local Size = 2 -- Width
local rotate = CFrame.fromEulerAnglesXYZ -- Shortcut
local Branches = 3 -- Branches out into 3 branches
local AngleCap = 45 -- Max rotation
local Height_Limit = 1 -- Shortest it can go


function Tree:Branch(Previous_Part, Height)
    if Height < Height_Limit then  Decor.Leaf(Previous_Part.CFrame, BrickColor.Green(), Size*2) return end -- To end the tree checking branch height otherwise it will lag tremendously
    
    local Previous_HalfSize    = Previous_Part.Size.Y/2
    local Previous_CFrame        = CFrame.new(Previous_Part.CFrame.X, Previous_HalfSize, Previous_Part.CFrame.Z)
    
    if self.First then -- Checking if it's the trunk
        local Branch_Size        = Vector3.new(Size, Height, Size) -- 3d size
		print(Previous_Part, Branch_Size, Previous_HalfSize, Height, type(Decor.New_Branch))
        local Current_Branch    = Decor.New_Branch(Previous_Part, Branch_Size, CFrame.new(0, (Previous_HalfSize + Height/2) , 0)) -- Creating a new branch
        local Current_HalfSize = Current_Branch.Size.Y/2 -- Branch Half Height
        
        
        Tree:Branch(Current_Branch,  Height * Decor.RetH(.67), Previous_CFrame)-- Creating a new branch
        self.First                = not self.First -- Saying the trunk has already been passed so it can disable it
    else
        for i = 1, Branches do
            local Branch_Size        = Vector3.new(Size, Height, Size)
            local Current_Branch    = Decor.New_Branch(Previous_Part, Branch_Size, CFrame.new(0, (Previous_HalfSize) , 0)) -- Creating a new branch
            local Current_HalfSize    = Current_Branch.Size.Y/2  -- Branch Half Height
            local MoveUpCF            = CFrame.new(0,Current_HalfSize,0)  -- CF to move the branch up
            
            Current_Branch.CFrame    = Current_Branch.CFrame * rotate(-Decor.angle(), 0, Decor.angle()) -- Rotating branch
            Current_Branch.CFrame    = Current_Branch.CFrame:ToWorldSpace(MoveUpCF) -- Moving the branch up
            Tree:Branch(Current_Branch,  Height * Decor.RetH(.67), Previous_CFrame) -- Creating Shorter Branch
        end
    end
end

return Tree
