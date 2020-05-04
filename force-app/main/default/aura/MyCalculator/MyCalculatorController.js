({
	one : function(component, event, helper) {
        var sum1 = component.get("v.num1");
        var sum = sum1*10+1;
    
		component.set("v.num1",sum)
	},
    
    two : function(component, event, helper) {
       var sum1 = component.get("v.num1");
        var sum = sum1*10+2;
        
		component.set("v.num1",sum)
	},
    
    three : function(component, event, helper) {
        var sum1 = component.get("v.num1");
        var sum = sum1*10+3;
         
		component.set("v.num1",sum)
	},
    
    four : function(component, event, helper) {
        var sum1 = component.get("v.num1");
        var sum = sum1*10+4;
         
		component.set("v.num1",sum)
		
	},
    
    five : function(component, event, helper) {
        var sum1 = component.get("v.num1");
        var sum = sum1*10+5;
         
		component.set("v.num1",sum)
		
	},
    
    six : function(component, event, helper) {
        var sum1 = component.get("v.num1");
        var sum = sum1*10+6;
         
		component.set("v.num1",sum)
		
	},
    
    seven : function(component, event, helper) {
var sum1 = component.get("v.num1");
        var sum = sum1*10+7;
         
		component.set("v.num1",sum)
		
	},
    
    eight : function(component, event, helper) {
        var sum1 = component.get("v.num1");
        var sum = sum1*10+8;
         
		component.set("v.num1",sum)
		
	},
    
    nine : function(component, event, helper) {
        var sum1 = component.get("v.num1");
        var sum = sum1*10+9;
         
		component.set("v.num1",sum)
		
	},
    
    zero : function(component, event, helper) {
        var sum1 = component.get("v.num1");
        var sum = sum1*10+0;
         
		component.set("v.num1",sum)
		
	},
    
    
    dot : function(component, event, helper) {
        var sum = component.get("v.num1")+'.';
         
		component.set("v.num1",sum)
		
	},
    
    clear : function(component, event, helper) {
        
         
		component.set("v.num1",0)
   },
    
    
    plus : function(component, event, helper) {
        var sum = component.get("v.num1");
         
        
		component.set("v.int1",sum);
        component.set("v.num1",0);
        component.set("v.int2",0);
        component.set("v.int3",0);
        component.set("v.int4",0);
		
	},
    
    minus : function(component, event, helper) {
        var sum = component.get("v.num1");
         
        
		component.set("v.int2",sum);
        component.set("v.num1",0);
        component.set("v.int1",0);
        component.set("v.int3",0);
        component.set("v.int4",0);
		
	},
    
    multiple : function(component, event, helper) {
        var sum = component.get("v.num1");
         
        
		component.set("v.int3",sum);
        component.set("v.num1",0);
        component.set("v.int1",0);
        
        component.set("v.int2",0);
		
	},
    
    divide : function(component, event, helper) {
        var sum = component.get("v.num1");
         
        
		component.set("v.int4",sum);
        component.set("v.num1",0);
        component.set("v.int1",0);
        component.set("v.int2",0);
         component.set("v.int3",0);
		
	},
    
    equal : function(component, event, helper) {
        var add = component.get("v.int1");
        var val = component.get("v.num1");
        var sub = component.get("v.int2");
        var mul = component.get("v.int3");
        var div = component.get("v.int4");
        if(add!= 0){
        var total = parseInt(add)+parseInt(val);
     		component.set("v.num1", parseInt(total) );
        }
        else if(sub!= 0 ){
                var total = parseInt(sub)-parseInt(val);
     		component.set("v.num1", parseInt(total) );
            }
            else if(mul!= 0){
                var total = parseInt(mul)*parseInt(val);
                component.set("v.num1", parseInt(total) );
            }
                else if(div!= 0){
                    var total = parseInt(div)/parseInt(val);
                    component.set("v.num1", parseInt(total) );
                }
         
    
    }
 

    
    
})