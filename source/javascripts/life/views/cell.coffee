class window.CellView extends Backbone.View
  initialize: ->
    @model.bind('change', @render)

  tagName: 'td'
  render: =>
    if @model.get('isAlive')
      $(@el).addClass('alive')
    else
      $(@el).removeClass('alive')
    @
