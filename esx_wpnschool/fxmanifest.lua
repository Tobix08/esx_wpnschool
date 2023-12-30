fx_version 'adamant'

game 'gta5'

description 'Weapon test'

version '1.0'
legacyversion '1.9.1'

lua54 'yes'

shared_scripts {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/dmv.png',
	'html/styles.css',
	'html/questions.js',
	'html/scripts.js',
	'html/debounce.min.js'
}

dependencies {
	'es_extended',
	'esx_license'
}
