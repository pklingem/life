class Life.view.World extends Backbone.View
  initialize: ->
    rows = @model.get('rows').models
    @_rowViews = _(rows).map (row) ->
      new Life.view.Row(model: row)

  render: ->
    $(@el).empty()
    _(@_rowViews).each (rowView) =>
      $(@el).append(rowView.render().el)
    @
