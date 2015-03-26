_ = require 'lodash'

module.exports = _.template(
	"<h3>Partner's average heartrate during last turn</h3>" +
	'<canvas id="heartrateGraph" width="170px" height="270px"></canvas>' +
	'<br> <%= message %> ')