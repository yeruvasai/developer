({
	fetchAccount : function(component, event, helper) {
        
        var action = component.get("c.getAccount") ; 
        
        var accountids = component.get("v.recordId");
        
        action.setParams({
            accountid : accountids
        });
        
        action.setCallback(this, function(response) {
            
            var state = response.getState();
            // Check if response state is success
            if(state === 'SUCCESS') {
                // Getting the list of contacts from response and storing in js variable
                var accountlist = response.getReturnValue();
                // Set the list attribute in component with the value returned by function
                component.set("v.accountlist",accountlist);
            }
            else {
                // Show an alert if the state is incomplete or error
                alert('Error in getting data');      
            }
                           
        });
    // Adding the action variable to the global action queue
        $A.enqueueAction(action);
        
		
	}
})