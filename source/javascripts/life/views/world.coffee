class window.WorldView extends Backbone.View
  initialize: ->
    rows = @model.get('rows').models
    @_rowViews = _(rows).map (row) ->
      new RowView(model: row)

  render: ->
    $(@el).empty()
    _(@_rowViews).each (rowView) =>
      $(@el).append(rowView.render().el)
    @
