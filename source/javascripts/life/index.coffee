#= require life/models
#= require life/collections
#= require life/views
#= require life/application

$(document).ready ->
  Life.initialize(100, 100)

  $('#regenerate').click -> Life.regenerate()
