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

    # Write After
    writeAfter: (opts, next) ->
      # Import
      webpack = require 'webpack'
      {TaskGroup} = require 'taskgroup'
      path = require 'path'

      # Prepare
      config = @getConfig()

      # Create the task group to handle Webpack.
      tasks = new TaskGroup({concurrency:0, next})

      # Create a new task for each Webpack file.
      opts.collection.findAll({webpack: $exists: true}).each (file) ->
        # Skip the file when the option is explicitly false.
        return  if file.get('webpack') is false

        tasks.addTask (complete) ->
          #console.log file.attributes
          # Set the default webpack options.
          # Build the Webpack options.
          webpackOpts = file.get('webpack')
          webpackOpts = {}  if typeof webpackOpts is 'boolean'
          webpackOpts.entry = './' + file.attributes.relativeOutPath
          webpackOpts.context = file.attributes.outDirPath

          webpackOpts.output = {
            path: file.attributes.outDirPath
            filename: file.attributes.relativeOutPath
          }
          console.log webpackOpts

          # Create the webpack compiler.
          compiler = webpack(webpackOpts);

          # Run the compiler.
          compiler.run (err, stats) ->
            console.log 'ASDFDSFAASDFASASDFASDF'
            console.log arguments
            if err
              return complete(err)

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


            complete()


          #browserifyOpts.basedir = pathUtil.join(, )

          ###
          # Provide the default configuration options if needed.
          for own key, value of plugin.getConfig()
            browserifyOpts[key] = value  if not browserifyOpts[key]?

          # Build the Browserify object.
          b = browserify(file.attributes.outPath)

          # Handle the require option.
          if browserifyOpts.require?
            for requireFile, requireOptions of browserifyOpts.require
              requireOptions = {}  if typeof requireOptions is 'boolean'
              requireOptions.basedir = browserifyOpts.basedir
              b.require(requireFile, requireOptions)

          # Handle the parameters which take single arrays.
          for option in ['ignore', 'external', 'exclude']
            if browserifyOpts[option]?
              for entry, i in browserifyOpts[option]
                b[option](entry)

          # Compile with Browserify.
          try
            b.bundle browserifyOpts, (err, output) ->
              return complete(err) if err

              # Update the out content for the document
              file.set({
                contentRendered: output
                contentRenderedWithoutLayouts: output
              })

              # Update the out content for the file
              file.action('write', complete)

          catch err
            return complete(err)
          ###

      # Execute all of the created tasks.
      tasks.run()


      # Chain
      @
