using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for Service
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class Service : System.Web.Services.WebService {

    public Service () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public List<string> GetCities(string q) {
        var province= new List<string>() { 
            "Bergamo", 
            "Brescia",
            "Como",
            "Cremona",
            "Lodi",
            "Mantova",
            "Milano",
            "Monza",
            "Pavia",
            "Piacenza",
            "Sondrio",
            "Varese"
        };
        return province.Where(p => p.ToLower().StartsWith(q.ToLower())).ToList();

    }
    
}
