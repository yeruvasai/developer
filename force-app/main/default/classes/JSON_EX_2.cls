public class JSON_EX_2 {
    
    public integer age {set;get;}
    public account acc {set;get;}
    public student std {set;get;}
    public student newstd {set;get;}
    public map<string,object> resmap {set;get;}
    
    public JSON_EX_2(){
        age =(integer)JSON.deserialize('10',integer.class);
        string a = '{"Name":"SPR","Industry":"Software","Phone":"2135"}';
        acc = (account)JSON.deserialize(a,account.class);
    // string s = '{"Name":"Sai","Place":"HYD","Phone":"12310"}';
     string s1= '{"Name":"Sai","City":"HYD","Phone":"44651"}';
        std = (student)JSON.deserialize(s1,student.class);
        string s= '{"Name":"Sai","City":"HYD","Phone":"44651"}';
        newstd = (student)JSON.deserializeStrict(s,student.class);
        resmap = (map<string,object>)JSON.deserializeUntyped(s);
    }

}