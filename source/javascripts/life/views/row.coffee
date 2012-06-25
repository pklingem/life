class Life.view.Row extends Backbone.View
  tagName: 'tr'

  initialize: ->
    cells = @model.get('cells').models
    @_cellViews = _(cells).map (cell) ->
      new Life.view.Cell(model: cell)

  render: ->
    _(@_cellViews).each (cellView) =>
      $(@el).append(cellView.render().el)
    @
