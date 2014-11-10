<!-- START MODALS -->
	<div class="modal fade" id="signInModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Sign In</h4>
				</div>
				<div class="modal-body">
					<form>
						<fieldset>
							<div class="form-group">
								<span id="signInError" class="formerror"></span>
							</div>
							<div class="form-group">
								<input id="email" class="form-control" placeholder="Email" name="email" type="email">
							</div>
							<div class="form-group">
								<input id="password" class="form-control" placeholder="Password" name="password" type="password">
							</div>
							<div class="checkbox">
								<label> <input name="remember" type="checkbox" value="Remember Me">Remember Me</label>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<a href="javascript:void();" onclick='signInOrOut()' type="button" name='signin' class="btn btn-primary determineRole">Sign In</a>
					<a href="admin" type="button" name='signin' class="btn btn-danger">Admin</a>
					<a href="test" type="button" class="btn btn-success">Test</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="bookModal" tabindex="-1">
		<div class="modal-dialog" id="bookModalDialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only"></span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"></button>
				</div>
			</div>
		</div>
	</div>

	<!-- Register Modal -->
	<div class="modal fade" id="registerModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="registerForm" method="post" class="form-horizontal"
					data-bv-message="This value is not valid"
					data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
					data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
					data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span>&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="registerModalLabel">Register Account</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">Library Card Number</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="libraryCardNumber"
									placeholder="123456789"
									data-bv-message="The library card number is not valid"
									data-bv-notempty="true"
									data-bv-notempty-message="The library card number is required and cannot be empty"
									data-bv-regexp="true" data-bv-regexp-regexp="^[0-9]+$"
									data-bv-regexp-message="The library card number consists of 9 numbers"
									data-bv-stringlength="true" data-bv-stringlength-min="9"
									data-bv-stringlength-max="9"
									data-bv-stringlength-message="The library card number must be 9 characters long"
									data-bv-different="true" data-bv-different-field="password"
									data-bv-different-message="The library card number and password cannot be the same as each other" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">First Name</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="firstName"
									placeholder="William" data-bv-notempty="true"
									data-bv-notempty-message="The first name is required and cannot be empty" />
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">Last Name</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="lastName"
									placeholder="Shakespeare" data-bv-notempty="true"
									data-bv-notempty-message="The last name is required and cannot be empty" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Email address</label>
							<div class="col-sm-5">
								<input class="form-control" name="email" type="text"
									placeholder="will@shakespeare.com"
									data-bv-notempty="true"
									data-bv-regexp="true" data-bv-regexp-regexp="^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$"
									data-bv-regexp-message="The input is not a valid email address" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="password"
									data-bv-notempty="true"
									data-bv-notempty-message="The password is required and cannot be empty"
									data-bv-different="true" data-bv-different-field="username"
									data-bv-different-message="The password cannot be the same as username" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Retype password</label>
							<div class="col-sm-5">
								<input type="password" class="form-control"
									name="confirmPassword" data-bv-notempty="true"
									data-bv-notempty-message="The confirm password is required and cannot be empty"
									data-bv-identical="true" data-bv-identical-field="password"
									data-bv-identical-message="The password and its confirm are not the same"
									data-bv-different="true" data-bv-different-field="username"
									data-bv-different-message="The password cannot be the same as username" />
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Register</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="helpModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Help</h4>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="advancedSearchModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Advanced Search</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<fieldset>
							<legend>Book Information</legend>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="titleInput">Title:</label>
								<div class="col-sm-9">
									<input id="titleInput" name="titleInput" type="text"
										placeholder="Title..." class="form-control">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="authorCreatorInput">Author:</label>
								<div class="col-sm-9">
									<input id="authorCreatorInput" name="authorCreatorInput"
										type="text" placeholder="Author..."
										class="form-control">
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="dateAddedSelect"> Added:</label>
								<div class="col-sm-9">
									<select id="dateAddedSelect" name="dateAddedSelect"
										class="form-control">
										<option>Past 7 Days</option>
										<option>Past 14 Days</option>
										<option>Past 30 Days</option>
										<option>Past 3 Months</option>
										<option>Past 6 Months</option>
										<option>Past Year</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="subjectSelect">Subject:
								</label>
								<div class="col-sm-9">
									<select id="subjectSelect" name="subjectSelect"
										class="form-control">
										<option>All Subjects</option>
										<option>Action</option>
										<option>Adventure</option>
										<option>African American Fiction</option>
										<option>African American Nonfiction</option>
										<option>Alternative</option>
										<option>Ambient</option>
										<option>Analysis</option>
										<option>Animation</option>
										<option>Antiques</option>
										<option>Architecture</option>
										<option>Art</option>
										<option>Ballet</option>
										<option>Beginning Reader</option>
										<option>Biography &amp; Autobiography</option>
										<option>Blues</option>
										<option>Business</option>
										<option>Careers</option>
										<option>Cartoon</option>
										<option>Chamber Music</option>
										<option>Chemistry</option>
										<option>Chick Lit Fiction</option>
										<option>Children</option>
										<option>Children's Music</option>
										<option>Children's Video</option>
										<option>Choral</option>
										<option>Christian Fiction</option>
										<option>Christian Nonfiction</option>
										<option>Classic Film</option>
										<option>Classic Literature</option>
										<option>Classical</option>
										<option>Comedy</option>
										<option>Comic and Graphic Books</option>
										<option>Computer Technology</option>
										<option>Concertos</option>
										<option>Cooking &amp; Food</option>
										<option>Country</option>
										<option>Crafts</option>
										<option>Crime</option>
										<option>Criticism</option>
										<option>Current Events</option>
										<option>Documentary</option>
										<option>Drama</option>
										<option>Economics</option>
										<option>Education</option>
										<option>Electronica</option>
										<option>Engineering</option>
										<option>Entertainment</option>
										<option>Erotic Literature</option>
										<option>Essays</option>
										<option>Ethics</option>
										<option>Family &amp; Relationships</option>
										<option>Fantasy</option>
										<option>Feature Film</option>
										<option>Feminist</option>
										<option>Fiction</option>
										<option>Film Music</option>
										<option>Finance</option>
										<option>Folk</option>
										<option>Folklore</option>
										<option>Foreign Film</option>
										<option>Foreign Language</option>
										<option>Foreign Language Study</option>
										<option>Foreign Language Study - Chinese</option>
										<option>Foreign Language Study - French</option>
										<option>Foreign Language Study - German</option>
										<option>Foreign Language Study - Italian</option>
										<option>Foreign Language Study - Japanese</option>
										<option>Foreign Language Study - Russian</option>
										<option>Foreign Language Study - Spanish</option>
										<option>Foreign Language Study - Vietnamese</option>
										<option>Games</option>
										<option>Gardening</option>
										<option>Gay/Lesbian</option>
										<option>Gender Studies</option>
										<option>Genealogy</option>
										<option>Geography</option>
										<option>Grammar &amp; Language Usage</option>
										<option>Health &amp; Fitness</option>
										<option>Historical Fiction</option>
										<option>History</option>
										<option>Holiday Music</option>
										<option>Home Design &amp; Décor</option>
										<option>Horror</option>
										<option>Human Rights</option>
										<option>Humor (Fiction)</option>
										<option>Humor (Nonfiction)</option>
										<option>IMAX</option>
										<option>Indie</option>
										<option>Inspirational</option>
										<option>Instructional</option>
										<option>Instrumental</option>
										<option>Jazz</option>
										<option>Journalism</option>
										<option>Judaica</option>
										<option>Juvenile Fiction</option>
										<option>Juvenile Literature</option>
										<option>Juvenile Nonfiction</option>
										<option>Language Arts</option>
										<option>Law</option>
										<option>Literary Anthologies</option>
										<option>Literary Criticism</option>
										<option>Literature</option>
										<option>Management</option>
										<option>Marketing &amp; Sales</option>
										<option>Martial Arts</option>
										<option>Mathematics</option>
										<option>Media Studies</option>
										<option>Medical</option>
										<option>Military</option>
										<option>Multi-Cultural</option>
										<option>Music</option>
										<option>Musical</option>
										<option>Mystery</option>
										<option>Mythology</option>
										<option>Nature</option>
										<option>New Age</option>
										<option>Non-English Fiction</option>
										<option>Non-English Nonfiction</option>
										<option>Nonfiction</option>
										<option>Opera &amp; Operetta</option>
										<option>Orchestral</option>
										<option>Outdoor Recreation</option>
										<option>Performing Arts</option>
										<option>Pets</option>
										<option>Philosophy</option>
										<option>Photography</option>
										<option>Physics</option>
										<option>Picture Book Fiction</option>
										<option>Picture Book Nonfiction</option>
										<option>Poetry</option>
										<option>Politics</option>
										<option>Pop</option>
										<option>Professional</option>
										<option>Psychiatry</option>
										<option>Psychiatry &amp; Psychology</option>
										<option>Psychology</option>
										<option>Ragtime</option>
										<option>Recovery</option>
										<option>Reference</option>
										<option>Religion &amp; Spirituality</option>
										<option>Research</option>
										<option>Rock</option>
										<option>Romance</option>
										<option>Scholarly</option>
										<option>Science</option>
										<option>Science Fiction</option>
										<option>Science Fiction &amp; Fantasy</option>
										<option>Self Help</option>
										<option>Self-Improvement</option>
										<option>Short Film</option>
										<option>Short Stories</option>
										<option>Sociology</option>
										<option>Soundtrack</option>
										<option>Sports &amp; Recreations</option>
										<option>Study Aids &amp; Workbooks</option>
										<option>Suspense</option>
										<option>Technology</option>
										<option>Theater</option>
										<option>Thriller</option>
										<option>Transportation</option>
										<option>Travel</option>
										<option>Travel Literature</option>
										<option>True Crime</option>
										<option>TV Series</option>
										<option>Urban Fiction</option>
										<option>Vocal</option>
										<option>Western</option>
										<option>Women's Studies</option>
										<option>World Music</option>
										<option>Young Adult Fiction</option>
										<option>Young Adult Literature</option>
										<option>Young Adult Nonfiction</option>
										<option>Young Adult Video</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="formatSelect">Format:
								</label>
								<div class="col-sm-9">
									<select id="formatSelect" name="formatSelect"
										class="form-control">
										<option>All Formats</option>
										<option>All eBooks</option>
										<option>All Audiobooks</option>
										<option>All Music</option>
										<option>Kindle Book</option>
										<option>OverDrive Read</option>
										<option>EPUB eBook</option>
										<option>Open EPUB eBook</option>
										<option>PDF eBook</option>
										<option>OverDrive MP3 Audiobook</option>
										<option>OverDrive WMA Audiobook</option>
										<option>OverDrive Video</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="languageSelect">Language:
								</label>
								<div class="col-sm-9">
									<select id="languageSelect" name="languageSelect"
										class="form-control">
										<option>All Languages</option>
										<option>Arabic</option>
										<option>Chinese (Simplified)</option>
										<option>Czech</option>
										<option>English</option>
										<option>French</option>
										<option>German</option>
										<option>Greek</option>
										<option>Hebrew</option>
										<option>Hindi</option>
										<option>Hungarian</option>
										<option>Italian</option>
										<option>Japanese</option>
										<option>Korean</option>
										<option>Mongolian</option>
										<option>Persian</option>
										<option>Polish</option>
										<option>Portuguese</option>
										<option>Romanian</option>
										<option>Russian</option>
										<option>Spanish</option>
										<option>Swedish</option>
										<option>Tagalog</option>
										<option>Thai</option>
										<option>Turkish</option>
										<option>Urdu</option>
										<option>Vietnamese</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="publisherSelect">Publisher:
								</label>
								<div class="col-sm-9">
									<select id="publisherSelect" name="publisherSelect"
										class="form-control">
										<option>These should be</option>
										<option>Filled Out Dynamically</option>
										<option>Selecting The Different</option>
										<option>Types of Publishers</option>
										<option>Currently In Our</option>
										<option>Database.</option>
									</select>
								</div>
							</div>

							<!-- Select Basic -->
							<div class="form-group">
								<label class="col-sm-2 control-label" for="awardSelect">Awards:
								</label>
								<div class="col-sm-9">
									<select id="awardSelect" name="awardSelect"
										class="form-control">
										<option>These should be</option>
										<option>Filled Out Dynamically</option>
										<option>Selecting The Different</option>
										<option>Types of Awards</option>
										<option>Currently In Our</option>
										<option>Database.</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-1 checkbox col-sm-9">
									<label> <input id="availableNowOnly" type="checkbox"
										value=""> Only Show Books Available Now
									</label>
								</div>
							</div>

							<fieldset>
								<legend>Levels</legend>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="interestFromSelect">Interest
										Level: </label>
									<div class="col-sm-4">
										<select id="interestFromSelect" name="interestFromSelect"
											class="form-control">
											<option>All</option>
											<option>Lower Grades (K-3)</option>
											<option>Middle Grades (4-8)</option>
											<option>Lower Grades + (6-12)</option>
											<option>Upper Grades (8-12)</option>
										</select>
									</div>
									<div class="col-sm-1">
										<label class="control-label">to</label>
									</div>
									<div class="col-sm-4">
										<select id="interestToSelect" name="interestToSelect"
											class="form-control">
											<option>All</option>
											<option>Lower Grades (K-3)</option>
											<option>Middle Grades (4-8)</option>
											<option>Lower Grades + (6-12)</option>
											<option>Upper Grades (8-12)</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="atosFromSelect">ATOS
										Level: </label>
									<div class="col-sm-4">
										<select id="atosFromSelect" name="atosFromSelect"
											class="form-control">
											<option>All</option>
											<option>ToDo: More Values</option>
										</select>
									</div>
									<div class="col-sm-1">
										<label class="control-label">to</label>
									</div>
									<div class="col-sm-4">
										<select id="atosToSelect" name="atosToSelect"
											class="form-control">
											<option>All</option>
											<option>ToDo: More Values</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label" for="readingFromSelect">Reading
										Level: </label>
									<div class="col-sm-4">
										<select id="readingFromSelect" name="readingFromSelect"
											class="form-control">
											<option>All</option>
											<option>ToDo: More Values</option>
										</select>
									</div>
									<div class="col-sm-1">
										<label class="control-label">to</label>
									</div>
									<div class="col-sm-4">
										<select id="readingToSelect" name="readingToSelect"
											class="form-control">
											<option>All</option>
											<option>ToDo: More Values</option>
										</select>
									</div>
								</div>
							</fieldset>
						</fieldset>
					</form>
				</div>
				<div class="modal-footer">
					<a href="search?type=Advanced" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END MODALS -->