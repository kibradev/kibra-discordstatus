ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand("onlinesunucu", function()
    TriggerServerEvent("kibra-discordstatus:serveronline")
end)

RegisterCommand("kapalisunucu", function()
    TriggerServerEvent("kibra-discordstatus:offonline")
end)