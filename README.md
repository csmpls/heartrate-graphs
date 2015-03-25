# heartrate-graphs

this is a simple setup for showing graphs of people's heartrates relative to their baseline heartrate

## setup
make sure you have `node`, `npm` and `grunt`

then just
```npm install```

and 
```grunt``` or ```grunt watch``` while editing 

## directory structure

```
Gruntfile
app/ <- this is the webapp 
	lib/ <- these are your common js-style coffeescript files
	index.jade <- the main jade template
	main.coffee <- entry point for the webapp
```

`grunt` compiles `app/` to a neat bundle in `dist/` using coffeeify (browserify for coffeescript)


## TODOS

* label axes
* remvoe tickmarks on the left side
