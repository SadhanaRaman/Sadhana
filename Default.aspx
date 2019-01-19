<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Portfolio_Sadhana.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=false;">
    <meta name="author" content="Sadhana Kalyana Raman">
    <meta name="keywords" content="profile, fun, IT, Technology, Sadhana, Raman, Kalyanaraman, Kalyana Raman, website, resume">
    <meta name ="description" content="My journey with technology!" />
     <meta name="theme-color" content="#317EFB"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="http://twitter.github.io/bootstrap/assets/js/bootstrap-transition.js"></script>
    <script type="text/javascript" src="http://twitter.github.io/bootstrap/assets/js/bootstrap-collapse.js"></script>
     <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <%-- <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>   --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <title>Sadhana</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Crimson+Text" rel="stylesheet">

    <script type="text/javascript">
        $(document).ready(function () {
$( "#navbutton" ).click(function( event ) {
     $("#navbutton").on('dblclick', function (event) {  

       event.preventDefault();

 });
});
            $.noConflict();
            function Func() {
                var sEmail = document.getElementById('TxtEmail').value;
                var sName = document.getElementById('TxtName').value;
                //var data ="{'emailTo':" + sEmail + '}";
                var sComm = document.getElementById('TxtComments').value;
                var reEmail = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/;
                if (sName == "" || sComm == "" || sEmail == "") {
$('#myModalEmpty').modal({
  keyboard: false
})

                    //alert("empty");
                }
                else {
                    if (!sEmail.match(reEmail)) {
$('#myModalInvalid').modal({
  keyboard: false
})
                        //alert("invalid");
                        return false;
                    }
                    else {

                        $.ajax({
                            url: 'Default.aspx/SendEmail',
                            method: 'post',
                            contentType: "application/json; charset=utf-8",
                            data: '{emailTo:"' + sEmail + '", Name:"' + sName + '"}',//'{"emailTo": ' + sEmail + '}',//"{'emailTo':'sadhu4590@gmail.com'}", //"{" + 'emailTo:' + sEmail + "}"
                            dataType: 'json'
                            //,
                            //success: function () {
                            //     alert('success');
                            //},
                            //error: function (data) {
                            //    alert(data);
                            //}

                        })

                        $.ajax({
                            url: 'Default.aspx/SendFeedback',
                            method: 'post',
                            contentType: "application/json; charset=utf-8",
                            data: '{emailFrom:"' + sEmail + '", comments:"' + sComm + '", name:"' + sName + '"}',//'{"emailTo": ' + sEmail + '}',//"{'emailTo':'sadhu4590@gmail.com'}", //"{" + 'emailTo:' + sEmail + "}"
                            dataType: 'json'
                            //    ,
                            //success: function () {
                            //     alert('success');
                            ////},
                            //error: function (data) {
                            //    alert(data);
                            //}

                        })
$('#myModalValid').modal({
  keyboard: false
})
                        //alert("sent");
                    }

                }
                return true;

            }

            document.getElementById("sub").onclick = function fun() {

                Func();
                //validation code to see State field is mandatory.  
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button id="navbutton" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#theNav"
                        aria-expanded="false">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Default.aspx#Feedback">Contact Me</a>
                </div>

                <div class="collapse navbar-collapse" id="theNav">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="Default.aspx">About</a></li>
                        <li><a href="Skill.html">Skillset</a></li>
                        <li><a href="about.html">The Site FAQ</a></li>
                        <li><a href="more.html">More</a></li>
                        <%--                        <li><a href="videos.html" class="dropdown-toggle" data-toggle="dropdown" role="button"
                            aria-haspopup="true" aria-expanded="false">More<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="videos.html#2017">2017</a></li>
                                <li><a href="videos.html#2016">2016</a></li>
                            </ul>
                        </li>--%>
                    </ul>
                </div>

            </div>
        </div>
        <div class="container">
<div class="modal fade" id="myModalEmpty" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Empty Content</h4>
        </div>
        <div class="modal-body">
          <p>Opps looks like you've not typed in the details. Have another look? </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
</div>
<div class="modal fade" id="myModalInvalid" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Invalid Email</h4>
        </div>
        <div class="modal-body">
          <p>Oops, looks like that's not a valid email. Have another look?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
</div>
<div class="modal fade" id="myModalValid" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Thank you</h4>
        </div>
        <div class="modal-body">
          <p>Thanks for your time. Hopefully it was fun. Your comments mean a ton to me. I'll get in touch shortly. Cya!</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
</div>
            <div id="dialogyes" title="Success" visibility: hidden>
                <p>Thanks for your time. Hopefully it was fun. Your comments mean a ton to me. I'll get in touch shortly. Cya!</p>
            </div>
            <div id="dialogno" title="Invalid Email" visibility: hidden>
                <p>Oops, looks like that's not a valid email. Have another look?</p>
            </div>
            <div id="dialogempty" title="No data" visibility: hidden>
                <p>Opps looks like you've not typed in the details. Have another look? </p>
            </div>

            <div class="jumbotron text-center">
                </br>
                </br>
                <div class="quote strokeme">Sadhana Kalyana Raman</div>
                </br>
                <h2>Fullstack .Net developer</h2>
                                             </br>
                            <span style="font-size: 3em;">
                           <a href="https://www.linkedin.com/in/sadhana-kalyanaraman-91a55a61/" target="_blank">  <i class="fab fa-linkedin"></i></a>
                            <a href="https://www.linkedin.com/in/sadhana-kalyanaraman-91a55a61/" target="_blank"><i class="fab fa-facebook-square"></i></a>
                            </span>
                            </br>
            </div>


            <div class="desc">
                <h1 class="text-center">Hey there!</h1>
                </br>

                                                <div class="rows">
                                                    <div class="col-xs-12">

                                                        <img class="img img-responsive img-circle" src="Sadhana.jpg" alt="Sadhu">
                                                    </div>
                                                </div>



                </br>
                 </br>
                <p>
                   
                    Firstly, thanks for visiting and welcome. :) 

                </p>
                </br>
                                        <p>
                                            I'm Sadhana, a .Net Developer with around six years experience in application development and design, currently working in Sydney.
                                            After completeing my B-Tech, Computer Science in India, I began working with Cognizant, a globally located IT service provider for four and half years before applying for my Skilled Independant Visa. 
                                            Once I was successful in getting my PR I moved to Sydney in 2017, and have since been working as a Developer with Greenstone Financial Services.
                                        </p>
                <p>
                    I designed this website as a passion project and as a place to document my journey in technology. In saying that, it is not meant to serve as or substitute a resume.
                 This site would evolve as I continue to update it, however do go ahead and have a look around. Hopefully you will find something interesting :)
                </p>

                </br>
            </div>

            <div id="Feedback" class="font">
                <p><em class="text">Take a moment to tell me what you think, is there anything you see that can be improved? Or is there anything I can help with in your own website/project? </em></p>
                <p><em class="text">Let me know.</em></p>
                </br>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="up1" runat="server">
                    <ContentTemplate>
                        <label id="Name" class="Label" for="TxtName">Name:</label>
                        <asp:TextBox ID="TxtName" Rows="1" Columns="25" TextMode="multiline" runat="server" />
                        </br>
                             <label id="Email" class="Label" for="TxtEmail">Email:</label>
                        <asp:TextBox ID="TxtEmail" Rows="1" Columns="25" TextMode="multiline" runat="server" />
                        </br>
                                 <label id="Comments" class="Label" for="TxtComments">Comments:</label>
                        <asp:TextBox ID="TxtComments" Rows="3" Columns="25" TextMode="multiline" runat="server" />
                        </br>
                            <%--<label id="Comments" class="Label" for="TxtComments">Comments:</label>
                                <asp:TextBox ID="TxtComments" Rows="3" Columns="25" TextMode="multiline" runat="server" />
                                </br>--%>
                            
                            </br>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <button type="button" id="sub" class="Submit">Let's roll</button>
                </br> 
                    </br>
            </div>

            <div id="map"></div>
            <script>
                // Initialize and add the map
                function initMap() {
                    // The location of sadhu
                    var sadhu = { lat: -33.8688, lng: 151.2093 };
                    // The map, centered at sadhu
                    var map = new google.maps.Map(
                        document.getElementById('map'), { zoom: 16, center: sadhu, scrollwheel: false });
                    // The marker, positioned at sadhu
                    var marker = new google.maps.Marker({ position: sadhu, map: map });
                }
            </script>
            <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfvwvIYvP0HF-6vVRsfY-29ngTZ_E7kaM&callback=initMap">
            </script>
            </br>

            <div class="madeby visible-lg">
                <em>© Sadhana Kalyana Raman</em>
            </div>
            <div class="madebys hidden-lg">
                <em>© Sadhana Kalyana Raman</em>
            </div>
            </br>
        </div>


    </form>

</body>
</html>
