_ = require 'lodash'
chart = require './Chart-ErrorBars.js'
rando_in_range = require 'random-number-in-range'

randomScalingFactor = () ->
	Math.round(Math.random()*100)

getBarChartData = (mean, std) -> 
	return labels : [""]
		, datasets : [
			fillColor : "rgba(220,220,220,0.0)"
			, strokeColor : "rgba(244,244,244,1)"
			, highlightFill: "rgba(220,220,220,0.0)"
			, highlightStroke: "rgba(220,220,220,1)"
			, data : [mean]
			, error : [std]
		]

getGlobalChartOptions = () -> 
	return scaleShowGridLines : false
		, responsive : false
		, showTooltips: false
		, scaleOverride: true
		, scaleSteps: 100
		, scaleStepWidth: 1
		, scaleStartValue: 0
		, scaleShowLabels: false

heartrateGraphTemplate = (interpretation) ->
	_.template(
		'<h2>Your <span class="attention">partner</span>&#8217;s heartrate during the summary:</h2>' +
		'<canvas id="heartrateGraph" width="170px" height="270px"></canvas>' +
		'<br> <%= interpretation %></p> ')(interpretation: interpretation)	


# our export is a function that takes a mean and standard deviation
# and puts a bargraph in #heartrateGraph
generateHeartrateGraph = (heartrate_mean, heartrate_std, interpretation, divID) -> 

	# set up the graph container with a messgae
	document.getElementById(divID)
		.innerHTML = heartrateGraphTemplate(interpretation)

	## draw the graph
	ctx = document.getElementById("heartrateGraph").getContext("2d");
	window.myBar = new Chart(ctx).Bar(
		getBarChartData(heartrate_mean, heartrate_std)
		, getGlobalChartOptions()
	)

module.exports = Generator =
	normal_heartrate_viz: (div_id) -> 
		generateHeartrateGraph(
			# mean
			rando_in_range(20, 60)
			# std
			, rando_in_range(4,13)
			, "Your partner's heartrate was normal."
			, div_id)

	elevated_heartrate_viz: (div_id) ->
		generateHeartrateGraph(
			rando_in_range(80, 90)
			, rando_in_range(6, 16)
			, "Your partner's heartrate was elevated."
			, div_id)
