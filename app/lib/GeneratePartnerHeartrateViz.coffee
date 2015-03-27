add_heartrate_graph = require './HeartrateGraph.coffee'
rando_in_range = require 'random-number-in-range'
_ = require('lodash')

heartrate_graph_template = () -> 
	_.template('''
		<h3>Partner's average heartrate during last turn</h3>
		<div id = "graphContainer">
			<canvas id="heartrateGraph" width="170px" height="270px"></canvas> 
		</div>
		<%= message %> ''')


add_viz_to_DOM = (heartrate_mean, heartrate_std, message) ->
	# set up the graph container with a messgae
	document.getElementById('visualization')
		.innerHTML = heartrate_graph_template()({'message':message})

	add_heartrate_graph(
		heartrate_mean
		, heartrate_std
		, "heartrateGraph") # div_id matches that of the template
		

module.exports = Generator =

	normal_heartrate_viz: -> 
		add_viz_to_DOM(
			# mean
			rando_in_range(40,60)
			# std
			, rando_in_range(4,13)
			, "Your partner's heartrate stayed within normal ranges.")

	elevated_heartrate_viz: ->
		add_viz_to_DOM(
			rando_in_range(65,85)
			, rando_in_range(6,25)
			, "Your partner's heartrate was elevated.")
