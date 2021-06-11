ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("kibra-discordstatus:serveronline")
AddEventHandler("kibra-discordstatus:serveronline", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" and "admin" then
    kibraLogGonder()
    TriggerClientEvent('esx:showNotification', source, 'Log Gönderildi')
    else 
        TriggerClientEvent('esx:showNotification', source, 'Yetkiniz Yetersiz!')
    end
end)

RegisterServerEvent("kibra-discordstatus:offonline")
AddEventHandler("kibra-discordstatus:offonline", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" and "admin" then
    kibraKapaliLogGonder()
    TriggerClientEvent('esx:showNotification', source, 'Log Gönderildi')
else 
    TriggerClientEvent('esx:showNotification', source, 'Yetkiniz Yetersiz!')
end
end)

function kibraLogGonder(color, name, message, footer)
    local footer = 'kibradev'..os.date("%d/%m/%Y     %X")
    local embed = {
          {
            ['color'] = color,
            ['title'] = Config.SunucuAdi,
            ['description'] = Config.Description,
            ["footer"] = {
                ["text"] = footer,
                },
            ['image'] = {
                ['url'] = Config.AktifGif,
            },
            ['fields'] = {{
                ['name'] = '**Sunucu IP**',
                ['value'] = Config.SunucuIP ,
            },
            {
                ['name'] = '**Teamspeak IP ADRESI**',
                ['value'] = Config.TeamSpeakIP,
            },
        }
    }
      }
  
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Username, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end

  function kibraKapaliLogGonder(color, name, message, footer)
    local footer = 'kibradev'..os.date("%d/%m/%Y     %X")
    local embed = {
          {
            ['color'] = color,
            ['title'] = Config.SunucuAdi,
            ['description'] = Config.SunucuKapaliMesaj,
            ["footer"] = {
                ["text"] = footer,
                },
            ['image'] = {
                ['url'] = Config.BakimGif,
            },
            
    }
      }
  
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Username, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end

  