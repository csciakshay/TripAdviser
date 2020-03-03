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
    <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
    <script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php"
        type="text/javascript"></script>
    <meta property="og:url" content="http://www.pgfinder.com/PGFinder/PropertyDtl.aspx?ID=6" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="PG Finder" />
    <meta property="og:description" content="Find your batter PG!" />
    <meta property="og:image" content="~/upload/noimage.png" />
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
    <div id="container2">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <asp:Label ID="Label1" runat="server" Text="Package Type"></asp:Label>
            </div>
            <div class="col-md-7">
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <asp:Label ID="Label3" runat="server" Text="Package Type"></asp:Label>
            </div>
            <div class="col-md-7">
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <asp:Label ID="Label5" runat="server" Text="Package Type"></asp:Label>
            </div>
            <div class="col-md-7">
                <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <asp:Label ID="Label7" runat="server" Text="Package Type"></asp:Label>
            </div>
            <div class="col-md-7">
                <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <asp:Label ID="Label9" runat="server" Text="Package Type"></asp:Label>
            </div>
            <div class="col-md-7">
                <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <asp:Label ID="Label11" runat="server" Text="Package Type"></asp:Label>
            </div>
            <div class="col-md-7">
                <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-2"></div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

            
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-10">
            <div style="color: black">

                <asp:DataList ID="EmpDataList" runat="server">
                    <HeaderTemplate>
                        <table width="140%">
                            <tr>
                                <td width="10%">Id</td>

                                <td width="35%">Name</td>

                                <td width="25%">City</td>
                                <td width="30%">Address</td>

                            </tr>


                        </table>

                    </HeaderTemplate>
                    <ItemTemplate>
                        <table width="140%">

                            <tr>

                                <td width="10%">
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("id")%>' />


                                </td>
                                <td width="35%">

                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("Country")%>' />

                                </td>
                                <td width="25%">


                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("City")%>' />
                                </td>
                                <td width="30%">

                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("City")%>' />
                                </td>


                            </tr>

                        </table>

                    </ItemTemplate>


                </asp:DataList>
                <table id="Paging" runat="server">
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" Font-Bold="true" Text="First"
                                OnClick="Button1_Click" class="btn btn-info" /></td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Font-Bold="true" Text="Previous" OnClick="Button2_Click" class="btn btn-info" />
                        </td>
                        <td>
                            <asp:Button ID="Button3" runat="server" Font-Bold="true" Text="Next" OnClick="Button3_Click"
                                class="btn btn-info" />
                        </td>
                        <td>
                            <asp:Button ID="Button4" runat="server" Font-Bold="true" Text="Last" OnClick="Button4_Click"
                                class="btn btn-info" />
                        </td>
                    </tr>
                </table>
                </div>
                

            </div>
            <div class="col-md-2"></div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <div id="fb-root"></div>
                <asp:Label ID="Label13" runat="server" Text="Share to others: " Font-Bold="true"></asp:Label>
                <script  type="text/javascript">
                    var pid = window.location.search;
                    pid = pid.replace("?", '');
                    alert(pid);
                    $(".twitter-share-button").attr("data-url", "http://www.pgfinder.com/PGFinder/PropertyDtl.aspx?"+pid+"");
                    $(".fb-share-button").attr("data-href", "http://www.pgfinder.com/PGFinder/PropertyDtl.aspx?"+pid+"");
                </script>
                <script>  
                    (function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
                        fjs.parentNode.insertBefore(js, fjs);
                    } (document, 'script', 'facebook-jssdk'));
                              
                              
                </script>
                <!-- Your share button code -->
                <div class="fb-share-button"
                    data-href="http://www.pgfinder.com/PGFinder/PropertyDtl.aspx?ID=6"
                    data-layout="button_count">
                </div>
                <%--Twitter share--%>
                <a href="https://twitter.com/share" class="twitter-share-button" data-text="Best sutable PG option for you is: "
                    data-size="large" data-count="none">Tweet</a>
                <script>    !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "//platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script>
                <script>
                    window.onload = function () {
                        twttr.events.bind('tweet', function (event) {
                            alert("Thanks for sharing on twitter");
                        });
                        twttr.events.bind('click', function (event) {
                            alert("You are going to share in twitter");
                        });
                    }
                </script>
                <%--Linked In Share--%>
                <script src="//platform.linkedin.com/in.js" type="text/javascript"></script>
                <script type="IN/Share" data-onsuccess="lnksuccess" data-onerror="error" data-url="http://www.pgfinder.com/PGFinder/PropertyDtl.aspx"></script>
                <script>
                    function lnksuccess(url) {
                        alert("url = " + url + "  shared successfully");
                    }
                    function lnkerror(url) {
                        alert("something goes wrong in url sharing");
                    }
                </script>
            </div>
            <div class="col-md-2"></div>
        </div>
        </div>
</asp:Content>

