({
	submit : function(component, event, helper) {
        
        var details = component.get("v.educationdetail");
        var currentsize = parseInt((details.length));
        var newsize = parseInt((currentsize)+1);
        details.push(newsize);
        component.set("v.educationdetail",details);
	},
    
         
   
    
    
})