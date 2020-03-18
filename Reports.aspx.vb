Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports iTextSharp.text
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text.pdf
Partial Class Reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.BindGrid()
        End If
    End Sub
    Private Sub BindGrid()
        Dim strConnString As String = ConfigurationManager.ConnectionStrings("Databs").ConnectionString
        Using con As New SqlConnection(strConnString)
            Using cmd As New SqlCommand("SELECT * FROM package_detail")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                    End Using
                End Using
            End Using
        End Using
    End Sub
    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        Me.BindGrid()
    End Sub

    Protected Sub ExportToPDF(sender As Object, e As EventArgs) Handles btnExport.Click
        Using sw As New StringWriter()
            Using hw As New HtmlTextWriter(sw)
                'To Export all pages
                GridView1.AllowPaging = False
                Me.BindGrid()

                GridView1.RenderControl(hw)
                Dim sr As New StringReader(sw.ToString())
                Dim pdfDoc As New Document(PageSize.A2, 10.0F, 10.0F, 10.0F, 0.0F)
                Dim htmlparser As New HTMLWorker(pdfDoc)
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream)
                pdfDoc.Open()
                htmlparser.Parse(sr)
                pdfDoc.Close()

                Response.ContentType = "application/pdf"
                Response.AddHeader("content-disposition", "attachment;filename=packages.pdf")
                Response.Cache.SetCacheability(HttpCacheability.NoCache)
                Response.Write(pdfDoc)
                Response.[End]()
            End Using
        End Using
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As System.Web.UI.Control)
        ' Do NOT call MyBase.VerifyRenderingInServerForm
    End Sub

    Private Sub btnExportExcel_Click(sender As Object, e As EventArgs) Handles btnExportExcel.Click

        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader("content-disposition", "attachment;filename=Packages.xls")
        Response.Cache.SetCacheability(HttpCacheability.NoCache)

        Dim swr As StringWriter = New StringWriter()
        Dim htmlwr As HtmlTextWriter = New HtmlTextWriter(swr)
        GridView1.AllowPaging = False
        Me.BindGrid()
        GridView1.RenderControl(htmlwr)
        Response.Output.Write(swr.ToString())
        Response.Flush()
        Response.End()
    End Sub
End Class
