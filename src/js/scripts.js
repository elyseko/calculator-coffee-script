(function() {
  var Calculator, addInput,
    __slice = [].slice;

  Calculator = (function() {
    function Calculator() {
      this.add = function() {
        var a, b, num, total, values, _i, _len;
        a = arguments[0], b = arguments[1], values = 3 <= arguments.length ? __slice.call(arguments, 2) : [];
        total = (parseFloat(a)) + (parseFloat(b));
        console.log(values);
        for (_i = 0, _len = values.length; _i < _len; _i++) {
          num = values[_i];
          total += parseFloat(num);
        }
        return total;
      };
    }

    return Calculator;

  })();

  this.calc = new Calculator();

  addInput = function(event) {
    var result, values, _ref;
    values = $('#calc-input').val();
    if (values) {
      values = values.split(' ');
    }
    result = (_ref = this.calc).add.apply(_ref, values);
    $('#output').html(result);
    return result;
  };

  $('#calculate').click($.proxy(addInput, this));

}).call(this);

/*
//# sourceMappingURL=scripts.js.map
*/
