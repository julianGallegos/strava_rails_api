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
		for (var i = 0; i < event.length; i ++){
			console.log(event[i])
		var secondRequestToInstagram = $.ajax({
			url: "/instagram",
			type: "GET",
			data: {lat: event[i][0], lon: event[i][1]},
			dataType: "json"
		});
		secondRequestToInstagram.done(function(msg){
				console.log(msg)
					
			  	// $('.instagram_images').append('')
			  	// $('.instagram_images').append('<img class="instagram_pics col-md-4" src=' + msg.data[i].images.standard_resolution.url + '>');
					$('.instagram_images').each(function addImages(index, element){
						$(element).append('<img class="instagram_pics col-md-4" src=' + msg.data[index].images.standard_resolution.url + '>')
					})
			})
		}


	})
}



Controller.prototype.bindEventListeners = function(){
	$(this.view.runIds).on('click', this.searchForImages.bind(this))
}

$(document).ready(function(){
	var viewFromMyRun = new Controller(new View());
	viewFromMyRun.bindEventListeners()

})
