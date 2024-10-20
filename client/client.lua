local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------------------------
-- set halloween weather
---------------------------------------------
RegisterNetEvent('rex-halloween:client:weather', function(weathertype, variation, transistion)
    if Config.HalloweenWeather then
        Citizen.InvokeNative(0x80A398F16FFE3CC3) -- ClearOverrideWeather
        Citizen.InvokeNative(0x3373779BAF7CAF48, weathertype, variation, transistion) -- SetWeatherVariation
        Citizen.InvokeNative(0x59174F1AFE095B5A, joaat(weathertype), true, true, true, transistion, false) -- SetWeatherType
    end
end)

---------------------------------------------
-- reset variations
---------------------------------------------
RegisterNetEvent('rex-halloween:client:resetweather', function()
    Citizen.InvokeNative(0x0E71C80FA4EC8147, "FOG", true)
    Citizen.InvokeNative(0x0E71C80FA4EC8147, "MISTY", true)
    Citizen.InvokeNative(0x0E71C80FA4EC8147, "SHOWER", true)
    Citizen.InvokeNative(0x0E71C80FA4EC8147, "THUNDERSTORM", true)
end)
