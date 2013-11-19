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
        cache: false
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

      # Set the webpack context directory to the DocPad root.
      webpackOptions.context = rootPath if webpackOptions.context == ''

      # Assign the output directory to src/files.
      webpackOptions.output.path = @path.join(webpackOptions.context, "out") if webpackOptions.output.path == ''

      # Execute webpack
      @webpack(webpackOptions, next)

      # Chain
      @
