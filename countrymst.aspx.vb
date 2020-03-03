Imports System.Data.SqlClient
Partial Class countrymst
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Try
            con.Open()
            Dim cmd As New SqlCommand("insert into countrymst values('" & txtcountry.Text & "')", con)

            If cmd.ExecuteNonQuery() Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Country name saved');", True)
                txtcountry.Text = ""
                ' MsgBox("Sucess")

            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fail", "alert('Country name save fails ');", True)
                'MsgBox("Fail")
            End If

        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message.Replace("\r\n", String.Empty), False)
        Finally
            con.Close()
        End Try
        
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Try
            con.Open()
            Dim cmd As New SqlCommand("updatecountry", con)
            cmd.CommandType = Data.CommandType.StoredProcedure
            cmd.Parameters.Add("@Id", Data.SqlDbType.VarChar).Value = DropDownList1.SelectedValue
            cmd.Parameters.Add("@Country", Data.SqlDbType.VarChar).Value = txtcountry.Text
            If cmd.ExecuteNonQuery Then
                txtcountry.text = ""
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Country name saved');", True)
                'MsgBox("sucess")
            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fail", "alert('Country name saved fails');", True)
                'MsgBox("fail")

            End If
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message.Replace("\r\n", String.Empty), False)
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Try
            con.Open()
            Dim adap As New SqlDataAdapter("select * from countrymst where id='" & DropDownList1.SelectedValue & "'", con)
            Dim ds As New Data.DataTable()
            adap.Fill(ds)
            txtcountry.Text = ds.Rows(0)("country").ToString
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message.Replace("\r\n", String.Empty), False)
        Finally
            con.Close()
        End Try
    End Sub
End Class
