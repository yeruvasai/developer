({
	search : function(component, event, helper) {
        
        component.set('v.regcolumn',[
            {label: 'name', fieldName: 'Name', type: 'text' },
            {label: 'phone', fieldName: 'Phone', type: 'Phone' }
        ]);
        
        var rec = component.get("v.Searchtext");
        console.log(rec);
        
        var action = component.get("c.accounts");
        
        action.setParams({
            acc : rec
        });
        
        action.setCallback(this,function(response){
            var state = response.getState();
            
            if(state === "SUCCESS"){
                if( rec ==""){
                    component.set("v.accrec",null);
                }else{
                component.set("v.accrec",response.getReturnValue());
                }
            }
            
        });
		$A.enqueueAction(action);
	}
})