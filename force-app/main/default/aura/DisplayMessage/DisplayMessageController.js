({
	mutton : function(component, event, helper) {
		 var max = component.get("v.message");
        if(max == null){
         component.set("{!v.message}","Sunny");
        }
        if(max!=null){
        component.set("{!v.message}",null);
        }
	},
    
    chicken : function(component, event, helper) {
       var max = component.get("v.message");
        if(max == null){
         component.set("{!v.message}","Manchu");
        }
        if(max!=null){
        component.set("{!v.message}",null);
        }
	},
    
   
})