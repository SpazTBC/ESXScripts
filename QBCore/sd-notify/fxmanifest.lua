fx_version 'cerulean'
game 'gta5'

author 'Your Name'
description 'QB Notify - Styled Notification System'
version '1.0.0'

client_scripts {
    'client/cl_notify.lua'
}

server_scripts {
    'server/sv_notify.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}

exports {
    'Notify'
}

server_exports {
    'NotifyPlayer',
    'NotifyAll'
}