fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'ug-policeJob'
description 'Police Job for UgCore by UgDev'
author 'UgDev'
version '3.5'
url 'https://github.com/ugcore-framework/ug-policeJob'

shared_scripts {
    '@ug-core/languages.lua',
    'languages/*.lua',
    'config.lua'
}

client_scripts { 
    'client/main.lua',
    'client/functions.lua',
    'client/events.lua',
    'client/threads.lua',
    'client/plugins/target.lua',
    'client/plugins/blip.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/functions.lua',
    'server/events.lua',
    'server/callbacks.lua'
}