({
	init : function(component, event, helper) {
        
        component.set('v.columnwrapper', [
            {label: 'Name', fieldName: 'listacc', type: 'text'},
            {label: 'LastName', fieldName: 'listcon', type: 'text'}
            
        ]);
		//var sear = component.get("v.wrapper")
         var action = component.get("c.getRec");
        //action.setParams({
            
        //});
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.wrapper", response.getReturnValue());
            }
            else{
                alert('failed');
            }
        });
        $A.enqueueAction(action);
	}
})