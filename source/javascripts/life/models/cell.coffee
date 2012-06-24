class window.Cell extends Backbone.Model
  isAlive: false

  meetNeighbors: ->
    neighbors = [
      Life.world.getCell(@nw())
      Life.world.getCell(@n())
      Life.world.getCell(@ne())
      Life.world.getCell(@e())
      Life.world.getCell(@se())
      Life.world.getCell(@s())
      Life.world.getCell(@sw())
      Life.world.getCell(@w())
    ]
    @set('neighbors', new CellsCollection(neighbors))
    @set('liveNeighborsCount', @countLiveNeighbors())

  countLiveNeighbors: ->
    @get('neighbors').reduce(
      ( (result, cell) ->
        if cell.get('isAlive') then ++result else result
      ), 0
    )

  shouldLive: ->
    liveNeighborsCount = @get('liveNeighborsCount')
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

  wrapEast:  -> if (@get('x') - 1) < 0 then Life.x - 1 else @get('x') - 1
  wrapWest:  -> if (@get('x') + 1) == Life.x then 0 else @get('x') + 1
  wrapNorth: -> if (@get('y') - 1) < 0 then Life.y - 1 else @get('y') - 1
  wrapSouth: -> if (@get('y') + 1) == Life.y then 0 else @get('y') + 1

  nw: -> [@wrapWest(), @wrapNorth()]
  n:  -> [@get('x'),   @wrapNorth()]
  ne: -> [@wrapEast(), @wrapNorth()]
  e:  -> [@wrapEast(),    @get('y')]
  se: -> [@wrapEast(), @wrapSouth()]
  s:  -> [@get('x'),   @wrapSouth()]
  sw: -> [@wrapWest(), @wrapSouth()]
  w:  -> [@wrapWest(),    @get('y')]
