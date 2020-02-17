Imports System.Data.SqlClient
Partial Class schedule_mst
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        con.Open()
        Dim cmd As New SqlCommand("pro_schedule", con)
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.Parameters.Add("@package_Id", Data.SqlDbType.VarChar).Value = idDropDown.SelectedValue
        cmd.Parameters.Add("@day", Data.SqlDbType.VarChar).Value = txtday.Text
        cmd.Parameters.Add("@route", Data.SqlDbType.VarChar).Value = txtroute.Text
        cmd.Parameters.Add("@Night_Hold", Data.SqlDbType.VarChar).Value = txtnighthold.Text

        If cmd.ExecuteNonQuery() Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Insert Sucessfully');", True)
            reset()
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fails", "alert('Insert fail');", True)
            reset()
        End If
        con.Close()
    End Sub
    Sub reset()
        idDropDown.SelectedValue = ""
        txtday.Text = ""
        txtroute.Text = ""
        txtnighthold.Text = ""

    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        con.Open()
        Dim cmd As New SqlCommand("update_pro_schedule", con)
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.Parameters.Add("@package_id", Data.SqlDbType.VarChar).Value = idDropDown.SelectedValue
        cmd.Parameters.Add("@day", Data.SqlDbType.VarChar).Value = txtday.Text
        cmd.Parameters.Add("@route", Data.SqlDbType.VarChar).Value = txtroute.Text
        cmd.Parameters.Add("@Night_Hold", Data.SqlDbType.VarChar).Value = txtnighthold.Text

        If cmd.ExecuteNonQuery() Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Update Sucessfully');", True)
            reset1()
        Else
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fails", "alert('Update fail');", True)
            reset1()
        End If
        con.Close()
    End Sub
    Sub reset1()
        idDropDown.SelectedValue = ""
        txtday.Text = ""
        txtroute.Text = ""
        txtnighthold.Text = ""
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
        If Not Page.IsPostBack Then
            con.Open()
            Dim adap1 As New SqlCommand("select coalesce(max(Id),0) from schedule_mst", con)
            Dim a As Integer
            a = adap1.ExecuteScalar()
            a += 1
            ID = a
            txtid.Text = a

            Dim adp As New SqlDataAdapter("select * from package_detail", con)
            Dim dt As New Data.DataTable()
            adp.Fill(dt)
            If dt.Rows.Count > 0 Then
                idDropDown.DataSource = dt
                idDropDown.DataTextField = "id"
                idDropDown.DataValueField = "id"
                idDropDown.DataBind()
                idDropDown.Items.Insert(0, New ListItem("select Id", ""))

            End If

            Dim adp1 As New SqlDataAdapter("select id from schedule_mst", con)
            Dim dt1 As New Data.DataTable()
            adp1.Fill(dt1)
            If dt1.Rows.Count > 0 Then
                idDropDownList.DataSource = dt1
                idDropDownList.DataTextField = "id"
                idDropDownList.DataValueField = "id"
                idDropDownList.DataBind()
                idDropDownList.Items.Insert(0, New ListItem("select Id", ""))

            End If
            con.Close()
        End If
        
    End Sub

    Protected Sub idDropDownList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles idDropDownList.SelectedIndexChanged
        Dim adp1 As New SqlDataAdapter("select * from schedule_mst where id=" + idDropDownList.SelectedValue + "", con)
        Dim dt1 As New Data.DataTable()
        adp1.Fill(dt1)
        If dt1.Rows.Count > 0 Then
            txtday.Text = dt1.Rows(0)("day")
            txtroute.Text = dt1.Rows(0)("route")
            txtnighthold.Text = dt1.Rows(0)("Night_Hold")
            idDropDown.SelectedValue = dt1.Rows(0)("package_Id")

        End If
    End Sub
End Class
