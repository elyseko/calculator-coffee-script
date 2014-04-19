class Calculator
	constructor: ->
		# @add = (a, b) ->
		# 	return (parseFloat a) + (parseFloat b)
		@add = (a, b, values...) ->
			total = (parseFloat a) + (parseFloat b)
			# total = 0
			console.log values 
			for num in values
				total += parseFloat num
			return total

@calc = new Calculator()

addInput = (event)->
	values = $('#calc-input').val()
	if values
		values = values.split ' '
	result = @calc.add values... #values[0], values[1]
	$('#output').html result
	return result

$('#calculate').click $.proxy addInput, this