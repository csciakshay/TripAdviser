Imports System.Data.SqlClient
Imports System.Data

Partial Class PackageDtl
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("Databs").ConnectionString)

    Dim da As New SqlDataAdapter()

    Dim adsource As PagedDataSource

    Dim pos, pos1 As Integer
    Dim dt As New Data.DataTable()
    Dim CurrentPage As Integer
    
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
        con.Close()

        If Not IsPostBack Then
            Repeater1.DataSource = files
            Repeater1.DataBind()
            BindDataList()
            ViewState("PageCount") = 0
        End If
    End Sub
    Protected Sub BindDataList()
        con.Open()
        'Query to get ImagesName and Description from database
        Dim command As New SqlCommand("SELECT * from package_detail", con)
        Dim da As New SqlDataAdapter(command)
        Dim dt As New DataTable()
        da.Fill(dt)
        DataListPaging(dt)
        'dlImages.DataSource = dt
        'dlImages.DataBind()
        con.Close()

    End Sub
    Private Sub DataListPaging(dt As DataTable)

        'creating object of PagedDataSource;  


        Dim PD As PagedDataSource = New PagedDataSource()

        PD.DataSource = dt.DefaultView
        PD.PageSize = 5
        PD.AllowPaging = True
        PD.CurrentPageIndex = CurrentPage
        Button1.Enabled = Not PD.IsFirstPage
        Button2.Enabled = Not PD.IsFirstPage
        Button4.Enabled = Not PD.IsLastPage
        Button3.Enabled = Not PD.IsLastPage
        ViewState("TotalCount") = PD.PageCount
        EmpDataList.DataSource = PD
        EmpDataList.DataBind()
        ViewState("PagedDataSurce") = dt
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim dt As Data.DataTable
        CurrentPage = 0
        dt = ViewState("PagedDataSurce")
        ' DataListPaging(dt)
        EmpDataList.DataSource = dt
        EmpDataList.DataBind()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Dim dt As Data.DataTable
        CurrentPage = Integer.Parse(ViewState("PageCount"))
        CurrentPage -= 1
        ViewState("PageCount") = CurrentPage
        dt = ViewState("PagedDataSurce")
        DataListPaging(dt)

    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs)
        Dim dt As Data.DataTable
        CurrentPage = Integer.Parse(ViewState("PageCount"))
        CurrentPage += 1
        ViewState("PageCount") = CurrentPage
        dt = ViewState("PagedDataSurce")
        DataListPaging(dt)
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs)
        Dim dt As Data.DataTable
        CurrentPage = Integer.Parse(ViewState("TotalCount")) - 1
        dt = ViewState("PagedDataSurce")
        DataListPaging(dt)
    End Sub
End Class
