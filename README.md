# react-timer

[![GitHub version](https://badge.fury.io/gh/sugarshin%2Freact-timer.svg)](http://badge.fury.io/gh/sugarshin%2Freact-timer) [![License](http://img.shields.io/:license-mit-blue.svg)](http://sugarshin.mit-license.org/)

Timer

[http://sugarshin.github.io/react-timer/](http://sugarshin.github.io/react-timer/)

## Getting started

```zsh
npm i sugarshin/react-timer
```

## Usage

```js
var React = require('react');
var Timer = require('react-timer');

var _onFinish = function(ev) {
  alert(ev.name);
  return console.log(ev.component);
};

React.render(
  <Timer type={'countdown'} initialCount={5} onFinish={_onFinish} />, document.body
);
```

## License

[MIT](http://sugarshin.mit-license.org/)

© sugarshin
