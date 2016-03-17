$ = require('jquery')
Backbone = require('backbone')
Epoxy = require('backbone.epoxy')
tabs = require('./tabs')

header = require('./header/header')
$('header').append(header)

content = require('./content/content')
$('#content').append(content)
$( "#tabs" ).tabs()

appView = require('./scripts/app-view')
require('./scripts/collection-homes')


