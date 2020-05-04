({
	add : function(component) {
        var sum = component.get("v.num1")+component.get("v.num2");
        component.set("v.result",sum)    
 
	},
    sub : function(component) {
        var sum = component.get("v.num1")-component.get("v.num2");
        component.set("v.result",sum)    
 
	},
 	mul : function(component) {
        var sum = component.get("v.num1")*component.get("v.num2");
        component.set("v.result",sum)    
 
	},
	div : function(component) {
        var sum = component.get("v.num1")/component.get("v.num2");
        component.set("v.result",sum)    
 
	}
})