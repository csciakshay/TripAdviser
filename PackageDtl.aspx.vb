Imports System.Data.SqlClient
Imports System.Data

Partial Class PackageDtl
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)

    Dim da As New SqlDataAdapter()

    Dim adsource As PagedDataSource

    Dim pos, pos1 As Integer
    Dim dt As New Data.DataTable()
    
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        con.Open()
        'Query to get ImagesName and Description from database
        Dim command As New SqlCommand("SELECT img from imgmst", con)
        Dim da As New SqlDataAdapter(command)
        Dim dt As New DataTable()
        da.Fill(dt)
        Dim files As New List(Of ListItem)()
        For Each row As DataRow In dt.Rows
            ' dt = row.Item("img")
            files.Add(New ListItem(row.Item("img"), row.Item("img").ToString.Substring(2)))
        Next row

        If Not IsPostBack Then
            Repeater1.DataSource = files
            Repeater1.DataBind()
        End If
    End Sub
    Protected Sub BindDataList()
        con.Open()
        'Query to get ImagesName and Description from database
        Dim command As New SqlCommand("SELECT img from imgmst", con)
        Dim da As New SqlDataAdapter(command)
        Dim dt As New DataTable()
        da.Fill(dt)
        'dlImages.DataSource = dt
        'dlImages.DataBind()
        con.Close()

    End Sub
End Class
