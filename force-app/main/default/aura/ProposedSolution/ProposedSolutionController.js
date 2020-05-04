({
	addRow : function(component, event, helper) {
       
		var details = component.get("v.rowdynamically");
        var cursize = parseInt((details.length));
        var newsize = parseInt((cursize)+1);
        details.push(newsize);
        component.set("v.rowdynamically",details);
	},
    removeRow : function(component,event,helper){
    var deletedetails = component.get("v.rowdynamically");
    var selectitem = event.currentTarget ; 
    var index = selectitem.dataset.record;      
    deletedetails.splice(index,1);
    component.set("v.rowdynamically",deletedetails);
},
    handleClick : function(component,event,helper){
        
        var propose = component.get("v.proposed");
        
        component.set("v.current",propose/500);
        component.set("v.verified",propose/400);
        
     
    }
})