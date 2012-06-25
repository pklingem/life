#= require life/application
#= require life/models
#= require life/views

$(document).ready ->
  Life.model.world = new Life.model.World(x: 100, y: 100)
  worldView = new Life.view.World(
    model: Life.model.world
    el: $('#world')
  )
  worldView.render()

  $('#regenerate').click -> Life.model.world.regenerate()
  $('#play').click ->
    Life.model.world.set('playing', setInterval(Life.model.world.regenerate, 3000))
  $('#pause').click ->
    clearInterval(Life.model.world.get('playing'))
