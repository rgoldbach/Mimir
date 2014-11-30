$(document)
		.ready(
				function() {
					// Sort then Filter
					$('.resultDisplay').change(function() {
						// Empty the current results
						$('#coverResultContainer').empty();
						$('#listResultContainer').empty();
						sortThenFilter();
					});
					
					// Get the first page of search results
					sortThenFilter();

					// Init result view
					$('#coverDisplay').addClass('active');
					$('#listResultContainer').hide();

					// Toggle between cover and list
					$('#coverDisplay, #listDisplay').click(function() {
						if ($(this).attr('id') == 'coverDisplay') {
							$(this).addClass('active');
							$('#listDisplay').removeClass('active');
							$('#listResultContainer').hide();
							$('#coverResultContainer').show();
						} else {
							$(this).addClass('active');
							$('#coverDisplay').removeClass('active');
							$('#coverResultContainer').hide();
							$('#listResultContainer').show();
						}
					});

					function sortThenFilter() {
						// Get the types
						var sortType = $('#sortBy').val();
						var filterTypeValues = $('#filterBy').val() || [];

						sort(sortType, filterTypeValues);

						// Load filters
						$.ajax({
							url : 'loadFilters',
							type : 'GET',
							success : function(jFilterOptions) {
								$('#authorFilters').html('');
								$('#genreFilters').html('');
								$.each(jFilterOptions.authorFilterOptions,
										function(index, value) {
											$('#authorFilters').append(
													'<option value="author?=\''
															+ value.name
															+ '\'" >'
															+ value.name + ' ('
															+ value.count
															+ ')</option>');
										});
								$.each(jFilterOptions.genreFilterOptions,
										function(index, value) {
											$('#genreFilters').append(
													'<option value="genre?=\''
															+ value.name
															+ '\'" >'
															+ value.name + ' ('
															+ value.count
															+ ')</option>');
										});
							},
							async : false
						});
						$('#filterBy').val(filterTypeValues);
						$('#filterBy').selectpicker('refresh');
					}

					// Sort search results
					function sort(sortType, filterTypeValues) {
						$.ajax({
							url : 'sortResults?sortType=' + sortType,
							type : 'GET',
							complete : function() {
								$.each(filterTypeValues,
										function(index, value) {
											filter(value);
										});
								moreResults();
							},
							async : false
						});
					}

					// Filter the results
					function filter(filterTypeValue) {
						$.ajax({
							url : 'filterResults?filterTypeValue='
									+ filterTypeValue,
							type : 'GET',
							async : false
						});
					}

					// Load more results
					$('#moreResults').click(function() {
						moreResults();
					});

					// Load more results
					function moreResults() {
						$
								.ajax({
									url : 'loadResults',
									type : 'GET',
									success : function(jResultPage) {
										console.log(jResultPage);
										var coverResults = '';
										var listResults = '';
										// For each result...
										$(jResultPage.jResults)
												.each(
														function(index) {
															// Generate the
															// cover result html
															coverResults += '<div class="col-md-3">';
															if (this.format == 'AudioBook') {
																coverResults += '<a class="thumbnail" onclick="bookModal('
																		+ this.formatId
																		+ ', \'AudioBook\')">';
															}
															if (this.format == 'EBook') {
																coverResults += '<a class="thumbnail" onclick="bookModal('
																		+ this.formatId
																		+ ', \'EBook\')">';
															}
															coverResults += '<div class="ayyyLmao">';
															coverResults += '<img class="img-responsive" src="'
																	+ this.imgPath
																	+ '" alt="...">';
															if (this.format == 'AudioBook') {
																coverResults += '<span class="ayyyLmaoContent"><span class="label label-default"><span class="glyphicon glyphicon-headphones"></span></span></span>';
															}
															if (this.format == 'EBook') {
																coverResults += '<span class="ayyyLmaoContent"><span class="label label-default"><span class="glyphicon glyphicon-book"></span></span></span>';
															}
															coverResults += '</div>';
															coverResults += '<div class="caption">';
															coverResults += '<h6 class="resultInfo">'
																	+ this.title
																	+ '</h6>';
															coverResults += '<h6 class="resultInfo">'
																	+ this.authors
																	+ '</h6>';
															coverResults += '</div>';
															coverResults += '</a>';
															coverResults += '</div>';
															// Generate the list
															// result html
															listResults += '<div class="col-md-12"><h3>'
																	+ this.title
																	+ ' by <a href="#">'
																	+ this.authors
																	+ '</a> ';
															if (this.format == 'AudioBook') {
																listResults += '<span class="label label-default"><span class="glyphicon glyphicon-headphones"></span></span>';
															}
															if (this.format == 'EBook') {
																listResults += '<span class="label label-default"><span class="glyphicon glyphicon-book"></span></span>';
															}
															listResults += '</h3></div>';
															listResults += '<div class="thumbnail col-md-2"><img class="img-responsive" src="'
																	+ this.imgPath
																	+ '" alt="..."></div>';
															listResults += '<div class="col-md-2"><p style="font-size:15px;"><span class="glyphicon glyphicon-tags"></span>';
															listResults += '<a href="#"> Tag</a>,';
															listResults += '<br><a href="#">Tag</a>,';
															listResults += '<br><a href="#">Tag</a>';
															listResults += '</p></div>';
															listResults += '<div class="col-md-8"><p  style="font-size:13px;">';
															listResults += this.description;
															listResults += '</p>';
															if (this.format == 'AudioBook') {
																listResults += '<button type="button" class="btn btn-default" onclick="bookModal('
																		+ this.formatId
																		+ ', \'AudioBook\')">More</button>';
															}
															if (this.format == 'EBook') {
																listResults += '<button type="button" class="btn btn-default" onclick="bookModal('
																		+ this.formatId
																		+ ', \'EBook\')">More</button>';
															}
															listResults += '</div><div class="col-md-12"><hr></div>';
														});

										// Show results
										$(coverResults).hide().appendTo(
												'#coverResultContainer')
												.fadeIn(1000);
										$(listResults).hide().appendTo(
												'#listResultContainer').fadeIn(
												1000);

										// If the more button's hidden (if the
										// last search hid it)
										if ($('#moreResults').css('display') == 'none') {
											$('#moreResults').show();
										}
										// Hide the more button if there's no more results
										if (jResultPage.remainingResults == 0) {
											$('#moreResults').hide();
										} else {
											$('#moreResults')
													.html(
															'More ('
																	+ jResultPage.remainingResults
																	+ ')');
										}
									},
									async : false
								});
					}
				});
