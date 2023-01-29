function datePickerRegister(selector, lang, reportRegister){

                  var cb = function(start, end) {
				    var r_start = start.format('YYYY-MM-DD');
				    var r_end = end.format('YYYY-MM-DD');
		    
                    $(selector+" input").val(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
				 };        			

		  var fApplyLabel;
		  var fCancelLabel;
		  var fFromLabel;
		  var fToLabel;
		  var fDaysLabel;
		  var fMontshLabel;

		  var r1 = {
                       'Today': [moment(), moment()],
                       'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                       'Last 7 Days': [moment().subtract('days', 6), moment()],
                       'Last 30 Days': [moment().subtract('days', 29), moment()],
                       'This Month': [moment().startOf('month'), moment().endOf('month')],
                       'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                    };
		  var r2 = {
                       'অাজকে': [moment(), moment()],
                       'কালকে': [moment().subtract('days', 1), moment().subtract('days', 1)],
                       'গত ৭ দিন': [moment().subtract('days', 6), moment()],
                       'গত ৩০ দিন': [moment().subtract('days', 29), moment()],
                       'এই মাস': [moment().startOf('month'), moment().endOf('month')],
                       'গত মাস': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                    };
		  var r;
		  if(lang == '1'){

			r = r2;
		        fApplyLabel = "নির্বাচন কর";
		        fCancelLabel = "বাতিল কর";
		        fFromLabel = "শুরু";
		        fToLabel = "শেষ";
		        fDaysLabel = ['রবি', 'সোম' , 'মঙ্গল', 'বুধ' , 'বৃহ:' , 'শুক্র', 'শনি'];
		        fMonthsLabel = ['জানুয়ারি ' , 'ফেব্রুয়ারি' , 'মার্চ' , 'এপ্রিল' , 'মে' , 'জুন' , 'জুলাই' , 'আগস্ট' , 'সেপ্টেম্বর' , 'অক্টোবর' , 'নভেম্বর' , 'ডিসেম্বর'];
			cLabel = "অন্যান্য";

		  }
		  else{
			r = r1;
		        fApplyLabel = "Submit";
		        fCancelLabel = "Cancel";
		        fFromLabel = "From";
		        fToLabel = "To";
		        fDaysLabel = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr','Sa'];
		        fMonthsLabel = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
			cLabel = "Custom";


		  }

                  var optionSet1 = {
                    startDate: moment().subtract('days', 29),
                    endDate: moment(),
                    minDate: '01/01/2010',
                    maxDate: '12/31/2022',
                    dateLimit: { days: 2000 },
                    showDropdowns: true,
                    showWeekNumbers: true,
                    timePicker: false,
                    timePickerIncrement: 1,
                    timePicker12Hour: true,
                    ranges: r,
                    opens: 'left',
                    buttonClasses: ['btn btn-default'],
                    applyClass: 'btn-small btn-primary',
                    cancelClass: 'btn-small',
                    format: 'MM/DD/YYYY',
                    separator: ' to ',
                    locale: {
                        applyLabel: fApplyLabel,
                        cancelLabel: fCancelLabel,
                        fromLabel: fFromLabel,
                        toLabel: fToLabel,
                        customRangeLabel: cLabel,
                        daysOfWeek: fDaysLabel,
                        monthNames: fMonthsLabel,
                        firstDay: 6
                    }
                  };
		


                  $(selector+' input').val(moment().subtract('days', 29).format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));

                  $(selector).daterangepicker(optionSet1, cb);

		  if(reportRegister){
			  $("#report_date1").html(moment().format('YYYY-MM-DD'));
			  $("#report_date2").html(moment().subtract('days', 29).format('YYYY-MM-DD'));

          }

                  $(selector).on('apply', function(ev, picker) { 
		    var r_start = picker.startDate.format('YYYY-MM-DD');
		    var r_end = picker.endDate.format('YYYY-MM-DD');

		   $("#report_date2").html(r_start);
	       $("#report_date1").html(r_end);
	       
	       });
}
