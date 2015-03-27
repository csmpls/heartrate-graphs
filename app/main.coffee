partner_heartrate_viz = require './lib/GeneratePartnerHeartrateViz.coffee'
bacon$ = require 'bacon.jquery'
$ = require 'jquery'


(()-> 
	$('#generateNormalHeartrate').asEventStream('click')
		.onValue(partner_heartrate_viz.normal_heartrate_viz)
	$('#generateElevatedHeartrate').asEventStream('click')
		.onValue(partner_heartrate_viz.elevated_heartrate_viz)
)()