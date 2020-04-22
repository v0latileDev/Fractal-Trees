local Tree_Module = require(game.ReplicatedStorage.Tree)
local TreeFolder = game.Workspace.TreeFolder:GetChildren()

for i = 1, #TreeFolder do
	local Start = TreeFolder[i]

	local Tree = Tree_Module.new()
	Tree:Branch(Start, 10)
end
