# Export Plugin
module.exports = (BasePlugin) ->
  # Define Plugin
  class WebpackPlugin extends BasePlugin
    # Name
    name: 'webpack'

    # Configuration
    config:
      webpackOptions:
        entry: './entry.js'
        context: ''
        cache: false
        optimize:
          minimize: false
        output:
          path: ''

    # Constructor
    constructor: ->
      # Prepare
      super

      # Dependencies
      @webpack = require 'webpack'
      @path = require 'path'

      # Chain
      @

    # Write After
    # Run Grunt after DocPad generation
    writeAfter: (opts, next) ->
      # Prepare
      rootPath = @docpad.getConfig().rootPath
      webpackOptions = @getConfig().webpackOptions

      # Set the webpack context directory to the DocPad root.
      if webpackOptions.context == ''
        webpackOptions.context = @path.join(rootPath, 'src')

      # Assign the output directory to src/files.
      if webpackOptions.output.path == ''
        webpackOptions.output.path = @path.join(rootPath, 'out')

      # Build with webpack
      @webpack(webpackOptions, next)

      # Chain
      @
