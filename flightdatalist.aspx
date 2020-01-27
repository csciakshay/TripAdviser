<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="flightdatalist.aspx.vb" Inherits="flightdatalist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
        <ItemTemplate>
            <!--Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />-->
            FlightNumber:
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("flightno")%>' />
            <br />
            FlightName:
            <asp:Label ID="flightnmLabel" runat="server" Text='<%# Eval("flightnm")%>' />
            <br />
            Source:
            <asp:Label ID="sourceLabel" runat="server" Text='<%# Eval("source") %>' />
            <br />
            Destination:
            <asp:Label ID="destinationLabel" runat="server" Text='<%# Eval("destination") %>' />
            <br />
            Arrival_Time:
            <asp:Label ID="arrival_timeLabel" runat="server" Text='<%# Eval("arrival_time")%>' />
            <br />
            Departure_Time:
            <asp:Label ID="departure_timeLabel" runat="server" Text='<%# Eval("departure_time")%>' />
            <br />
            Economy_Rate:
            <asp:Label ID="economy_rateLabel" runat="server" Text='<%# Eval("economy_rate")%>' />
            <br />
            Business_Rate:
            <asp:Label ID="business_rateLabel" runat="server" Text='<%# Eval("business_rate")%>' />
            <br />
            
            
<br />
        </ItemTemplate>
    </asp:DataList>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Databs %>" SelectCommand="SELECT * FROM [flightmst]"></asp:SqlDataSource>


</asp:Content>

