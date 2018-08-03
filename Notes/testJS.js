var arr = [1, 2, 3, 4, 6, 7, 8, 99, 20];
var r = arr.filter(function(x) {
	return x % 2 !== 0;
	});
console.log(r);
