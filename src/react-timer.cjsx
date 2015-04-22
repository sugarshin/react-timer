"use strict"

React = require 'react'

module.exports =
React.createClass
  propTypes:
    type: React.PropTypes.oneOf(['countup', 'countdown']).isRequired
    finish: React.PropTypes.oneOfType [
      React.PropTypes.number,
      React.PropTypes.instanceOf Date
    ]
    initialCount: React.PropTypes.oneOfType [
      React.PropTypes.number,
      React.PropTypes.instanceOf Date
    ]
    onFinish: React.PropTypes.func

  getDefaultProps: ->
    type: 'countup'
    initialCount: 0
    finish: 0

  getInitialState: ->
    count: if typeof @props.initialCount is 'number' then @props.initialCount else @props.initialCount.getTime()

  tick: -> @setState count: @state.count + @_rate

  start: ->
    @_timerID = setTimeout =>
      @timer()
    , 1000

  stop: -> clearTimeout @_timerID

  timer: ->
    @tick()
    if @props.type is 'countup' and @_finish <= @state.count or
    @props.type is 'countdown' and @state.count <= @_finish or @state.count <= 0
      @stop()
      @props.onFinish? name: 'onFinish', component: @
    else
      @start()

  componentWillMount: ->
    if @props.type is 'countup'
      @_rate = 1000
    else if @props.type is 'countdown'
      @_rate = -1000

    if typeof @props.finish is 'number'
      @_finish = @props.finish
      @_rate /= 1000
    else
      @_finish = @props.finish.getTime()

  componentDidMount: -> @start()

  _render: ->
    if typeof @props.initialCount is 'number'
      @state.count
    else
      d = new Date @state.count
      "#{d.getFullYear()}/#{d.getMonth() + 1}/#{d.getDate()}/#{d.getHours()}/#{d.getMinutes()}/#{d.getSeconds()}"

  render: ->
    <div className="react-timer-container">
      <span className="react-timer">{@_render()}</span>
    </div>
