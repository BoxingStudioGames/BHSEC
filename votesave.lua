local json = require("json")

--- this file save the table and convert it json so it can be saved in Ducuments directory

function  saveTable (t, filename)

local path = system.pathForFile( filename, system.DocumentsDirectory )

local file = io.open( path, "w")

if file then 
print "file"
	local contents = json.encode( t )

	file:write( contents )

	io.close( file )                     

	return true

else 

	return false

 	
    end 

end 

function  loadTable (filename)
	
local path = system.pathForFile( filename, system.DocumentsDirectory )

local file = io.open( path, "r" )

if file then 

	-- convert to string 

local contents = file:read("*a")

-- once encode convert to a table 

local tb = {}

tb  = json.decode( contents )

io.close(file)

return tb 

else 

return nil 

end

end 





