<%@ Page Language="C#" %>
<%@ Import Namespace="ServersideProg" %>
<%@ Import Namespace="MySql.Data.MySqlClient"%>
<%
    if(Session["password"] == null){
        Server.Transfer("index.html");
    }

    if(Request.QueryString["vare1"] == "Køb" || Request.QueryString["vare2"] == "Køb" || Request.QueryString["vare3"] == "Køb" || Request.QueryString["vare4"] == "Køb" || Request.QueryString["kurv"] == "Kurv"){
        Server.Transfer("Database.aspx");
    }

    List<string> imageUrls = new List<string>();

    MySqlConnection myConnection = new
    MySqlConnection("Server=mysql3.unoeuro.com;Database=mfholst_com_db;Uid=mfholst_com;Pwd=mw4ecy2Rzrtb;");

    myConnection.Open();

    MySqlCommand myCommand = new MySqlCommand("SELECT * FROM Varer",myConnection);
    MySqlDataReader reader = myCommand.ExecuteReader();
    List<Vare> listOfVarer = new List<Vare>();

    if (reader.HasRows)
    {
        while (reader.Read())
        {
            listOfVarer.Add(new Vare { Id = reader.GetInt32(0), Name = reader.GetString(1), Description = reader.GetString(2),
                ImageUrl = reader.GetString(3), Price = reader.GetString(4) });
        }
    }
    Response.Write("<h1>Varekøb siden</h1>");
    Response.Write("<form method=\"get\"" + "action=\"varekoeb.aspx\">");
    Response.Write("<table>");
    int i = 0;
    foreach (var vare in listOfVarer)
    {
        Response.Write("<tr>");
        Response.Write("<th>");
        Response.Write($"<img src=\"{vare.ImageUrl}\"" + "height=\"100\"" +  "width=\"150\"/>");
        Response.Write("<br>");
        Response.Write($"<input name=\"vare{i+1}\"" + "type=\"Submit\"" + "value=\"Køb\" />");
        Response.Write("</th>");
        Response.Write("</tr>");
        i++;
    }
    Response.Write("<input name=\"kurv\"" + "style=\"font - size:24px\"" + "type=\"Submit\"" +  "value=\"Kurv\"/>");
    Response.Write("<table>");
    Response.Write("</form>");




    /*String json = "";
    using (System.Net.WebClient client = new System.Net.WebClient())
    {
        /*System.Web.Script.Serialization.JavaScriptSerializer js = new
        System.Web.Script.Serialization.JavaScriptSerializer();
        json =
        client.DownloadString("http://services.dataprog.dk/service1.svc/getListOfVarer/");
        List<Vare> ListOfVarer = js.Deserialize<List<Vare>>(json);
          
        Response.Write("<h1>Varekøb siden</h1>");
        Response.Write("<form method=\"get\"" + "action=\"varekoeb.aspx\">");
        Response.Write("<table>");
        for(int i = 0; i < ListOfVarer.Count; i++)
        {
            Response.Write("<tr>");
            Response.Write("<th>");
            Response.Write($"<img src=\"{ListOfVarer[i].ImageUrl}\"" + "height=\"100\"" +  "width=\"150\"/>");
            Response.Write($"<input name=\"vare{i+1}\"" + "type=\"Submit\"" + "value=\"Køb\" />");
            Response.Write("</th>");
            Response.Write("</tr>");
        }
        Response.Write("<table>");
        Response.Write("</form>");
    }*/
%>