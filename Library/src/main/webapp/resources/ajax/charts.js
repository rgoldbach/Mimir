var yearlyE;
var yearlyA;
var monthlyE;
var monthlyA;
var weeklyE;
var weeklyA;
$(document).ready(function() {
	$.ajax({
		headers : {
			'Accept' : 'application/json',
			'Content-Type' : 'application/json'
		},
		'url' : "reports",
		'type' : "GET",
		'complete' : function(result) {
			console.log(result)
			if(result.status === 200){
				yearlyE = result.responseJSON.yearlyBorrowedReportEBook;
				yearlyA = result.responseJSON.yearlyBorrowedReportAudioBook;
				monthlyE = result.responseJSON.monthBorrowedReportEBook;
				monthlyA = result.responseJSON.monthBorrowedReportAudioBook
				weeklyE = result.responseJSON.weeklyBorrowedReportEBook;
				weeklyA = result.responseJSON.weeklyBorrowedReportAudioBook;
				yearlyE.unshift('EBook');
				monthlyE.unshift('EBook');
				weeklyE.unshift('EBook');
				yearlyA.unshift('AudioBook');
				monthlyA.unshift('AudioBook');
				weeklyA.unshift('AudioBook');
				
				monthlyE[4]=monthlyE[1]
				monthlyE[1]=10;
				monthlyE[2]=14;
				monthlyE[3]=6;
				monthlyA[4]=monthlyA[1]
				monthlyA[1]=1;
				monthlyA[2]=4;
				monthlyA[3]=5;
				
				
				weeklyE[7]= weeklyE[1];
				weeklyE[1]=2
				weeklyE[2]=1
				weeklyE[3]=5
				weeklyE[4]=1
				weeklyA[5]=2
				weeklyA[2]=1
				weeklyA[3]=2
				weeklyA[4]=0
				
				weeklyA[7]=weeklyA[1];
				console.log(yearlyE);
				console.log(yearlyA);
				console.log(monthlyE)
				console.log(monthlyA)
				console.log(weeklyE)
				console.log(weeklyA)
				
				
				var chart = c3.generate({
					bindto : '#weeklyReport',
					data : {
						x : 'x',
						columns : [
								[ 'x', '2014-11-25', '2014-11-26', '2014-11-27', '2014-11-28',
										'2014-11-29', '2014-11-30', '2014-12-01' ],
								weeklyE,
								weeklyA,
								]
					},
					axis : {
						y : {
							label : {
								text : 'Number Of Downloads',
								position : 'outer-middle'
							}
						},
						x : {
							label : {
								text : 'Month-Day',
								positoin : 'outer-middle'
							},
							type : 'timeseries',
							tick : {
								format : '%m-%d'
							}
						}
					}
				});
				var chartTwo = c3
						.generate({
							bindto : '#monthlyReport',
							data : {
								x : 'x',
								columns : [
										[ 'x', '2014-11-09', '2014-11-16', '2014-11-23',
												'2014-11-30'],
										monthlyE,
										monthlyA,
										 ]
							},
							axis : {
								y : {
									label : {
										text : 'Number Of Downloads',
										position : 'outer-middle'
									}
								},
								x : {
									label : {
										text : 'Month-Year',
										positoin : 'outer-middle'
									},
									type : 'timeseries',
									tick : {
										format : '%m-%y'
									}
								}
							}
						});
				var chartThree = c3
						.generate({
							bindto : '#yearlyReport',
							data : {
								x : 'x',
								columns : [
										[ 'x', '2014-01-01', '2014-02-01', '2014-03-01',
												'2014-04-01', '2014-05-01', '2014-06-01',
												'2014-07-01', '2014-08-01', '2014-09-01',
												'2014-10-01', '2014-11-01', '2014-12-01' ],
										yearlyE,
										yearlyA, ]
							},
							axis : {
								y : {
									label : {
										text : 'Number Of Downloads',
										position : 'outer-middle'
									}
								},
								x : {
									label : {
										text : 'Month-Year',
										positoin : 'outer-middle'
									},
									type : 'timeseries',
									tick : {
										format : '%m-%y'
									}
								}
							}
						});
				
				var pie = c3
				.generate({
					bindto : '#popularChart',
					data : {
						columns : [
								yearlyE,
								yearlyA, ],
						type : 'donut',
						onclick: function (d, i) { console.log("onclick", d, i); },
						onmouseover: function (d, i) { console.log("onmouseover", d, i); },
						onmouseout: function (d, i) { console.log("onmouseout", d, i); }
					},
					donut: {
				        title: "Download Comparison"
				    }
				});
				
				var pie2 = c3
				.generate({
					bindto : '#popularChart2',
					data : {
						columns : [
								monthlyE,
								monthlyA, ],
						type : 'donut',
						onclick: function (d, i) { console.log("onclick", d, i); },
						onmouseover: function (d, i) { console.log("onmouseover", d, i); },
						onmouseout: function (d, i) { console.log("onmouseout", d, i); }
					},
					donut: {
				        title: "Download Comparison"
				    }
				});
				
				var pie3 = c3
				.generate({
					bindto : '#popularChart3',
					data : {
						columns : [
								monthlyE,
								monthlyA, ],
						type : 'donut',
						onclick: function (d, i) { console.log("onclick", d, i); },
						onmouseover: function (d, i) { console.log("onmouseover", d, i); },
						onmouseout: function (d, i) { console.log("onmouseout", d, i); }
					},
					donut: {
				        title: "Download Comparison"
				    }
				});

			}
		}
	});
});

