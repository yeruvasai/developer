({
	init : function(component, event, helper) {
        
        var action = component.get("c.rec");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state == 'SUCCESS'){
                var value = response.getReturnValue();
                console.log(value);
                if(value.length>0){
                    component.set("v.oppovalue",value);
                   
                }
            }
        });
		$A.enqueueAction(action);
	},
    submit:function(component,event,helper){

 	var value = component.find("oppo").get("v.value");
        console.log(value);
	var action = component.get("c.conRec");
	action.setParams({id:value})
	action.setCallback(this,function(response){
    
    var state = response.getState();
    if(state == 'SUCCESS'){
        var value = response.getReturnValue();
        if(value.length>0){
            component.set("v.Accountrec",value);
        }
    }
    
});

$A.enqueueAction(action);

},
    
    schedule:function(component,event,helper){
        
        var value = event.getSource().get("v.value");
        component.set("v.ids",value);
        console.log(component.get("v.ids"));
         console.log(value);
    },
        handleClick:function(component,event,helper){    
        var num = component.get("v.textbox");
        var numid = component.get("v.ids");
        var action = component.get("c.sched")
        action.setParams({ids:numid,numb:num});
        action.setCallback(this,function(response){
        
           
});

$A.enqueueAction(action);
       
        
    }

})