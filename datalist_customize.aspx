<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="datalist_customize.aspx.vb" Inherits="datalist_customize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            country:
            <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("country") %>' />
            <br />
            state:
            <asp:Label ID="stateLabel" runat="server" Text='<%# Eval("state") %>' />
            <br />
            city:
            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
            <br />
            places:
            <asp:Label ID="placesLabel" runat="server" Text='<%# Eval("places") %>' />
            <br />
            duration:
            <asp:Label ID="durationLabel" runat="server" Text='<%# Eval("duration") %>' />
            <br />
            discription:
            <asp:Label ID="discriptionLabel" runat="server" Text='<%# Eval("discription") %>' />
            <br />
            start_date:
            <asp:Label ID="start_dateLabel" runat="server" Text='<%# Eval("start_date") %>' />
            <br />
            end_date:
            <asp:Label ID="end_dateLabel" runat="server" Text='<%# Eval("end_date") %>' />
            <br />
            create_to:
            <asp:Label ID="create_toLabel" runat="server" Text='<%# Eval("create_to") %>' />
            <br />
            terms_condition:
            <asp:Label ID="terms_conditionLabel" runat="server" Text='<%# Eval("terms_condition") %>' />
            <br />
            budget:
            <asp:Label ID="budgetLabel" runat="server" Text='<%# Eval("budget") %>' />
            <br />
            food:
            <asp:Label ID="foodLabel" runat="server" Text='<%# Eval("food") %>' />
            <br />
            vehicle_type:
            <asp:Label ID="vehicle_typeLabel" runat="server" Text='<%# Eval("vehicle_type") %>' />
            <br />
            tour_type:
            <asp:Label ID="tour_typeLabel" runat="server" Text='<%# Eval("tour_type") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Databs %>" SelectCommand="SELECT * FROM [customize_package]"></asp:SqlDataSource>
</asp:Content>

