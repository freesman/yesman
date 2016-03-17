AppView = Backbone.View.extend(
  el: '#tabs'
  events:
    'click #home-1' : 'home'
  home: ->
    alert('hello eva!')
)

appView = new AppView
