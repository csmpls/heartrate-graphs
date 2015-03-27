module.exports = (grunt) ->

	grunt.initConfig

		coffeeify: 
			compile: 
				options: {},
				files: [{
					src: ['app/lib/*.coffee', 'app/main.coffee'],
					dest: 'built-app/bundle.js'
	      		}]
		jade:
			compile:
				options:
					pretty: true
					# data:
					# 	debug: false
				files: 
					'built-app/index.html':['app/index.jade']
		sass:
			compile:
				files:
					'built-app/style.css': 'app/styles/main.scss'
		watch:
			coffeeify:
				files: ['app/**/*.coffee', 'app/main.coffee']
				tasks: ['coffeeify:compile']
			jade:
				files: ['app/index.jade']
				tasks: ['jade:compile']
			sass:
				files: ['app/styles/*.scss']
				tasks: ['sass:compile']
					
	grunt.loadNpmTasks 'grunt-coffeeify'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-sass'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.registerTask 'default', ['coffeeify', 'jade', 'sass']
