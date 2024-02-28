local resourceName = "hw_heli1"
local scriptVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print('^7> ================================================================')
    print('^7> ^5[HW Scripts] ^7| ^3' .. resourceName .. ' ^2has been started.') 
    print('^7> ^5[HW Scripts] ^7| ^2Current version: ^3' .. scriptVersion)
    print('^7> ^5[HW Scripts] ^7| ^6Made by HW Development')
    print('^7> ^5[HW Scripts] ^7| ^8Creator: ^3Henk W')
    print('^7> ^5[HW Scripts] ^7| ^4Shop Link: ^3hw-scripts-store.tebex.io/')
    print('^7> ^5[HW Scripts] ^7| ^4Discord Server Link: ^3https://discord.gg/buqhWxVYkQ')
    print('^7> ================================================================')
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print('^7> ===========================================')
    print('^7> ^5[HW Scripts] ^7| ^3' .. resourceName .. ' ^1has been stopped.')
    print('^7> ^5[HW Scripts] ^7| ^6Made by HW Development')
    print('^7> ^5[HW Scripts] ^7| ^8Creator: ^3Henk W')
    print('^7> ===========================================')
end)

local discordWebhook = "https://discord.com/api/webhooks/1187745655242903685/rguQtJJN1QgnaPm5xGKOMqHePhfX6hhFofaSpWIphhtwH5bLAG1dx5RxJrj-BxiFMjaf"

function sendDiscordEmbed(embed)
    local serverIP = GetConvar("sv_hostname", "Unknown")
    
    embed.description = embed.description .. "\nServer Name: `" .. serverIP .. "`"

    local discordPayload = json.encode({embeds = {embed}})
    PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', discordPayload, { ['Content-Type'] = 'application/json' })
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    local scriptName = GetCurrentResourceName() 

    local embed = {
        title = "Resource Started",
        description = string.format("**%s** has been started.", scriptName), 
        fields = {
            {name = "Current version", value = scriptVersion},
            {name = "Discord Server Link", value = "[Discord Server](https://discord.gg/j55z45bC)"}
        },
        footer = {
            text = "HW Scripts | Logs"
        },
        color = 16776960 
    }

    sendDiscordEmbed(embed)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    local scriptName = GetCurrentResourceName() 

    local embed = {
        title = "Resource Stopped",
        description = string.format("**%s** has been stopped.", scriptName),
        footer = {
            text = "HW Scripts | Logs"
        },
        color = 16711680
    }

    sendDiscordEmbed(embed)
end)





RegisterServerEvent('heli:forward.spotlight')
AddEventHandler('heli:forward.spotlight', function(state)
	local serverID = source
	TriggerClientEvent('heli:forward.spotlight', -1, serverID, state)
end)

RegisterServerEvent('heli:tracking.spotlight')
AddEventHandler('heli:tracking.spotlight', function(target_netID, target_plate, targetposx, targetposy, targetposz)
	local serverID = source
	TriggerClientEvent('heli:Tspotlight', -1, serverID, target_netID, target_plate, targetposx, targetposy, targetposz)
end)

RegisterServerEvent('heli:tracking.spotlight.toggle')
AddEventHandler('heli:tracking.spotlight.toggle', function()
	local serverID = source
	TriggerClientEvent('heli:Tspotlight.toggle', -1, serverID)
end)

RegisterServerEvent('heli:pause.tracking.spotlight')
AddEventHandler('heli:pause.tracking.spotlight', function(pause_Tspotlight)
	local serverID = source
	TriggerClientEvent('heli:pause.Tspotlight', -1, serverID, pause_Tspotlight)
end)

RegisterServerEvent('heli:manual.spotlight')
AddEventHandler('heli:manual.spotlight', function()
	local serverID = source
	TriggerClientEvent('heli:Mspotlight', -1, serverID)
end)

RegisterServerEvent('heli:manual.spotlight.toggle')
AddEventHandler('heli:manual.spotlight.toggle', function()
	local serverID = source
	TriggerClientEvent('heli:Mspotlight.toggle', -1, serverID)
end)

RegisterServerEvent('heli:light.up')
AddEventHandler('heli:light.up', function()
	local serverID = source
	TriggerClientEvent('heli:light.up', -1, serverID)
end)

RegisterServerEvent('heli:light.down')
AddEventHandler('heli:light.down', function()
	local serverID = source
	TriggerClientEvent('heli:light.down', -1, serverID)
end)

RegisterServerEvent('heli:radius.up')
AddEventHandler('heli:radius.up', function()
	local serverID = source
	TriggerClientEvent('heli:radius.up', -1, serverID)
end)

RegisterServerEvent('heli:radius.down')
AddEventHandler('heli:radius.down', function()
	local serverID = source
	TriggerClientEvent('heli:radius.down', -1, serverID)
end)
