({
	init : function(component, event, helper) {
        
        /*component.set('v.columnwrapper', [
            {label: 'Name', fieldName: 'Name', type: 'text'}
        ]);*/
        var dat = component.get("v.rec");
        var action = component.get("c.datrec");
        action.setCallback(this,function(response){
            var State = response.getState();
            if(State == 'SUCCESS'){
                alert('success');
                var value = response.getReturnValue();
                console.log(value);
                //component.set("v.wrapper",value);
                var s = [];
                s.push({label:'Name',type:'text'});
                value.forEach(function(result){                   
                    s.push({label:result.Name,type:'text'});
                    });
                component.set("v.columnwrapper",s);
                console.log(s);
                
            }else{
                alert('fail');
            }
        });
		$A.enqueueAction(action);
	}
})