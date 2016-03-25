$ = require('jquery')
AppView = Backbone.View.extend(
  el: 'body'
  events:
    'click .butClose' : 'closer'
    'click .image' : 'singleGallery'
    'click .planeFirst' : 'singleGallery'
    'click .planeSecond' : 'singleGallery'
    'click .box' : 'closeGallery'
  closer: ->
    switcher = $('.singleGallery').attr('data-id')
    console.log(switcher)
    if switcher == 'home' then $( "#tabs" ).tabs({active: 1})
    else $( "#tabs" ).tabs({active: 2})
  singleGallery: (e)->
    srcAttr = e.currentTarget.src
    console.log(srcAttr)
    $('.singleImg').attr('src', srcAttr)
  closeGallery: ->
    $('.box').css('display', 'none')
    $('.listGallery').css('display', 'none')
    $('.contentGallery').css('display', 'none')
    $('body').css('overflow', 'auto')
)

appView = new AppView
