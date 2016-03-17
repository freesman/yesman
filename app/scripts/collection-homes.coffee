HomesModel = Backbone.Model.extend(
  defaults:
    name: 'project name'
    picture: 'picture path'
    price: 'project price'
)

HomesCollection = Backbone.Collection.extend(
  model: HomesModel
)

homesCol = new HomesCollection

addHome = (name, picture, price)->
  pathway = '../img/homes/' + picture + '.png'
  project = new HomesModel
  project.set('name', name)
  project.set('picture', pathway)
  project.set('price', price + ' $')
  homesCol.add(project)

addHome('руслан', 'ruslan', '50 000')
addHome('евгений', 'evgen', '70 000')
#addHome('', '', '')
console.log(homesCol)
