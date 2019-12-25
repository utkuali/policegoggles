ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    PlayerData = ESX.GetPlayerData()

    while PlayerData.job.name == "police" do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if GetPedPropIndex(ped, 0) == 116 then
            SetNightvision(true)
            SetSeethrough(false)
        elseif GetPedPropIndex(ped, 0) == 118 then
            SetSeethrough(true)
            SetNightvision(false)
        else
            SetSeethrough(false)
            SetNightvision(false)
        end
    end
end)