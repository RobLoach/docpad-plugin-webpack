# [webpack](http://github.com/webpack/webpack) Plugin for [DocPad](http://docpad.org)

[![Build Status](https://secure.travis-ci.org/RobLoach/docpad-plugin-webpack.png?branch=master)](http://travis-ci.org/RobLoach/docpad-plugin-webpack "Check this project's build status on TravisCI")
[![NPM version](https://badge.fury.io/js/docpad-plugin-webpack.png)](http://badge.fury.io/js/docpad-plugin-webpack "View this project on NPM")
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/RobLoach/docpad-plugin-webpack/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

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

The entry point to webpack defaults to `src/entry.js`, so create a file there:

``` javascript
console.log("It works.");
```

When building with DocPad, webpack will compile the bundles to
`src/files/bundle.js`.

### Second file

Create a file `src/content.js` with the following content:

``` javascript
module.exports = "It works from content.js.";
```

Modify `entry.js` to make use of it:

``` javascript
var content = require("./content.js");
console.log(content);
```

Rebuilding with DocPad will bundle both `entry.js` and `content.js` into the
same `src/files/bundle.js`.


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


## History
[You can discover the history inside the `History.md` file](https://github.com/robloach/docpad-plugin-webpack/blob/master/History.md#files)


## Contributing
[You can discover the contributing instructions inside the `Contributing.md` file](https://github.com/robloach/docpad-plugin-webpack/blob/master/Contributing.md#files)


## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2013 [Rob Loach](http://robloach.net)
