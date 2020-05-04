public class XML_EX_3 {
    
    public string result {set;get;}
    public string  text {set;get;}
    public account acc {set;get;}
    
    public void submit(){
        acc = [select name,phone,industry,(select lastname,firstname,phone from contacts) from account where name =: text];
        Dom.Document doc = new Dom.Document();
        Dom.XmlNode root = doc.createRootElement('Company',null,null);
        root.setAttribute('Name',acc.name);
        root.setAttribute('Industry',acc.Industry);
        root.setAttribute('Phone',acc.Phone);
        Dom.XmlNode header = root.addChildElement('Header',null,null);
        header.setAttribute('Status','SUCCESS');
        header.setAttribute('Persons',''+acc.contacts.size());
        
        if(acc.contacts.size()>0){
            
            for(contact c:acc.contacts){
                
                Dom.XmlNode person = root.addChildElement('Person',null,null);
                Dom.XmlNode lname = person.addChildElement('LastName',null,null);
                Dom.XmlNode fname = person.addChildElement('FirstName',null,null);
                Dom.XmlNode phone = person.addChildElement('Phone',null,null);
                lname.addTextNode(c.LastName);
                fname.addTextNode(c.FirstName);
                phone.addTextNode(c.Phone);
                
            }
            
        }
        result = doc.toXmlString();
        
    } 
}