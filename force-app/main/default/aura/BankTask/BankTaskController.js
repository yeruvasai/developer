({
	next : function(component, event, helper) {
        
        var num1 = component.get("v.val");
        	console.log(num1);
        var num2 = component.get("v.values");
        	console.log(num2);
        
        if(num1 === num2 ){
            
            alert("City Name Should Not Be Same");
            
        }
        else if(num1 != num2){
            
         /*   var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
        "url": "http:www.google.com"
    });

    urlEvent.fire();*/
            
         //   window.open("http:www.google.com");
        var evt = $A.get("e.force:navigateToComponent");
		evt.setParams({
		componentDef : "c:MyCalculator",
		componentAttributes: {
 
		}
	});
	evt.fire();
            
            
        }
		
	}
})