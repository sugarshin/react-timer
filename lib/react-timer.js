// Generated by CoffeeScript 1.9.2
"use strict";
var React;

React = require('react');

module.exports = React.createClass({
  propTypes: {
    type: React.PropTypes.oneOf(['countup', 'countdown']).isRequired,
    finish: React.PropTypes.oneOfType([React.PropTypes.number, React.PropTypes.instanceOf(Date)]),
    initialCount: React.PropTypes.oneOfType([React.PropTypes.number, React.PropTypes.instanceOf(Date)]),
    onFinish: React.PropTypes.func
  },
  getDefaultProps: function() {
    return {
      type: 'countup',
      initialCount: 0,
      finish: 0
    };
  },
  getInitialState: function() {
    return {
      count: typeof this.props.initialCount === 'number' ? this.props.initialCount : this.props.initialCount.getTime()
    };
  },
  componentWillMount: function() {
    if (this.props.type === 'countup') {
      this._rate = 1000;
    } else if (this.props.type === 'countdown') {
      this._rate = -1000;
    }
    if (typeof this.props.finish === 'number') {
      this._finish = this.props.finish;
      return this._rate /= 1000;
    } else {
      return this._finish = this.props.finish.getTime();
    }
  },
  componentDidMount: function() {
    return this._start();
  },
  _tick: function() {
    return this.setState({
      count: this.state.count + this._rate
    });
  },
  _start: function() {
    return this._timerID = setTimeout((function(_this) {
      return function() {
        return _this._timer();
      };
    })(this), 1000);
  },
  _stop: function() {
    return clearTimeout(this._timerID);
  },
  _timer: function() {
    var base;
    this._tick();
    if (this.props.type === 'countup' && this._finish <= this.state.count || this.props.type === 'countdown' && this.state.count <= this._finish || this.state.count <= 0) {
      this._stop();
      return typeof (base = this.props).onFinish === "function" ? base.onFinish({
        name: 'onFinish',
        component: this
      }) : void 0;
    } else {
      return this._start();
    }
  },
  _render: function() {
    var d;
    if (typeof this.props.initialCount === 'number') {
      return this.state.count;
    } else {
      d = new Date(this.state.count);
      return (d.getFullYear()) + "/" + (d.getMonth() + 1) + "/" + (d.getDate()) + "/" + (d.getHours()) + "/" + (d.getMinutes()) + "/" + (d.getSeconds());
    }
  },
  render: function() {
    return React.createElement("div", {
      "className": "react-timer-container"
    }, React.createElement("span", {
      "className": "react-timer"
    }, this._render()));
  }
});
