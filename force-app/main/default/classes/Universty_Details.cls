public class Universty_Details {
    public faculty fac;
    public address1 addr;
	public string univ_name;
    public string branch;
    public integer estd;
    
    public class Faculty{
        public string faculty_name;
        public string dept;
        public integer salary;
    }
    
    public class Address1{
        public string city;
        public string state;
        public integer zipcode;
        public string country;
    }
    
    public Universty_Details(string univ_name ,string branch ,integer estd ){
        this.univ_name = univ_name;
        this.branch = branch;
        this.estd = estd;
        
        fac = new Faculty();
        fac.faculty_name = 'pavan'; 
        fac.dept = 'ECE';
        fac.salary = 50000;
        
        addr = new address1();
        addr.city = 'hyderabad';
        addr.state = 'telangana';
        addr.zipcode = 500055;
        addr.country = 'india';
    }
}