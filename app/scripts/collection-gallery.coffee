galleryTemplate = require('./templates/galleryTemplate.jade')()
$ = require('jquery')

PictureModel = Backbone.Model.extend(
  defaults:
    name: 'name'
    picture: 'picture path'
    id: 'picture id'
)

GalleryCollection = Backbone.Collection.extend(
  model: PictureModel
)

galleryCol = new GalleryCollection

GalleryView = Backbone.Epoxy.View.extend(
  el: galleryTemplate
  bindings: 'data-bind'
  events:
    'click .work' : 'openWork'
  openWork: ->
    $('.box').css('display', 'block')
    $('.listGallery').css('display', 'block')
    $('.contentGallery').css('display', 'block')
    $('body').css('overflow', 'hidden')
)

AppGallery = Backbone.Epoxy.View.extend(
  el:'#tabs-gallery'
  collection: galleryCol
  itemView: GalleryView
  initialize: -> # title // picture // id
    this.add('фото 1', 'gal1')
    this.add('фото 2', 'gal2')
    this.add('фото 3', 'gal3')
    this.add('фото 4', 'gal4')
    this.add('фото 5', 'gal5')
    this.add('фото 6', 'gal6')
  add: (nameH, pictureH)->
    pictureH = '../img/gallery/' + pictureH + '.png'
    idH = this.collection.length + 1
    console.log(this.collection.length)
    console.log(this.collection)
    this.collection.add({name: nameH, picture: pictureH, id: idH})
)

appgallery = new AppGallery