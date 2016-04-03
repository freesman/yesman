Backbone = require('backbone')
Epoxy = require('backbone.epoxy')
tabs = require('./tabs')
require('./scripts/jquery-mousewheel/jquery.mousewheel')
fancybox = require('./scripts/fancybox/jquery.fancybox')
require('./scripts/fancybox/jquery.fancybox-thumbs')

header = require('./header/header')
$('header').append(header)

content = require('./content/content')
$('.content .plane').append(content)
$( "#tabs" ).tabs()

appView = require('./scripts/app-view')
require('./scripts/collection-homes')
require('./scripts/collection-baths')
require('./scripts/collection-gallery')
$('.fancybox-thumb').fancybox(
  openEffect: 'none'
  closeEffect: 'none'
  prevEffect: 'none'
  nextEffect: 'none'
  href: 'index.html'
  helpers:
    title: {type: 'outside'}
    thumbs: 
      width: 70 
      height: 70
                    
)


