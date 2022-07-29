-- Longo Development-- 
isNear = false -- You can delete this, if any developers want to code something in this, then this can be an option for you!

-- Do not recommend touching stuff if you don't know what you are doing

Citizen.CreateThread(function()
    local coords = GetEntityCoords(PlayerPedId())
	local location = Config.Location
		while true do
			Citizen.Wait(1)
			if Vdist(GetEntityCoords(PlayerPedId()), location) < Config.Distance then
				Draw3DText(Config.Location.x, Config.Location.y, Config.Location.z, "Press ~g~[E] ~w~to get your ~b~LEO ~w~Loadout!", 0.4)
				if Vdist(GetEntityCoords(PlayerPedId()), location) < Config.ClickDistance and IsControlJustReleased(0, 38) then
					if not IsPedArmed(PlayerPedId(), 4) and not IsPedDeadOrDying(PlayerPedId(), true) then
						GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), 6000, false, true)
						GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), 6000, false, false)
						GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_STUNGUN"), 6000, false, false)
						GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_FLASHLIGHT"), 6000, false, false)
						--GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_PUMPSHOTGUN"), 6000, false, false) -- If you have a beanbag shotgun then you can uncomment this
						GiveWeaponComponentToPed(PlayerPedId(), GetHashKey('WEAPON_CARBINERIFLE'), 0x7BC4CDDC)
						GiveWeaponComponentToPed(PlayerPedId(), GetHashKey('WEAPON_CARBINERIFLE'), 	0xA0D89C42)
						GiveWeaponComponentToPed(PlayerPedId(), GetHashKey('WEAPON_CARBINERIFLE'), 	0xC164F53)
						GiveWeaponComponentToPed(PlayerPedId(), GetHashKey('WEAPON_COMBATPISTOL'), 	0x359B7AAE)
						--GiveWeaponComponentToPed(PlayerPedId(), GetHashKey('WEAPON_PUMPSHOTGUN'), 	0x7BC4CDDC) -- Un comment if you have a beanbag shotgun
						text("Loadout ~g~Added!") -- Text after loadout recieved 
					end
				end
			end
		end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
			if Vdist(GetEntityCoords(PlayerPedId()), Config.RemoveLocation) < Config.RemoveDistance then
				Draw3DText(Config.RemoveLocation.x, Config.RemoveLocation.y, Config.RemoveLocation.z, "Press ~b~[X] ~w~to ~r~REMOVE ~w~weapons!", 0.4)
			end
			if Vdist(GetEntityCoords(PlayerPedId()), Config.RemoveLocation) < Config.RemoveClick and IsControlJustReleased(0, 73) then
				RemoveAllPedWeapons(PlayerPedId(), false)
				text("Loadout ~r~Removed!")
		end
	end
end)


function Draw3DText(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(true)
	SetTextColour(255, 255, 255, 215)
	AddTextComponentString(text)
	DrawText(_x, _y)
	local factor = (string.len(text)) / 700
	DrawRect(_x, _y + 0.0150, 0.06 + factor, 0.03, 41, 11, 41, 100)
end

function text(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, true)
end