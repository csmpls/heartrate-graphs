add_heartrate_graph  = require './lib/GenerateHeartrateGraphs.coffee'
rando_in_range = require 'random-number-in-range'
bacon$ = require 'bacon.jquery'
$ = require 'jquery'

generate_normal_heartrate_graph = ->
	add_heartrate_graph(
		# mean
		rando_in_range(20,60)
		# std
		, rando_in_range(4,13)
		, "Your partner's heartrate was normal.")

generate_elevated_heartrate_graph = ->
	add_heartrate_graph(
		rando_in_range(80,90)
		, rando_in_range(6,16)
		, "Your partner's heartrate was elevated.")

(()-> 
	$('#generateNormalHeartrate').asEventStream('click')
		.onValue(generate_normal_heartrate_graph)
	$('#generateElevatedHeartrate').asEventStream('click')
		.onValue(generate_elevated_heartrate_graph)
)()