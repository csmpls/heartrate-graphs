partner_heartrate_viz = require './lib/GeneratePartnerHeartrateViz.coffee'
bacon$ = require 'bacon.jquery'
$ = require 'jquery'


(()-> 
	$('#generateNormalHeartrate').asEventStream('click')
		.map('visualization') # id of the div where we want the viz to go
		.onValue(partner_heartrate_viz.normal_heartrate_viz)
	$('#generateElevatedHeartrate').asEventStream('click')
		.map('visualization') 
		.onValue(partner_heartrate_viz.elevated_heartrate_viz)
)()