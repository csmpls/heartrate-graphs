_ = require 'lodash'

module.exports = _.template(
	'<canvas id="heartrateGraph" width="170px" height="270px"></canvas>' +
	'<br> <%= message %> ')