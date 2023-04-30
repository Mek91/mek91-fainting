local QBCore = exports['qb-core']:GetCoreObject()

Langue = {}

if Mek91_Fainting.LangueSelect == "TR" then 
	Langue = Mek91_Fainting.TR
elseif Mek91_Fainting.LangueSelect == "EN" then 
	Langue = Mek91_Fainting.EN
end

RegisterCommand('+' .. Langue.Command, function()
    if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
        QBCore.Functions.Notify(Langue.NoFaintingInCar, 'error', 3000) 
    else 
        Mek91eBayiliyorumYa()
    end
end)

function Mek91eBayiliyorumYa()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            exports['qb-core']:DrawText('[E] '.. Langue.PressOffFainting)
            SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)

            if IsControlJustPressed(0, 38) then
                exports['qb-core']:HideText()
                break
            end
        end
    end)
end

RegisterKeyMapping('+' .. Langue.Command, Langue.KeyMappingText, 'keyboard', Mek91_Fainting.FaintKey)