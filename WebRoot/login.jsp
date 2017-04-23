<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet" media="screen" />
<link href="css/thin-admin.css" rel="stylesheet" media="screen" />
<link href="css/font-awesome.css" rel="stylesheet" media="screen" />
<link href="style/style.css" rel="stylesheet" />
<link href="style/dashboard.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->

</head>
  </head>
  
  <body>
  <jsp:include page="headPage.jsp"/>
   <div class="page-content">
    <div class="content container">
      <div class="row">
        <div class="col-lg-12">
          <h2 class="page-title">Dashboard <small>Statistics and more</small></h2>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-6">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3>Today's Stats</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <h6 class="bigstats">A fully responsive premium quality admin template built on Twitter Bootstrap by <a target="_blank" href="http://www.riaxe.com">riaxe.com</a>.  These are some dummy lines to fill the area.</h6>
                <div class="cf" id="big_stats">
                  <div class="stat"> <i class="icon-anchor"></i> <span class="value">51</span> </div>
                  <!-- .stat -->
                  
                  <div class="stat"> <i class="icon-thumbs-up-alt"></i> <span class="value">41</span> </div>
                  <!-- .stat -->
                  
                  <div class="stat"> <i class="icon-twitter-sign"></i> <span class="value">91</span> </div>
                  <!-- .stat -->
                  
                  <div class="stat"> <i class="icon-bullhorn"></i> <span class="value">21</span> </div>
                  <!-- .stat --> 
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="widget">
            <div class="widget-header"> <i class="icon-bookmark"></i>
              <h3>Important Shortcuts</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="shortcuts"> <a class="shortcut" href="javascript:;"><i class="shortcut-icon icon-list-alt"></i><span class="shortcut-label">Apps</span> </a><a class="shortcut" href="javascript:;"><i class="shortcut-icon icon-bookmark"></i><span class="shortcut-label">Fav</span> </a><a class="shortcut" href="javascript:;"><i class="shortcut-icon icon-signal"></i> <span class="shortcut-label">Stats</span> </a><a class="shortcut" href="javascript:;"> <i class="shortcut-icon icon-comment"></i><span class="shortcut-label">Msg</span> </a><a class="shortcut" href="javascript:;"><i class="shortcut-icon icon-user"></i><span class="shortcut-label">Users</span> </a><a class="shortcut" href="javascript:;"><i class="shortcut-icon icon-file"></i><span class="shortcut-label">Notes</span> </a><a class="shortcut" href="javascript:;"><i class="shortcut-icon icon-picture"></i> <span class="shortcut-label">Photos</span> </a><a class="shortcut" href="javascript:;"> <i class="shortcut-icon icon-tag"></i><span class="shortcut-label">Tags</span> </a> </div>
              <!-- /shortcuts --> 
            </div>
            <!-- /widget-content --> 
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-6">
          <div class="widget">
            <div class="widget-header"> <i class="icon-file"></i>
              <h3>Content</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <ul class="messages_layout">
                <li class="from_user left"> <a class="avatar" href="#"><img src="images/message-avatar.jpg" /></a>
                  <div class="message_wrap"> <span class="arrow"></span>
                    <div class="info"> <a class="name">John Smith</a> <span class="time">1 hour ago</span>
                      <div class="options_arrow">
                        <div class="dropdown pull-right"> <a href="#" data-target="#" data-toggle="dropdown" role="button" id="dLabel" class="dropdown-toggle "> <i class=" icon-caret-down"></i> </a>
                          <ul aria-labelledby="dLabel" role="menu" class="dropdown-menu ">
                            <li><a href="#"><i class=" icon-share-alt icon-large"></i> Reply</a></li>
                            <li><a href="#"><i class=" icon-trash icon-large"></i> Delete</a></li>
                            <li><a href="#"><i class=" icon-share icon-large"></i> Share</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="text"> As an interesting side note, as a head without a body, I envy the dead. There's one way and only one way to determine if an animal is intelligent. Dissect its brain! Man, I'm sore all over. I feel like I just went ten rounds with mighty Thor. </div>
                  </div>
                </li>
                <li class="by_myself right"> <a class="avatar" href="#"><img src="images/message-avatar.jpg" /></a>
                  <div class="message_wrap"> <span class="arrow"></span>
                    <div class="info"> <a class="name">Bender (myself) </a> <span class="time">4 hours ago</span>
                      <div class="options_arrow">
                        <div class="dropdown pull-right"> <a href="#" data-target="#" data-toggle="dropdown" role="button" id="dLabel" class="dropdown-toggle "> <i class=" icon-caret-down"></i> </a>
                          <ul aria-labelledby="dLabel" role="menu" class="dropdown-menu ">
                            <li><a href="#"><i class=" icon-share-alt icon-large"></i> Reply</a></li>
                            <li><a href="#"><i class=" icon-trash icon-large"></i> Delete</a></li>
                            <li><a href="#"><i class=" icon-share icon-large"></i> Share</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="text"> All I want is to be a monkey of moderate intelligence who wears a suit that's why I'm transferring to business school! I had more, but you go ahead. Man, I'm sore all over. I feel like I just went ten rounds with mighty Thor. File not found. </div>
                  </div>
                </li>
                <li class="from_user left"> <a class="avatar" href="#"><img src="images/message-avatar.jpg" /></a>
                  <div class="message_wrap"> <span class="arrow"></span>
                    <div class="info"> <a class="name">Celeste Holm </a> <span class="time">1 Day ago</span>
                      <div class="options_arrow">
                        <div class="dropdown pull-right"> <a href="#" data-target="#" data-toggle="dropdown" role="button" id="dLabel" class="dropdown-toggle "> <i class=" icon-caret-down"></i> </a>
                          <ul aria-labelledby="dLabel" role="menu" class="dropdown-menu ">
                            <li><a href="#"><i class=" icon-share-alt icon-large"></i> Reply</a></li>
                            <li><a href="#"><i class=" icon-trash icon-large"></i> Delete</a></li>
                            <li><a href="#"><i class=" icon-share icon-large"></i> Share</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="text"> And I'd do it again! And perhaps a third time! But that would be it. Are you crazy? I can't swallow that. And I'm his friend Jesus. No, I'm Santa Claus! And from now on you're all named Bender Jr. </div>
                  </div>
                </li>
              </ul>
            </div>
            <!-- /widget-content --> 
          </div>
        </div>
        <div class="col-lg-6">
          <div class="widget widget-table action-table">
            <div class="widget-header"> <i class="icon-th-list"></i>
              <h3>A Table Example</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                    <th> Free Resource </th>
                    <th> Download</th>
                    <th class="td-actions"> </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td> abc </td>
                    <td>123 </td>
                    <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                  <tr>
                    <td>abc </td>
                    <td>123 </td>
                    <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                  <tr>
                    <td> abc </td>
                    <td> 123</td>
                    <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                  <tr>
                    <td> abc</td>
                    <td>123 </td>
                    <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                  <tr>
                    <td> abc </td>
                    <td> 123 </td>
                    <td class="td-actions"><a class="btn btn-small btn-success" href="javascript:;"><i class="btn-icon-only icon-ok"> </i></a><a class="btn btn-danger btn-small" href="javascript:;"><i class="btn-icon-only icon-remove"> </i></a></td>
                  </tr>
                </tbody>
              </table>
              
            </div>
            <!-- /widget-content --> 
          </div>
        </div>
        <div class="col-lg-6">
          <div class="widget-container">
            <div class="padded"> <a href="#" class="pull-right"><i class="icon-map-marker"></i></a> <span class="h4">McLean, VA</span>
              <div class="text-center padder m-t"> <span class="h1"><i class="icon-cloud text-muted"></i> 68Â°</span> </div>
            </div>
            <div class="widget-footer lt">
              <div class="row">
                <div class="col-xs-4"> <small class="text-muted block">Humidity</small> <span>56 %</span> </div>
                <div class="col-xs-4"> <small class="text-muted block">Precip.</small> <span>0.00 in</span> </div>
                <div class="col-xs-4"> <small class="text-muted block">Winds</small> <span>7 mp</span> </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
  <jsp:include page="footerPage.jsp"/>
  </body>
</html>
