//======================models ===========================







//======================view ===========================

function View(){
	this.runIds = ".runIds"
}

View.prototype.getRunId = function(){
	var runIdClicked = event.target.id
	console.log(runIdClicked)
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
	this.view.getRunId()
}



Controller.prototype.bindEventListeners = function(){
	$(this.view.runIds).on('click', this.searchForImages.bind(this))
}

$(document).ready(function(){
	var viewFromMyRun = new Controller(new View());
	viewFromMyRun.bindEventListeners()

})
