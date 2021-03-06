$(document).ready(function(){

	function formatCurrency(num) {
	num = num.toString().replace(/\$|\,/g, '');
	if (isNaN(num)) num = "0";
	sign = (num == (num = Math.abs(num)));
	num = Math.floor(num * 100 + 0.50000000001);
	cents = num % 100;
	num = Math.floor(num / 100).toString();
	if (cents < 10) cents = "0" + cents;
	for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
	num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
	return (((sign) ? '' : '-') + '$' + num + '.' + cents);
}

	function computetotal(event) {
		
		
		var deliveryFees = 			((($("#order_monday_orders").val() > 0 )?1:0)
		                               + (($("#order_tuesday_orders").val() > 0)?1:0)
									   + (($("#order_wednesday_orders").val() > 0 )?1:0)
									   + (($("#order_thursday_orders").val() > 0 )?1:0))
									   * $("#delivery_fee").val();
		var index = 0; var sum = 0;							   
		 $(".extra_price").each(function(){
				
				var sum1 = $(this).html().replace("$","") * $(".quantity"). eq(index).val();	
				sum += sum1;
				index += 1;
			});	
		var extraFees = sum;
		$("#total").html(formatCurrency($("#order_monday_orders").val() * $("#monday_price").html().replace("$","")
		                               + $("#order_tuesday_orders").val() * $("#tuesday_price").html().replace("$","")
									   + $("#order_wednesday_orders").val() * $("#wednesday_price").html().replace("$","")
									   + $("#order_thursday_orders").val() * $("#thursday_price").html().replace("$","")
									    + deliveryFees + extraFees) );
		$("#delivery_fees").html(formatCurrency(deliveryFees)); return;
	};
		
	$("select").change(function(event) {
	$("#extra_price").html(formatCurrency($("#extra_" + $(".select").val()).html()));
	computetotal(event);
	
	});
	computetotal(0);
	$("input").change(function(event) { computetotal(event) });
	
});	