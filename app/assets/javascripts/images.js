//======================models ===========================







//======================view ===========================

function View(){
	this.runIds = ".runIds"
}

View.prototype.getRunId = function(){
	var runIdClicked = event.target.id
	return runIdClicked
}


//======================controller=======================

function Controller(view){
	this.view = view;
}

//use this getRunId method as paramtes to search for the strava run coordinates
//enter these coorindates as a parameter and should hit the search#search_runs method
// after the coordinates are returned, those will be entered into instgram to get the image objects
Controller.prototype.searchForImages = function(){
	console.log("controller search method")
	
	var runCoordinatesRequest = $.ajax({
		url: "/run_coordinates",
		type: "GET",
		data: {run_id: this.view.getRunId()},
		dataType: "json"
	});

	runCoordinatesRequest.done(function(event){
		console.log(event[10])
		//lat coords
		console.log(event[10][0])
		//lon coords
		console.log(event[10][1])

		var secondRequestToInstagram = $.ajax({
			url: "/instagram",
			type: "GET",
			data: {lat: event[0][0], lon: event[0][1]},
			dataType: "json"
		});
		secondRequestToInstagram.done(function(event){
			console.log(event)
		})

	})
}



Controller.prototype.bindEventListeners = function(){
	$(this.view.runIds).on('click', this.searchForImages.bind(this))
}

$(document).ready(function(){
	var viewFromMyRun = new Controller(new View());
	viewFromMyRun.bindEventListeners()

})
