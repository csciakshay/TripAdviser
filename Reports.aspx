<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Reports.aspx.vb" Inherits="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="ftco-section contact-section ftco-degree-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1>City Registration</h1>
                </div>
                <div class="col-md-4"></div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnExport" runat="server" Text="Export To PDF" OnClick="ExportToPDF" />
                    <asp:Button ID="btnExportExcel" runat="server" Text="Excel" />
                </div>
                </div>
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-10">
                    <asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
                        RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
                        runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="tour_type" HeaderText="Tour Name" ItemStyle-Width="150px" />
                            <asp:BoundField DataField="City" HeaderText="City" ItemStyle-Width="100px" />
                            <asp:BoundField DataField="Country" HeaderText="Country" ItemStyle-Width="100px" />
                            <asp:BoundField DataField="state" HeaderText="State" ItemStyle-Width="100px" />
                            <asp:BoundField DataField="places" HeaderText="Places" ItemStyle-Width="100px" />
                            <asp:BoundField DataField="duration" HeaderText="Duration" ItemStyle-Width="100px" />
                            <asp:BoundField DataField="start_date" HeaderText="Start Date" ItemStyle-Width="100px" />
                            <asp:BoundField DataField="end_date" HeaderText="End Date" ItemStyle-Width="100px" />
                        </Columns>
                    </asp:GridView>
                </div>
                
                </div>
            </div>
        </section>
</asp:Content>

