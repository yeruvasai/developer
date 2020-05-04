({
	init : function(component, event, helper) {
        
        component.set('v.updatecolumn',[
            {label: 'Id', fieldName: 'Id', type: 'text' , editable: true},
            {label: 'name', fieldName: 'Name', type: 'text' , editable: true},
            {label: 'phone', fieldName: 'Phone', type: 'Phone' , editable: true}
        ]);
		
       var action = component.get("c.getAllcontact");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var data = response.getReturnValue();
                component.set("v.updaterec",data);
            }
            // error handling when state is "INCOMPLETE" or "ERROR"
        });
        $A.enqueueAction(action);
	},
    
    onSave : function (component, event, helper) {
    	
	var editable =component.find("accountDataTable").get("v.draftValues");
        component.set("v.updatedRecord",editable);
        var data=component.get("v.updatedRecord");
        console.log(data);
	var action = component.get("c.updatecontact");
        action.setParams({
            acc : editable
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
            $A.get('e.force:refreshView').fire();
            }
            else{
                alert("FAil");
            }
        });        
	     $A.enqueueAction(action);   
    },
})