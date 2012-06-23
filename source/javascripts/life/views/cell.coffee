class window.CellView extends Backbone.View
  tagName: 'td'
  render: ->
    $(@el).addClass(@model.get('state'))
    @
