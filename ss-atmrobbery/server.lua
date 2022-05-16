local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ss-atmrobbery:addmoney", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddMoney('cash', Config.RewardCash, 'ATM Robbery finished')
    end
end)