Imports System.Data.SqlClient
Partial Class flightmst
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        con.Open()
        Dim cmd As New SqlCommand("flightpro", con)
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.Parameters.Add("@flightnm", Data.SqlDbType.VarChar).Value = txtnm.Text
        cmd.Parameters.Add("@arrival_time", Data.SqlDbType.VarChar).Value = txttime.Text
        cmd.Parameters.Add("@departure_time", Data.SqlDbType.VarChar).Value = Txttime2.Text
        cmd.Parameters.Add("@economy_rate", Data.SqlDbType.VarChar).Value = txtrate.Text
        cmd.Parameters.Add("@business_rate", Data.SqlDbType.VarChar).Value = txtrate1.Text
        cmd.Parameters.Add("@source", Data.SqlDbType.VarChar).Value = txtsource.Text
        cmd.Parameters.Add("@destination", Data.SqlDbType.VarChar).Value = txtdestination.Text
        cmd.Parameters.Add("@flightno", Data.SqlDbType.VarChar).Value = txtno.Text
        If cmd.ExecuteNonQuery() Then
            MsgBox("success")
        Else
            MsgBox("fail")
        End If
        con.Close()
    End Sub

    

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
    End Sub
End Class
