# [webpack](http://github.com/webpack/webpack) Plugin for [DocPad](http://docpad.org)

<!-- BADGES/ -->

[![Build Status](http://img.shields.io/travis-ci/RobLoach/docpad-plugin-webpack.png?branch=master)](http://travis-ci.org/RobLoach/docpad-plugin-webpack "Check this project's build status on TravisCI")
[![NPM version](http://badge.fury.io/js/docpad-plugin-webpack.png)](https://npmjs.org/package/docpad-plugin-webpack "View this project on NPM")
[![Dependency Status](https://david-dm.org/RobLoach/docpad-plugin-webpack.png?theme=shields.io)](https://david-dm.org/RobLoach/docpad-plugin-webpack)<br/>
[![Gittip donate button](http://img.shields.io/gittip/robloach.png)](https://www.gittip.com/robloach/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/2257574/RobLoach "Donate monthly to this project using Flattr")

<!-- /BADGES -->


[DocPad](https://docpad.org) plugin that allows bundling CommonJs/AMD/Labeled
Modules for the browser using [webpack](http://github.com/webpack/webpack).


## Install

```bash
$ docpad install webpack
```


## Usage

Reference the [webpack configuration](http://webpack.github.io/docs/configuration.html) for
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

The default configuration for this plugin is the equivalant of adding the following [webpack config](http://webpack.github.io/docs/configuration.html) to your [DocPad configuration file](http://docpad.org/docs/config):

``` coffeescript
plugins:
	webpack:
		verbose: false
		debug: true
```

It is also possible to pass the options through on a document-basis:
``` javascript
---
webpack:
	verbose: false
	debug: true
---
var myfile = require('./myfile');
console.log(myfile);
```

<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/RobLoach/docpad-plugin-webpack/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/RobLoach/docpad-plugin-webpack/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Rob Loach (http://robloach.net)

### Sponsors

No sponsors yet! Will you be the first?

[![Gittip donate button](http://img.shields.io/gittip/robloach.png)](https://www.gittip.com/robloach/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/2257574/RobLoach "Donate monthly to this project using Flattr")

### Contributors

These amazing people have contributed code to this project:

- [RobLoach](https://github.com/RobLoach) — [view contributions](https://github.com/RobLoach/docpad-plugin-webpack/commits?author=RobLoach)
- [sokra](https://github.com/sokra) — [view contributions](https://github.com/RobLoach/docpad-plugin-webpack/commits?author=sokra)

[Become a contributor!](https://github.com/RobLoach/docpad-plugin-webpack/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; Rob Loach (http://robloach.net)

<!-- /LICENSE -->


