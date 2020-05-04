({
	init : function(component, event, helper) {
        
        var action = component.get("c.acc");
        action.setCallback(this,function(response){
            
            if(response.getState() == 'SUCCESS'){
                var value = response.getReturnValue();
                console.log(value);
                if(value.length>0){
                    component.set("v.accounts",value);
                   
                }
            }
        });
		$A.enqueueAction(action);
	},
    
    SelectRecord : function(component, event, helper) {
                var action = component.get("c.fetchingOpp");

        var value = component.find("accid").get("v.value");
        console.log(value);
        action.setParams({ids:value});
        action.setCallback(this,function(response){
            if(response.getState() == 'SUCCESS'){
                var values = response.getReturnValue();
                console.log(values);
                var data=[];
                for(var key in values){
                    //console.log(values[keys]);
                    data.push({label:key,value:values[key]});
                }
            }
            console.log(data);
            component.set("v.allOpportunity",data);
            
        });
                $A.enqueueAction(action);
    }
})