# [webpack](http://github.com/webpack/webpack) Plugin for [DocPad](http://docpad.org)

<!-- BADGES/ -->

[![Build Status](https://secure.travis-ci.org/RobLoach/docpad-plugin-webpack.png?branch=master)](http://travis-ci.org/RobLoach/docpad-plugin-webpack "Check this project's build status on TravisCI")
[![NPM version](https://badge.fury.io/js/docpad-plugin-webpack.png)](http://badge.fury.io/js/docpad-plugin-webpack "View this project on NPM")
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/RobLoach/docpad-plugin-webpack/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

<!-- /BADGES -->

[DocPad](https://docpad.org) plugin that allows bundling CommonJs/AMD/Labeled
Modules for the browser using [webpack](http://github.com/webpack/webpack).


## Install

```bash
$ docpad install webpack
```


## Usage

Reference the [webpack documentation](http://github.com/webpack/docs/wiki) for
a full understanding of webpack. The below is only an introduction to how to use
it with DocPad:

### Entry

Create a `src/documents/entry.js` file as your webpack entry point to your application.

``` javascript
---
webpack: true
---
console.log("It works.");
```

When building with DocPad, webpack will compile the bundles to
`out/entry.js`.

### Second file

Create a file `src/documents/content.js` with the following content:

``` javascript
module.exports = "It works from content.js.";
```

Modify `entry.js` to make use of it:

``` javascript
---
webpack: true
---
var content = require("./content.js");
console.log(content);
```

Rebuilding with DocPad will bundle both `entry.js` and `content.js` in `entry.js`.


## Configuration

The default configuration for this plugin is the equivalant of adding the
following [webpack options](http://github.com/webpack/docs/wiki/webpack-options)
to your [DocPad configuration file](http://docpad.org/docs/config):

``` coffeescript
plugins:
	webpack:
		entry: './entry.js'
		optimize:
			minimize: true
		verbose: false
```

<!-- HISTORY -->

<!-- CONTRIBUTE -->

<!-- BACKERS/ -->

<!-- LICENSE/ -->