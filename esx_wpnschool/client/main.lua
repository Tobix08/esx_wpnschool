

local Licenses          = {}
local CurrentTest       = nil




function StartTheoryTest()
	CurrentTest = 'theory'

	SendNUIMessage({
		openQuestion = true
	})

	ESX.SetTimeout(200, function()
		SetNuiFocus(true, true)
	end)


end

function StopTheoryTest(success)
	CurrentTest = nil

	SendNUIMessage({
		openQuestion = false
	})

	SetNuiFocus(false)

	if success then
		TriggerServerEvent('esx_wpnschool:addLicense', 'weapon')
		ESX.ShowNotification(TranslateCap('passed_test'))
	else
		ESX.ShowNotification(TranslateCap('failed_test'))
	end
end



RegisterNUICallback('question', function(data, cb)
	SendNUIMessage({
		openSection = 'question'
	})

	cb()
end)

RegisterNUICallback('close', function(data, cb)
	StopTheoryTest(true)
	cb()
end)

RegisterNUICallback('kick', function(data, cb)
	StopTheoryTest(false)
	cb()
end)


RegisterNetEvent('esx_wpnschool:loadLicenses')
AddEventHandler('esx_wpnschool:loadLicenses', function(licenses)
	Licenses = licenses
end)

-- Create Blips
CreateThread(function()
	if Config.Blip == true then
local blip = AddBlipForCoord(Config.Coord)

	SetBlipSprite (blip, 110)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.2)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName(TranslateCap('driving_school_blip'))
	EndTextCommandSetBlipName(blip)
	end
end)






			exports.ox_target:addSphereZone({
				coords = Config.Coord,
				radius = 1,
				debug = drawZones,
				distance = 3,
				options = {
					{
						name = 'otevrit',
						event = 'tbx_necoidk:otevritmenu',
						icon = 'fa-solid fa-id-card',
						label = 'Zbrojní průkaz',
					}
				}
			})


 RegisterNetEvent("tbx_necoidk:otevritmenu2", function()
	ESX.TriggerServerCallback('esx_wpnschool:canYouPay', function(haveMoney)
		if haveMoney then
			lib.hideContext(onExit)
			StartTheoryTest()
		else
			ESX.ShowNotification(TranslateCap('not_enough_money'))
		end
	end, 'weapon')
end)








RegisterNetEvent('tbx_necoidk:otevritmenu', function()
	lib.showContext('zbrojak_menu')
  end)





	lib.registerContext({
		id = 'zbrojak_menu',
		title = 'Zboroják',
		options = {
		  {
			title = 'Zahájit test',
			description = 'Zahájíte test po kterém obdržíte zbojenský průkaz',
			icon = 'check',
			event = 'tbx_necoidk:otevritmenu2',
			arrow = true,
			args = {
			  someValue = 500
			}
		  }
		}
	  })
