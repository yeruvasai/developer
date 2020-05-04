({
	total : function(component, event, helper) {
        
        var pick = component.get("v.val");
        	console.log(pick);
        var list = component.get("v.select");
        	console.log(list);
      	
        var vl=[];
        
        for(var i=0;i<list.length;i++){
            if(list[i]!= pick){
                vl.push(list[i]);
                console.log(vl);
            }
        }
        
        var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:NavigatePage",
        componentAttributes: {
            select1 : vl
        }
    });
    evt.fire();
        
        
	}
})