/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author meher
 */
public class Clientinfo {
    
    private int client_id;
    private String name, email, address, phone, dob;
    
    public Clientinfo(int client_id, String name, String email, String address, String phone, String dob)
    {
        this.client_id=client_id;
        this.name=name;
        this.email=email;
        this.address=address;
        this.phone=phone;
        this.dob=dob;
        
    }
    
    public int getclient_id()
    {
        return client_id;
    }
     public String getname()
    {
        return name;
    }
      public String getemail()
    {
        return email;
    }
       public String getaddress()
    {
        return address;
    }
        public String getphone()
    {
        return phone;
    }
    public String getdob()
    {
        return dob;
    }
    
    
    
}
