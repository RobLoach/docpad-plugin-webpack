# Export Plugin
module.exports = (BasePlugin) ->
  # Define Plugin
  class WebpackPlugin extends BasePlugin
    # Name
    name: 'webpack'

    # Configuration
    config:
      webpackOptions:
        context: ''
        entry: './src/index.js'
        output:
          path: ''
          filename: '[hash].bundle.js'
        cache: false
        debug: true
        node:
          console: true

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
      webpackOptions.context = rootPath if webpackOptions.context == ''
      webpackOptions.output.path = @path.join(webpackOptions.context,"src", "files") if webpackOptions.output.path == ''

      console.log config.webpackOptions
      # Execute webpack
      @webpack(webpackOptions, next)

      # Chain
      @
