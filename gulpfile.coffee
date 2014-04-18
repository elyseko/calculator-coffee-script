gulp = require 'gulp'
gutil = require 'gulp-util'

coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
sass = require 'gulp-sass'
refresh = require 'gulp-livereload'
browserify = require 'gulp-browserify'

connect = require 'connect'
http = require 'http'
path = require 'path'
lr = require 'tiny-lr'
server = do lr

# Starts the webserver (http://localhost:3000)
gulp.task 'webserver', ->
	port = 3000
	hostname = null # allow to connect from anywhere
	base = path.resolve '.'
	directory = path.resolve '.'

	app = connect()
		.use(connect.static base)
		.use(connect.directory directory)

	http.createServer(app).listen port, hostname

# Starts the livereload server
gulp.task 'livereload', ->
    server.listen 35729, (err) ->
        console.log err if err?

# Compiles CoffeeScript files into js file
# and reloads the page
gulp.task 'scripts', ->
	gulp.src('src/index.coffee')
		.pipe(concat 'scripts.coffee')
		# .pipe(browserify {
	 #      transform: ['coffeeify'],
	 #      extensions: ['.coffee']
	 #    })
		.pipe(gulp.dest 'src/js')
		.pipe(coffee {sourceMap: true })
		#.pipe(do uglify)
		.pipe(gulp.dest 'src/js')
		.pipe(refresh server)

gulp.task 'dothis', ->
	gulp.src('src/js/script.js')
		.pipe(browserify {
          insertGlobals : true,
          debug : true
        })
        .pipe(refresh server)

# The default task
gulp.task 'default', ['webserver', 'livereload', 'scripts' 	], ->
	# Watches files for changes
	gulp.watch 'src/**', ['scripts'], ->
		console.log 'scripts'