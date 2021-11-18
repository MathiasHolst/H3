<body>
    <%@ Page Language="C#" %>
    <%@ Import Namespace="ServersideProg" %>
    <%@ Import Namespace="MySql.Data.MySqlClient"%>
    <%
        MySqlConnection myConnection = new
        MySqlConnection("Server=mysql3.unoeuro.com;Database=mfholst_com_db;Uid=mfholst_com;Pwd=mw4ecy2Rzrtb;");

        myConnection.Open();

        if(Session["password"] == null){
            Server.Transfer("index.html");
        }

        if(Request.QueryString["vare1"] == "Køb"){
            insertIntoKurv(1);
        } else if(Request.QueryString["vare2"] == "Køb"){
            insertIntoKurv(2);
        } else if (Request.QueryString["vare3"] == "Køb"){
            insertIntoKurv(3);
        } else if (Request.QueryString["vare4"] == "Køb"){
            insertIntoKurv(4);
        } else {
            Response.Write($"Userid = { Session["UserID"]}");
            MySqlCommand myCommand = new MySqlCommand($"SELECT * FROM VarerKurv WHERE BrugerID = {Session["UserID"]}",myConnection);
            MySqlDataReader reader = myCommand.ExecuteReader();
            List<VarerKurv> listOfVarerInKurv = new List<VarerKurv>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    listOfVarerInKurv.Add(new VarerKurv { Navn = reader.GetString(0)});
                }
            }
            Response.Write("<h1>Din kurv indeholder</h1>");
            for (int i = 0; listOfVarerInKurv.Count > i; i++){
                Response.Write($"{listOfVarerInKurv[i].Navn}" + "<br>");
            }
        }

        void insertIntoKurv(int vareid)
        {
            MySqlCommand myCommand = new MySqlCommand($"INSERT INTO Kurv (VareID, BrugerID) VALUES ({vareid}, {Session["UserID"]})",myConnection);
            MySqlDataReader reader = myCommand.ExecuteReader();
            Response.Write($"Userid = { Session["UserID"]}");
        }
    %>
</body>