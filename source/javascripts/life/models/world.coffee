class Life.model.World extends Backbone.Model
  states: [true, false]
  randomState: ->
    @states[Math.floor(Math.random()*@states.length)]

  initialize: ->
    rows = for row in [0..@get('y')-1]
      cells = for column in [0..@get('x')-1]
        new Life.model.Cell(
          world: @
          x: column
          y: row
          isAlive: @randomState()
        )
      new Life.model.Row(cells: new Life.model.Cells(cells))
    @set('rows', new Life.model.Rows(rows))
    @meetNeighbors()

  getCell: (coordinates) ->
    x = coordinates[0]
    y = coordinates[1]
    @get('rows').at(y).get('cells').at(x)

  meetNeighbors: ->
    @get('rows').each (row) ->
      row.get('cells').each (cell) ->
        cell.meetNeighbors(@)

  generateFateGrid: ->
    @get('rows').map (row) ->
      row.get('cells').map (cell) ->
        cell.shouldLive()

  regenerate: =>
    fateGrid = @generateFateGrid()
    for y in [0..@get('y')-1]
      for x in [0..@get('x')-1]
        @getCell([x,y]).set('isAlive', fateGrid[y][x])
