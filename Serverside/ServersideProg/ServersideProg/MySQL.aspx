<%@ Page Language="C#" %>
<%@ Import Namespace="ServersideProg"%>
<%@ Import Namespace="MySql.Data.MySqlClient"%>
<%
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
    foreach (var vare in listOfVarer)
    {                    
        Response.Write(vare.ImageUrl +" - "+ vare.Name +" - <br>" );
    }
%>
