chart = require './Chart-ErrorBars.js'
heartrate_graph_template = require '../templates/HeartrateGraphTemplate.coffee'

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
	


# our export is a function that takes a mean and standard deviation
# and puts a bargraph in #heartrateGraph
module.exports = (heartrate_mean, heartrate_std, message) -> 

	# set up the graph container with a messgae
	document.getElementById('graphContainer')
		.innerHTML = heartrate_graph_template({'message':message})

	## draw the graph
	ctx = document.getElementById("heartrateGraph").getContext("2d");
	window.myBar = new Chart(ctx).Bar(
		getBarChartData(heartrate_mean, heartrate_std)
		, getGlobalChartOptions()
	)
