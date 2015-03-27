chart = require './Chart-ErrorBars.js'
_ = require 'lodash'

getBarChartData = (mean, std) -> 
	labels : [""]
	, datasets : [
		fillColor : "rgba(220,220,220,0.0)"
		, strokeColor : "rgba(244,244,244,1)"
		, highlightFill: "rgba(220,220,220,0.0)"
		, highlightStroke: "rgba(220,220,220,1)"
		, data : [mean]
		, error : [std]
	]

getGlobalChartOptions = () -> 
	scaleShowGridLines : false
	, responsive : false
	, showTooltips: false
	, scaleOverride: true
	, scaleSteps: 100
	, scaleStepWidth: 1
	, scaleStartValue: 0
	, scaleShowLabels: false


# our export is a function that takes a mean and standard deviation
# and puts a bargraph in #heartrateGraph
module.exports = (heartrate_mean, heartrate_std, div_id) -> 

	## draw the graph
	ctx = document.getElementById(div_id).getContext("2d")
	window.myBar = new Chart(ctx).Bar(
		getBarChartData(heartrate_mean, heartrate_std)
	, getGlobalChartOptions())

