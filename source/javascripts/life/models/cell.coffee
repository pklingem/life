class Life.model.Cell extends Backbone.Model
  isAlive: false

  meetNeighbors: ->
    world = @get('world')
    neighbors = [
      world.getCell(@nw())
      world.getCell(@n())
      world.getCell(@ne())
      world.getCell(@e())
      world.getCell(@se())
      world.getCell(@s())
      world.getCell(@sw())
      world.getCell(@w())
    ]
    @set('neighbors', new Life.model.Cells(neighbors))

  countLiveNeighbors: ->
    @get('neighbors').reduce(
      ( (result, cell) ->
        if cell.get('isAlive') then ++result else result
      ), 0
    )

  shouldLive: ->
    liveNeighborsCount = @countLiveNeighbors()
    if @get('isAlive')
      if liveNeighborsCount < 2      # under-population
        false
      else if liveNeighborsCount > 3 # overcrowding
        false
      else                           # survival
        true
    else
      if liveNeighborsCount == 3     # reproduction
        true
      else                           # remain dead
        false

  x: null
  y: null

  wrapEast:  -> if (@get('x') - 1) < 0 then @get('world').get('x') - 1 else @get('x') - 1
  wrapWest:  -> if (@get('x') + 1) == @get('world').get('x') then 0 else @get('x') + 1
  wrapNorth: -> if (@get('y') - 1) < 0 then @get('world').get('y') - 1 else @get('y') - 1
  wrapSouth: -> if (@get('y') + 1) == @get('world').get('y') then 0 else @get('y') + 1

  nw: -> [@wrapWest(), @wrapNorth()]
  n:  -> [@get('x'),   @wrapNorth()]
  ne: -> [@wrapEast(), @wrapNorth()]
  e:  -> [@wrapEast(),    @get('y')]
  se: -> [@wrapEast(), @wrapSouth()]
  s:  -> [@get('x'),   @wrapSouth()]
  sw: -> [@wrapWest(), @wrapSouth()]
  w:  -> [@wrapWest(),    @get('y')]
