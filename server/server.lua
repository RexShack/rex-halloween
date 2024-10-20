local RSGCore = exports['rsg-core']:GetCoreObject()
local halloweenSet = false
local currentweather = nil
local weatherreset = false

---------------------------------------------
-- halloween weather system
---------------------------------------------
lib.cron.new(Config.CronJob, function ()

    if Config.HalloweenWeather then

        if currentweather ~= 'FOG' and not halloweenSet then
            TriggerClientEvent('rex-halloween:client:weather', -1, 'FOG', 'fog_MP_Pred', 15.0)
            currentweather = 'FOG'
            if Config.EnableServerNotify then print('weather set to halloween FOG') end
            halloweenSet = true
            goto continue
        end

        if currentweather == 'FOG' and halloweenSet then
            TriggerClientEvent('rex-halloween:client:weather', -1, 'MISTY', 'misty_MP_Pred', 15.0)
            currentweather = 'MISTY'
            if Config.EnableServerNotify then print('weather set to halloween MISTY') end
            goto continue
        end

        if currentweather == 'MISTY' and halloweenSet then
            TriggerClientEvent('rex-halloween:client:weather', -1, 'SHOWER', 'shower_MP_Pred', 15.0)
            currentweather = 'SHOWER'
            if Config.EnableServerNotify then print('weather set to halloween SHOWER') end
            goto continue
        end

        if currentweather == 'SHOWER' and halloweenSet then
            TriggerClientEvent('rex-halloween:client:weather', -1, 'THUNDERSTORM', 'thunderstorm_MP_Pred', 15.0)
            currentweather = 'THUNDERSTORM'
            if Config.EnableServerNotify then print('weather set to halloween THUNDERSTORM') end
            goto continue
        end

        if currentweather == 'THUNDERSTORM' and halloweenSet then
            TriggerClientEvent('rex-halloween:client:weather', -1, 'FOG', 'fog_MP_Pred', 15.0)
            currentweather = 'FOG'
            if Config.EnableServerNotify then print('weather set to halloween FOG') end
            goto continue
        end

    end

    if not Config.HalloweenWeather then
        if not weatherreset then
            print('you are here')
            TriggerClientEvent('rex-halloween:client:resetweather', -1)
            exports.weathersync:setWeather('sunny', 25.0, false, false)
            weatherreset = true
            goto continue
        end
    end

    ::continue::

    if Config.EnableServerNotify then
        print('halloween weather cron ran')
    end

end)
