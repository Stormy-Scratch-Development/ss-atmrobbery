## Dependencies :
qb-target - https://github.com/BerkieBb/qb-target / https://github.com/loljoshie/qb-target
QBCore Framework - https://github.com/QBCore-framework/qb-core
memorygame - https://github.com/Project-Sloth/memorygame
qb-dispatch - https://github.com/Project-Sloth/qb-dispatch

## Credits : 

ss-atmrobbery script by Stormy Scratch - https://discord.gg/BZnUFcUKRT

## Insert into #qb-dispatch --> sv_dispatchcodes.lua

	["atmrobbery"] =  {displayCode = '10-65', description = "ATM Robbery In Progress", radius = 0, recipientList = {'police'}, blipSprite = 76, blipColour = 2, blipScale = 1.5, blipLength = 2, sound = "robberysound"},


## Insert into #qb-dispatch --> cl_events.lua

```local function ATMRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "atmrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-65",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "ATM Robbery", -- message
        job = {"police"} -- jobs that will get the alerts
    })
end exports('ATMRobbery', ATMRobbery)```

and you are done! enjoy❤
