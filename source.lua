--[[
	Quick and Easy tool for collecting and maintained memory.
]]--

local Garbage = {}
Garbage.__index = Garbage

--[[
	@maintain Garbage as class
	@Garbage.new(): garbage class
]]--
function Garbage.new()
	return setmetatable({}, Garbage)
end





--[[
	@assort tostring as v
	@private
]]--
function Garbage._tostring(v)
	return tostring(v)
end






--@Garbage:Add(): method @add metatable "garbage.new()" as !returned
--[[
	@chainable Method
	@garbage.add(_): self as metatable "garbage.new()" as !returned
]]--
function Garbage:Add(_function, v: string?)
	v = v and Garbage._tostring(v) or Garbage._tostring(_function)
	self[v] = _function
	return self
end

--@Garbage:Remove()
--@as document in @garbage.add => @chainable
function Garbage:Remove(v: string?)
	v = Garbage._tostring(v)
	if self[v] then
		self[v]:Disconnect()
		self[v] = nil
	end
	return self
end










--[[
	@endmethod "Dump"
	@remove/disconnect all connections
]]--
function Garbage:Dump()
	for _, __: RBXScriptConnection in pairs(self) do
		__:Disconnect()
	end
	self = nil
end

--[[
	@endmethod "DumpBags"
	@remove/disconnect all connections
	
	returnable variation of Dump
]]--
function Garbage:DumpBags()
	for _, __: RBXScriptConnection in pairs(self) do
		__:Disconnect()
	end
	return self
end

return Garbage
