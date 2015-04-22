"use strict"

React = require 'react'
insertStylesheet = require 'insert-stylesheet'
insertCss = require 'insert-css'
Timer = require './'
insertStylesheet 'http://cdnjs.cloudflare.com/ajax/libs/github-fork-ribbon-css/0.1.1/gh-fork-ribbon.min.css'
insertCss require './demo.styl'

do ->
  WebFontConfig =
    google:
      families: [ 'Open+Sans:300:latin', 'Source+Code+Pro:500:latin' ]

  do ->
    wf = document.createElement 'script'
    wf.src = (if 'https:' == document.location.protocol then 'https' else 'http') + '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js'
    wf.type = 'text/javascript'
    wf.async = 'true'
    s = document.getElementsByTagName('script')[0]
    s.parentNode.insertBefore wf, s


_onFinish = (ev) ->
  alert ev.name;
  console.log ev.component

React.render(
  <div>
    <div className="container">
      <Timer type={'countdown'} initialCount={5} onFinish={_onFinish} />
      <pre><code>{"var React = require('react');\nvar Timer = require('./');\n\nvar _onFinish = function(ev) {\n  alert(ev.name);\n  return console.log(ev.component);\n};\n\nReact.render(\n  <Timer type={'countdown'} initialCount={5} onFinish={_onFinish} />, document.body\n);"}</code></pre>
    </div>
    <div className="github-fork-ribbon-wrapper right">
      <div className="github-fork-ribbon">
        <a href="//github.com/sugarshin/react-timer">Fork me on GitHub</a>
      </div>
    </div>
  </div>
, document.body)
