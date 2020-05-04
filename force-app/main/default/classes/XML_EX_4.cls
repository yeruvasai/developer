public class XML_EX_4 {
    
    public string xmlstring {set;get;}
    public string result {set;get;}
    
    public void convert(){
        Dom.Document doc = new Dom.Document();
        Doc.load(xmlstring);
        Dom.XmlNode root = doc.getRootElement();
      	result = root.getName();
        //getName() : This will return the name of the element.
        //getText() : This will return the Value of the element.
        //getChildElements() : This will return list of child elements for the given code.
        
        list<Dom.XmlNode> childs = root.getChildElements();
        for(Dom.XmlNode c:childs){
            result = result+'\n'+c.getName()+' :'+c.getText();
            system.debug(result);
        }
         
    }

}