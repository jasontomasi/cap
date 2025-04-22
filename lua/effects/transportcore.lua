local matLight 		= Material( "sprites/light_ignorez" )

function EFFECT:Init( data )

 	local size = 1000
 	self.Entity:SetCollisionBounds( Vector( -size,-size,-size ), Vector( size,size,size ) )
 	self.Pos 	= data:GetOrigin()
 	self.Alpha = 1000
	self.Up=true
	self.Number=CurTime()+math.random(25,100)
	if (math.ceil(data:GetMagnitude())==0) then
		self.Atlantis = true;
	end

end

function EFFECT:Think()

 	local dlight = DynamicLight(self.Number)
 	if ( dlight ) then
 		dlight.Pos = self:GetPos()
 		dlight.r = 255
 		dlight.g = 255
 		dlight.b = 255
 		dlight.Brightness = 2
 		dlight.Decay = 1
 		if (self.Atlantis) then
 			dlight.Size = 1900
 		else
 			dlight.Size = 1900
 		end
 		dlight.DieTime = CurTime() + 0.01
 	end

 	--local speed = FrameTime()
 	if self.Up then
 		self.Alpha = self.Alpha + 15
		if self.Alpha>350 then
			self.Up=false
		end
 	else
		self.Alpha = self.Alpha - 10
	end
 	if (self.Alpha < 0 ) then return false end
 	return true
end

function EFFECT:Render()
	render.SetMaterial( matLight )
	render.DrawSprite(self.Pos, 900, 900, Color(255,255,255,math.Clamp(self.Alpha,0,255)))
end
