fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua'
}

client_scripts {
    'client/main.lua'
}

ox_libs {
    'locale'
}

files {
    'config.lua',
    'locales/*.json',
    'client/notify.lua'
}

dependencies {
    'ox_lib'
}