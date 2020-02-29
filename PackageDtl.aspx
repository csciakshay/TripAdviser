<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="PackageDtl.aspx.vb" Inherits="PackageDtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <link rel="stylesheet" href="css/slider/bjqs.css">

    <!-- some pretty fonts for this demo page - not required for the slider -->
    <link href='http://fonts.googleapis.com/css?family=Source+Code+Pro|Open+Sans:300'
        rel='stylesheet' type='text/css'>

    <!-- demo.css contains additional styles used to set up this demo page - not required for the slider -->
    <link rel="stylesheet" href="css/slider/demo.css">

    <!-- load jQuery and the plugin -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/slider/bjqs-1.3.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="container">
       <!--  Outer wrapper for presentation only, this can be anything you like -->
    <div id="banner-fade">

        <!-- start Basic Jquery Slider -->
        <ul class="bjqs">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <li>
                        <img src='<%# DataBinder.Eval(Container.DataItem,"Value") %>' title='<%# (DataBinder.Eval(Container.DataItem, "Text").ToString())%>'
                            alt=""></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <!-- end Basic jQuery Slider -->

    </div>
    <!-- End outer wrapper -->

    <script class="secret-source" style="display: none;">
        jQuery(document).ready(function ($) {

            $('#banner-fade').bjqs({
                height: 420,
                width: 820,
                responsive: true
            });

        });
      </script>
        </div>
    <script src="js/slider/libs/jquery.secret-source.min.js"></script>
    <script>
        jQuery(function ($) {

            $('.secret-source').secretSource({
                includeTag: false
            });

        });
    </script>
    
</asp:Content>

