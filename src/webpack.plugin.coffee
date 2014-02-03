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
			fs = require 'fs'

			# Prepare
			config = @getConfig()
			docpad = @docpad

			# Create the task group to handle Webpack.
			tasks = new TaskGroup({concurrency:0, next})

			# Create a new task for each Webpack file.
			opts.collection.findAll({webpack: $exists: true}).each (file) ->
				# Skip the file when the option is explicitly false.
				return	if file.get('webpack') is false

				tasks.addTask (complete) ->
					# Set the default webpack options.
					# Build the Webpack options.
					webpackOpts = file.get('webpack')
					webpackOpts = {} if typeof webpackOpts is 'boolean'
					webpackOpts.entry = './' + file.get('relativeOutPath')
					webpackOpts.context = file.get('outDirPath')

					# Set up the output paths.
					webpackOpts.output = {
						path: file.get('outDirPath')
						filename: file.get('relativeOutPath')
					}

					# Create the webpack compiler.
					compiler = webpack(webpackOpts);

					# Run the compiler.
					compiler.run (err, stats) ->
						return complete(err) if err

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
						docpad.log('info', output)

						# Update the out content for the document.
						fs.readFile(file.get('outPath'), (err, data) ->
							return complete(err) if err
							file.set({
								contentRendered: data
								contentRenderedWithoutLayouts: data
							})
							complete()
						)

			# Execute all of the created tasks.
			tasks.run()

			# Chain
			@