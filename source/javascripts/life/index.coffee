#= require life/models
#= require life/collections
#= require life/views
#= require life/application

$(document).ready ->
  Life.initialize(10, 10)

  $('#regenerate').click -> Life.regenerate()
