({
	init : function(component, event, helper) {
        
        var action = component.get("c.acclis");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == "SUCCESS"){
                var res= response.getReturnValue();
                component.set("v.acclist",res);
                
            }
            else{
                alert("FAIL");
            }
            });
        $A.enqueueAction(action);
		
	},
    handleClick: function(component,event,helper){
        var ind = event.getSource().get('v.value');
        var temp = component.get("v.acclist");
        var acc = temp[ind];   
        temp.forEach(deletefunc);
        function deletefunc(items){
            if(items.Name == acc.Name){
                temp.splice(temp.indexOf(items),1);
            }
            
        }
        component.set("v.acclist", temp);
       
    }
})