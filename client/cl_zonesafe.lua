local dansSafeZone = false 
local horsSafeZone = false 
local radius = 100000 -- Taille de la zone



local zones = {
	{ ['x'] = 225.1851, ['y'] = -800.8318, ['z'] = 30.63163 }, -- Parking Central
	{ ['x'] = 438.78, ['y'] = -986.67, ['z'] = 30.72 }, -- Comico
	{ ['x'] = -1867.28, ['y'] = -352.62, ['z'] = 58.03 }, -- EMS
}

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(3)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < radius then
				radius = dist
				zoneProche = i
			end
		end
		Citizen.Wait(15000)
	end
end)

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		Citizen.Wait(3)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(zones[zoneProche].x, zones[zoneProche].y, zones[zoneProche].z, x, y, z)
		local sleep = true
	
		if dist <= 60.0 then 
			if not dansSafeZone then																			 
				NetworkSetFriendlyFireOption(false)
				ClearPlayerWantedLevel(PlayerId())
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
				DansSafeZone()
				dansSafeZone = true
				horsSafeZone = false
			end
		else
			if not horsSafeZone then
				NetworkSetFriendlyFireOption(true)
				PasDansSafeZone()
				horsSafeZone = true
				dansSafeZone = false
			end
		end
		if dansSafeZone then  
			sleep = false
			DisableControlAction(2, 37, true)  
			DisablePlayerFiring(player,true) 
      		DisableControlAction(0, 106, true) 
			DisableControlAction(0,24,true) 
			DisableControlAction(0,25,true) 
			DisableControlAction(0,47,true) 
			DisableControlAction(0,58,true) 
			DisableControlAction(0,263,true) 
			DisableControlAction(0,264,true) 
			DisableControlAction(0,257,true) 
			DisableControlAction(0,140,true) 
			DisableControlAction(0,141,true) 
			DisableControlAction(0,142,true) 
			DisableControlAction(0,143,true) 
			if IsDisabledControlJustPressed(2, 37) then
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) 
			end
			if IsDisabledControlJustPressed(0, 106) then 
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) 
			end
		end

		if (sleep == true) then
			Citizen.Wait(1250)
		end
	end
end)

function DansSafeZone()
	SendNUIMessage({
		action = 'show'
	})
end

function PasDansSafeZone()
	SendNUIMessage({
		action = 'hide'
	})
end


