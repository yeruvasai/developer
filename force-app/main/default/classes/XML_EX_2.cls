public class XML_EX_2 {
    
    public string result {set;get;}
    
    public XML_EX_2 (){
        Dom.Document doc = new Dom.Document();
        Dom.XmlNode root = doc.createRootElement('College',null,null);
        root.setAttribute('code','22544');
        root.setAttribute('universty','JNTU-H');
        Dom.XmlNode name = root.addChildElement('Name',null,null);
        name.addTextNode('CBIT');
        Dom.XmlNode phone = root.addChildElement('Phone',null,null);
        phone.addTextNode('456230');
        Dom.XmlNode add = root.addChildElement('Address',null,null);
        Dom.XmlNode city = add.addChildElement('City',null,null);
        city.addTextNode('hyd');
        Dom.XmlNode state = add.addChildElement('State',null,null);
        state.addTextNode('TG');
        result = doc.toXmlString();
    }

}