class window.RowView extends Backbone.View
  tagName: 'tr'

  initialize: ->
    cells = @model.get('cells').models
    @_cellViews = _(cells).map (cell) ->
      new CellView(model: cell)

  render: ->
    _(@_cellViews).each (cellView) =>
      $(@el).append(cellView.render().el)
    @
