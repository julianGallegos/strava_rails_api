//======================models ===========================







//======================view ===========================

function View(){

}



//======================controller=======================

function Controller(view){
	this.view = view;
}

Controller.prototype.bindEventListeners = function(){
	
}

$(document).ready(function(){
	var myApp = new Controller(new view())
	myApp.bindEventListeners();
})
