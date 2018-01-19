
local storyboard = require("storyboard")

local voteSaver = require("votesave")

local widget = require("widget")

local sqlite = require("sqlite3") 

local json = require("json")

local mime = require ( "mime" )

local decode 

local substing

local jsonTable

local votes01 = 0
-- sending out data url 
local URL = "http://boxingtester.site40.net/index.php?votes01="..mime.b64(votes01)

----sqlite----------------------------------------


Rate = loadTable  ("Rate.txt")
--RateLoad = Rate["RateTable"]  


function  Ratus ( event )

if Rate == nil then 

print "..............creating Rate data..................."

 Rate = {}

Rate["RateTable"] = 0

saveTable (Rate,"Rate.txt")

return true 
 
else if Rate ~= nil then 

print "..............Loading Rate data......................."

 Rate = loadTable  ("Rate.txt")
 RateLoad = Rate["RateTable"]  


return false
end 
end
end 

Ratus();


local Josh_Votes = 0


local backgroundcolor = display.newRect(0,0,320,570)
backgroundcolor:setFillColor( 225,225,225)
backgroundcolor.x = display.contentCenterX; 
backgroundcolor.y = display.contentCenterY;

local text01 = display.newText( ""..votes01 ,0,0,native.systemFontBold, 20)
text01.x = display.contentCenterX 
text01.y = display.contentCenterY-40
text01:setFillColor( 0,0,0 )


local path = system.pathForFile( "SchoolVote.db", system.DocumentsDirectory )
local db = sqlite3.open (path)

local tablesetup = [[CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY, actor, dislikes,likes, Votes);]]
db:exec( tablesetup )
---print(tablesetup)


--local tablefill =[[INSERT INTO test VALUES (NULL, 'Josh', ']] .. Josh_Votes..[[');]]
--db:exec( tablefill )


function  callBack ( event  )
	
	if event.isError then 

		print "cool"


	else 

		print "print uploaded"



end

end 

function  postData (event )


  if event.isError then 

  print ("sorry Network problem") 
else 

print ("From 000webhost server "..event.response)

end 
end


function  update_Data(votes)
  
print (votes)
local url = "http://boxingtester.site40.net/index.php?votes01="..mime.b64(votes)
network.request( url , "GET", networkListener01)

print (url) 

end

function  addVote ( event )

	 if (event.phase  == "ended") then 


	 votes01= votes01 +1
	  text01.text = votes01
   
   update_Data(votes01)

	  Rate["RateTable"] = jsonTable

	  saveTable (Rate,"Rate.txt")
  

	  --- update data -------
--local q = [[UPDATE test SET Votes = ]].. Josh_Votes ..[[ WHERE id =1;]]
--print (q)
---db:exec(q)


end 
end


local button01=widget.newButton{

x = display.contentCenterX,
y = display.contentCenterY,
label = "Vote!",
onEvent = addVote

}
---------------
local  jsonTable = {}

 

function  decoder ( event )
  
   
    substing = string.sub( decode, 1, 80 )
      
     print ("this is the string"..substing)


     jsonTable=json.decode( substing )

     print (jsonTable.Actors1[2])

     print (jsonTable.Actors2[2])
     
      
 end 


function networkListener( event )
 
  if ( event.isError ) then
    print( "Network error!")
  else
    --myNewData = event.response
    print ("From server: "..event.response)
     decode = event.response 


   decoder()
    

  end
 
end

--http://api.geonames.org/postalCodeLookupJSON?postalcode=6600&country=AT&username=demo

network.request( "http://boxingtester.site40.net/index.php", "GET", networkListener)


print ("app url "..  URL)

 function networkListener01( event )

    if ( event.isError ) then
        print( "Network error!" )
    else
        ---print ( "RESPONSEEd: " .. event.response )

    end
end

network.request( URL, "GET", networkListener01) 


