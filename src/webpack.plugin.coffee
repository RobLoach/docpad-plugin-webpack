# Export Plugin
module.exports = (BasePlugin) ->
  # Define Plugin
  class WebpackPlugin extends BasePlugin
    # Name
    name: 'webpack'

    # Configuration
    config:
      optimize:
        minimize: false
      verbose: false

    # Constructor
    constructor: ->
      # Prepare
      super

      # Dependencies
      @webpack = require 'webpack'
      @path = require 'path'

      # Chain
      @

    # Before populating dynamic files, compile with webpack.
    populateCollectionsBefore: (opts, next) ->
      # Prepare
      config = @docpad.getConfig()
      webpackConfig = @getConfig()

      # Set the default webpack options.
      webpackConfig.entry = webpackConfig.entry or './entry.js'
      webpackConfig.context = config.srcPath
      webpackConfig.output = webpackConfig.output or {}
      webpackConfig.output.path = config.filesPaths[0] # TODO: Output to /out?

      # Create the webpack compiler.
      compiler = @webpack(webpackConfig);

      # Run the compiler.
      compiler.run (err, stats) ->
        if err
          return next(err)

        if !config.verbose
          output = stats.toString
            colors: true
            hash: false
            timings: false
            assets: true
            chunks: false
            chunkModules: false
            modules: false
            children: true
        else
          output = stats.toString
            colors: true
          
        @docpad.log('info', output)
        next()

      # Chain
      @
