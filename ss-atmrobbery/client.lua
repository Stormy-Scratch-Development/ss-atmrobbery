local QBCore = exports['qb-core']:GetCoreObject()
local CurrentCops = 0


RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('ss-atmrobbery:rob')
AddEventHandler('ss-atmrobbery:rob', function(data)
    if CurrentCops >= Config.MinimumCops then
    exports["memorygame"]:thermiteminigame(Config.CorrectBlocks, Config.IncorrectBlocks, Config.TimeToShow, Config.TimeToLose,
    function()
        QBCore.Functions.Progressbar("rob", "Robbing ATM...", 4000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@heists@prison_heistig1_p1_guard_checks_bus",
            anim = "loop",
            flags = 49,
        }, {}, {}, function()
            QBCore.Functions.Notify("You Robed the atm!", "success")
            exports['qb-dispatch']:ATMRobbery()
            TriggerServerEvent("ss-atmrobbery:addmoney")
        end, function()
            exports['qb-dispatch']:ATMRobbery()
            QBCore.Functions.Notify("Canceled...", "error")
        end)
    end)
    else
        QBCore.Functions.Notify("Not Enough Police (2 Required)", "error")
    end
end)

local atms = {
    "prop_fleeca_atm",
    "prop_atm_03",
    "prop_atm_02",
    "prop_atm_01",
}

exports['qb-target']:AddTargetModel(atms, {
    options = {
        {
            event = "ss-atmrobbery:rob",
            icon = Config.TargetIcon,
            label = Config.TargetLabel,
            item = Config.ATMRobItem,
        },
    },
    distance = 1.5
})