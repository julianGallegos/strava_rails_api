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
