public class JSON_EX_1 {
    
    public string integervalue {set;get;}
    public string decimalvalue {set;get;}
    public string accountvalue {set;get;}
    public string studentvalue {set;get;}
    public string integerpretty {set;get;}
    public string decimalpretty {set;get;}
    public string accountpretty {set;get;}
    public string studentpretty {set;get;}
    public string valuenull {set;get;}
    public string value1 {set;get;}
    
    public JSON_EX_1(){
        integervalue = JSON.serialize(10);
        decimalvalue = JSON.serialize(100.123);
        account acc = new account(name='Wipro',industry='Banking');
        accountvalue = JSON.serialize(acc);
        student stu = new student();
        stu.name = 'pavan';
        stu.city = 'hyd';
        stu.phone = '123456';
        studentvalue = JSON.serialize(stu);
        integerpretty = JSON.serializePretty(10);
        decimalpretty = JSON.serializePretty(100.123);
        accountpretty = JSON.serializePretty(acc);
        studentpretty = JSON.serializePretty(stu);
        student std = new student();
        std.name = 'murari';
        std.city = 'che';
        valuenull = JSON.serialize(std);
        value1 = JSON.serialize(std,true);
        
    }

}