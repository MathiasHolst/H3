<body>
<%@ Page Language="C#" %>
<%@ Import Namespace="ServersideProg" %>
<%@ Import Namespace="MySql.Data.MySqlClient"%>
<%
    MySqlConnection myConnection = new
    MySqlConnection("Server=mysql3.unoeuro.com;Database=mfholst_com_db;Uid=mfholst_com;Pwd=mw4ecy2Rzrtb;");

    myConnection.Open();

    MySqlCommand myCommand = new MySqlCommand("SELECT * FROM Brugere",myConnection);
    MySqlDataReader reader = myCommand.ExecuteReader();
    List<Bruger> listOfBrugere = new List<Bruger>();

    if (reader.HasRows)
    {
        while (reader.Read())
        {
            listOfBrugere.Add(new Bruger { Id = reader.GetInt32(0), Brugernavn = reader.GetString(1), Password = reader.GetString(2)});
        }
    }
    String Navn = Request.QueryString["Navn"];
    String Password = Request.QueryString["Password"];
    if(listOfBrugere[0].Brugernavn == Navn || listOfBrugere[1].Brugernavn == Navn || listOfBrugere[2].Brugernavn == Navn)
    {
        switch (Navn)
        {
            case "Jakup":
                Session["UserID"] = 1;
                break;
            case "Ole":
                Session["UserID"] = 2;
                break;
            default:
                Session["UserID"] = 3;
                break;
        }
        Session["password"] = "view";
        Response.Redirect("varekoeb.aspx");
    }
%>
</body>