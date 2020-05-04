({
	 init : function(component, event, helper) {
     component.set('v.regcolumn', [
         {label:'Id' ,fieldName: 'Id' , type:'id'},
            
            
        ]);
        var sear = component.get("v.Searchtext")
         var action = component.get("c.regfetch");
        action.setParams({
            "regis" : sear
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.reg", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
            
   
        
    },
         
    updateSelectedText :function(component,event,helper){
        
        var chec = event.getParam("selectedRows");
         console.log(chec);
         var evt = $A.get("e.c:taskEvent");
         evt.setParams({"temp":chec});
         evt.fire();
        
    
    }
    
})