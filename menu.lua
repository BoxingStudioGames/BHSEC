local widget = require( "widget" )

local date = os.date( "*t")

 print (date.year,date.month,date.day)

 local storyboard = require("storyboard")

 local scene = storyboard.newScene()
--[[
local Bg_Images = {
  
  "bg/bard01.png",
  "images/bard01.JPG",
  "images/dwill.jpg",
  "images/teacher01.jpg",
  "images/pablo1.jpg"

}
--]]
--local first_chose = math.random(#Bg_Images)

local stage = 1 

 function scene:createScene(event)
  
  local screenGroup = self.view
 
local background = display.newRect(0,0,320,570)
background:setFillColor( 225,225,225)
background.x = display.contentCenterX
background.y = display.contentCenterY
screenGroup:insert(background)


bardImages = display.newImageRect("bg/bard01.png",300,200)
bardImages.x = display.contentCenterX; 
bardImages.y = display.contentCenterY;
bardImages.alpha = 1 
screenGroup:insert(bardImages)

bardImages02 = display.newImageRect("images/bard01.JPG",320,570)
bardImages02.x = display.contentCenterX; 
bardImages02.y = display.contentCenterY;
bardImages02.alpha = 0
screenGroup:insert(bardImages02)


bardImages03 = display.newImageRect("images/dwill.jpg",320,570)
bardImages03.x = display.contentCenterX; 
bardImages03.y = display.contentCenterY;
bardImages03.alpha = 0
screenGroup:insert(bardImages03)


bardImages04 = display.newImageRect("images/teacher01.jpg",320,570)
bardImages04.x = display.contentCenterX; 
bardImages04.y = display.contentCenterY;
bardImages04.alpha = 0
screenGroup:insert(bardImages04)


bardImages05 = display.newImageRect("images/pablo1.jpg",320,570)
bardImages05.x = display.contentCenterX; 
bardImages05.y = display.contentCenterY;
bardImages05.alpha = 0
screenGroup:insert(bardImages05)


menuButton = widget.newButton {

x = display.contentCenterX,
y = display.contentCenterY+200,
width = 100,
height = 50,
defaultFile = "taps/button01.png",
overFile = "taps/button02.png",
onEvent = polls, 
}

screenGroup:insert(menuButton)

code = widget.newButton {

x = display.contentCenterX+100,
y = display.contentCenterY+220,
width = 64,
height = 64,
defaultFile = "taps/side01.png",
overFile = "taps/side02.png",
onEvent = admin, 
}

screenGroup:insert(code)


 end  -- end of create scene
 
 
 function changeInti_bg ()
 
if (stage == 1) then 

transition.to( bardImages, {alpha = 0, time = 1000 , delay = 2000, onComplete  = nil } )

transition.to( bardImages02, {alpha = 1, time = 2000 , delay = 3000, onComplete  = nil } )

stage = 2

else if (stage == 2 ) then 

transition.to( bardImages02, {alpha = 0, time = 1000 , delay = 2000, onComplete  = nil } )

transition.to( bardImages03, {alpha = 1, time = 2000 , delay = 3000, onComplete  = nil } )

stage = 3

else if (stage == 3 ) then 

transition.to( bardImages03, {alpha = 0, time = 1000 , delay = 2000, onComplete  = nil } )

transition.to( bardImages04, {alpha = 1, time = 2000 , delay = 3000, onComplete  = nil } )

stage = 4

else if (stage == 4 ) then 

transition.to( bardImages04, {alpha = 0, time = 1000 , delay = 2000, onComplete  = nil } )

transition.to( bardImages05, {alpha = 1, time = 2000 , delay = 3000, onComplete  = nil } )

stage = 5
else if (stage == 5 ) then 

transition.to( bardImages05, {alpha = 0, time = 1000 , delay = 2000, onComplete  = nil } )

transition.to( bardImages, {alpha = 1, time = 2000 , delay = 3000, onComplete  = nil } )

stage = 1
              end 
           end 
        end 
     end 
  end 
 end
 
 timer01=timer.performWithDelay( 5000 , changeInti_bg , 0  )


 function polls ( event )
   
   if (event.phase == "ended"  and date.month == 12  and date.day == 18 ) then 
   
   print ("show polls ")


  else if  (event.phase == "ended" and date.month ~= 12 and date.day ~=18) then 

    print ("Sorry the polls are not open at this point")

    native.showAlert( "Bard Newark", "Sorry your not able to vote yet. You will be able to vote on December 18, 2014" , { "ok" } )

   
       end 
    end 
 end
  
function admin ( event)
  
--password = native.newTextField( 0, 0, 200, 200, inputListener )
--password.x = display.contentCenterX
--password.y = display.contentCenterY
--password.inputType = "default" 
--password.isSecure = true
print ("password")
end


  function scene:enterScene(event)
  



  end 
 
 
 
 
  function scene:exitScene(event)
 
 
 
   	
  end
  
   function scene:destroyScene(event)
   
   end


scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene) 
scene:addEventListener("exitScene",scene) 
scene:addEventListener("destroyScene",scene) 

return scene
