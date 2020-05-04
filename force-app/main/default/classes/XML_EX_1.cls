public class XML_EX_1 {
    
    public string xml {set;get;}
    
    public XML_EX_1() {
      Dom.Document doc = new Dom.Document();
      Dom.XmlNode root = doc.createRootElement('Name',null,null);
      Dom.XmlNode lname = root.addChildElement('LastName',null,null);
      lname.addTextNode('sai');
      Dom.XmlNode fname = root.addChildElement('FirstName',null,null);
        fname.addTextNode('prasad');
        xml =doc.toXmlString();
        
    } 

}