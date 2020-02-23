Imports System.Data.SqlClient
Partial Class customize_package
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ValidationSettings.UnobtrusiveValidationMode = UI.UnobtrusiveValidationMode.None
        If Not Session("uid") Is Nothing Then
            Dim adp As New SqlDataAdapter("select * from regipg where id=" & Session("uid") & "", con)
            Dim dt As New Data.DataTable()
            adp.Fill(dt)



            countrydropdown.SelectedValue = dt.Rows(0)("country").ToString
            'Me.countrydropdown_SelectedIndexChanged(sender, e)

            statedropdown.SelectedValue = dt.Rows(0)("State").ToString
            'statedropdown_SelectedIndexChanged(sender, e)
        Else
            Response.Redirect("loginpg.aspx", False)
        End If

        If Not Page.IsPostBack Then
            Try
                con.Open()
                Dim adap1 As New SqlCommand("select coalesce(max(Id),0) from customize_package", con)
                Dim a As Integer
                a = adap1.ExecuteScalar()
                a += 1
                ID = a
                txtid.Text = a
                Dim adp As New SqlDataAdapter("select * from countrymst", con)
                Dim dt As New Data.DataTable()
                adp.Fill(dt)
                If dt.Rows.Count > 0 Then
                    countrydropdown.DataSource = dt
                    countrydropdown.DataTextField = "Country"
                    countrydropdown.DataValueField = "id"
                    countrydropdown.DataBind()
                    countrydropdown.Items.Insert(0, New ListItem("Select Country", ""))


                End If
            Catch ex As Exception
                Response.Redirect("errorPage.aspx?errMsg=" + ex.Message)
            Finally
                con.Close()
            End Try
        End If

       
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        If Page.IsPostBack Then
            con.Open()
            Dim checkfood As String = ""
            Dim checkvehicle As String = ""
            For Each item As ListItem In foodCheckBox.Items
                If item.Selected Then
                    checkfood &= item.Value + ","
                End If
            Next

            For Each item As ListItem In vehicleCheckBox.Items
                If item.Selected Then
                    checkvehicle &= item.Value + ","
                End If
            Next

           
            Dim cmd As New SqlCommand("insert_customize_package", con)
            cmd.CommandType = Data.CommandType.StoredProcedure
            cmd.Parameters.Add("@country", Data.SqlDbType.VarChar).Value = countrydropdown.SelectedValue
            cmd.Parameters.Add("@state", Data.SqlDbType.VarChar).Value = statedropdown.SelectedValue
            cmd.Parameters.Add("@city", Data.SqlDbType.VarChar).Value = citydropdown.SelectedValue
            cmd.Parameters.Add("@places", Data.SqlDbType.VarChar).Value = txtplaces.Text
            cmd.Parameters.Add("@duration", Data.SqlDbType.Int).Value = txtduration.Text
            cmd.Parameters.Add("@discription", Data.SqlDbType.VarChar).Value = txtdiscription.Text
            cmd.Parameters.Add("@start_date", Data.SqlDbType.Date).Value = txtstart_date.Text
            cmd.Parameters.Add("@end_date", Data.SqlDbType.Date).Value = txtend_date.Text
            cmd.Parameters.Add("@create_to", Data.SqlDbType.VarChar).Value = Session("uname")
            cmd.Parameters.Add("@terms_condition", Data.SqlDbType.VarChar).Value = txtterms.Text
            cmd.Parameters.Add("@budget", Data.SqlDbType.VarChar).Value = txtbudget.Text
            cmd.Parameters.Add("@food", Data.SqlDbType.VarChar).Value = checkfood
            cmd.Parameters.Add("@vehicle_type", Data.SqlDbType.VarChar).Value = checkvehicle
            cmd.Parameters.Add("@tour_type", Data.SqlDbType.VarChar).Value = tourdropdown.SelectedValue

            If cmd.ExecuteNonQuery() Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Insert Sucessfully');", True)
                Reset()
            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fails", "alert('Insert fail');", True)
                Reset()
            End If
        End If
    End Sub
    Sub reset()
        countrydropdown.SelectedValue = ""
        statedropdown.SelectedValue = ""
        citydropdown.SelectedValue = ""
        txtplaces.Text = ""
        txtduration.Text = ""
        txtdiscription.Text = ""
        txtstart_date.Text = ""
        txtend_date.Text = ""
        txtterms.Text = ""
        txtbudget.Text = ""
        foodCheckBox.ClearSelection()
        vehicleCheckBox.ClearSelection()
        tourdropdown.SelectedValue = ""
    End Sub

    Protected Sub countrydropdown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles countrydropdown.SelectedIndexChanged
        Try

            con.Open()
            Dim adap As New SqlDataAdapter("select * from statemst where  Country=" & countrydropdown.SelectedValue & "", con)
            Dim ds As New Data.DataTable()
            adap.Fill(ds)
            statedropdown.DataSource = ds
            statedropdown.DataTextField = "state"
            statedropdown.DataValueField = "id"
            statedropdown.DataBind()
            statedropdown.Items.Insert(0, New ListItem("Select State", ""))
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message)
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub statedropdown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles statedropdown.SelectedIndexChanged
        Try
            con.Open()
            Dim adap As New SqlDataAdapter("select * from citymst where  State=" & statedropdown.SelectedValue & "", con)
            Dim ds As New Data.DataTable()
            adap.Fill(ds)
            citydropdown.DataSource = ds
            citydropdown.DataTextField = "city"
            citydropdown.DataValueField = "id"
            citydropdown.DataBind()
            citydropdown.Items.Insert(0, New ListItem("Select city", ""))
        Catch ex As Exception
            Response.Redirect("errorPage.aspx?errMsg=" + ex.Message)
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub citydropdown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles citydropdown.SelectedIndexChanged

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If Page.IsPostBack Then
            con.Open()
            Dim checkfood As String = ""
            Dim checkvehicle As String = ""
            For Each item As ListItem In foodCheckBox.Items
                If item.Selected Then
                    checkfood &= item.Value + ","
                End If
            Next

            For Each item As ListItem In vehicleCheckBox.Items
                If item.Selected Then
                    checkvehicle &= item.Value + ","
                End If
            Next
            con.Open()
            Dim cmd As New SqlCommand("update_pro_customize", con)
            cmd.CommandType = Data.CommandType.StoredProcedure
            cmd.Parameters.Add("@country", Data.SqlDbType.VarChar).Value = countrydropdown.SelectedValue
            cmd.Parameters.Add("@state", Data.SqlDbType.VarChar).Value = statedropdown.SelectedValue
            cmd.Parameters.Add("@city", Data.SqlDbType.VarChar).Value = citydropdown.SelectedValue
            cmd.Parameters.Add("@places", Data.SqlDbType.VarChar).Value = txtplaces.Text
            cmd.Parameters.Add("@duration", Data.SqlDbType.Int).Value = txtduration.Text
            cmd.Parameters.Add("@discription", Data.SqlDbType.VarChar).Value = txtdiscription.Text
            cmd.Parameters.Add("@start_date", Data.SqlDbType.Date).Value = txtstart_date.Text
            cmd.Parameters.Add("@end_date", Data.SqlDbType.Date).Value = txtend_date.Text
            cmd.Parameters.Add("@create_to", Data.SqlDbType.VarChar).Value = Session("uname")
            cmd.Parameters.Add("@terms_condition", Data.SqlDbType.VarChar).Value = txtterms.Text
            cmd.Parameters.Add("@budget", Data.SqlDbType.VarChar).Value = txtbudget.Text
            cmd.Parameters.Add("@food", Data.SqlDbType.VarChar).Value = checkfood
            cmd.Parameters.Add("@vehicle_type", Data.SqlDbType.VarChar).Value = checkvehicle
            cmd.Parameters.Add("@tour_type", Data.SqlDbType.VarChar).Value = tourdropdown.SelectedValue

            If cmd.ExecuteNonQuery() Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Success", "alert('Update Sucessfully');", True)
                reset()
            Else
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Fails", "alert('Update fail');", True)
                reset()
            End If
        End If

    End Sub
    Sub reset2()
        countrydropdown.SelectedValue = ""
        statedropdown.SelectedValue = ""
        citydropdown.SelectedValue = ""
        txtplaces.Text = ""
        txtduration.Text = ""
        txtdiscription.Text = ""
        txtstart_date.Text = ""
        txtend_date.Text = ""
        txtterms.Text = ""
        txtbudget.Text = ""
        foodCheckBox.ClearSelection()
        vehicleCheckBox.ClearSelection()
        tourdropdown.SelectedValue = ""
    End Sub

    Protected Sub txtend_date_TextChanged(sender As Object, e As EventArgs) Handles txtend_date.TextChanged
       

    End Sub
End Class
