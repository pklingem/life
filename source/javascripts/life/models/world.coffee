class window.World extends Backbone.Model
  getCell: (coordinates) ->
    x = coordinates[0]
    y = coordinates[1]
    @get('rows').at(y).get('cells').at(x)

  meetNeighbors: ->
    @get('rows').each (row) ->
      row.get('cells').each (cell) ->
        cell.meetNeighbors()
