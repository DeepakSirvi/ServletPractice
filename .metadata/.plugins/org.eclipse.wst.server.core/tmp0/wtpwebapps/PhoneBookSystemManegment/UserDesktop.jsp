<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.dollop.app.bean.User" %>
    <%@ page import="com.dollop.app.bean.GroupDivision" %>
     <%@ page import="java.util.ArrayList" %>
     
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">

    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>                                     
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <!-- modal -->
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  </head>
  <style>
    .modal-content {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 100%;
    pointer-events: auto;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.2);
    border-radius: 0.3rem;
    outline: 0;
    margin-top: 7rem;
}
    .card-text{
      display: flex;
      justify-content: space-between;
    }
    .mdi-24px.mdi:before {
    font-size: 35px;
}
  /* password change */
  .mainDiv {
    display: flex;
    min-height: 100%;
    align-itemss: center;
    justify-content: center;
    background-color: #f9f9f9;
    font-family: 'Open Sans', sans-serif;
  }
 .cardStyle {
  width: 381px;
    border-color: white;
    /* background: #fff; */
    /* padding: 36px 0; */
    border-radius: 4px;
    margin: 30px 0;
    box-shadow: 0px 0 2px 0 rgba(0,0,0,0.25);
  }
#signupLogo {
  max-height: 100px;
  margin: auto;
  display: flex;
  flex-direction: column;
}
.formTitle{
  font-weight: 600;
  margin-top: 20px;
  color: #2F2D3B;
  text-align: center;
}
.inputLabel {
  font-size: 12px;
  color: #555;
  margin-bottom: 6px;
  margin-top: 24px;
}
  .inputDiv {
    width: 70%;
    display: flex;
    flex-direction: column;
    margin: auto;
  }
input {
  height: 40px;
  font-size: 16px;
  border-radius: 4px;
  border: none;
  border: solid 1px #ccc;
  padding: 0 11px;
}
input:disabled {
  cursor: not-allowed;
  border: solid 1px #eee;
}
.buttonWrapper {
  margin-top: 40px;
}
  .submitButton {
    width: 70%;
    height: 40px;
    margin: auto;
    display: block;
    color: #fff;
    background-color: #065492;
    border-color: #065492;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
    box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
  }
.submitButton:disabled,
button[disabled] {
  border: 1px solid #cccccc;
  background-color: #cccccc;
  color: #666666;
}

#loader {
  position: absolute;
  z-index: 1;
  margin: -2px 0 0 10px;
  border: 4px solid #f3f3f3;
  border-radius: 50%;
  border-top: 4px solid #666666;
  width: 14px;
  height: 14px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
.inputLabel{
  text-align: initial;
}
.navbar .navbar-menu-wrapper .search-field .input-group input {
    font-size: 1.5rem;
    padding: 0.5rem;
}
  </style>
  <body>
    <%User user=(User)request.getAttribute("user");%>
     <%ArrayList<GroupDivision> glist=(ArrayList<GroupDivision>)request.getAttribute("glist"); %> 
    <div class="container-scroller">
      <div class="row p-0 m-0 proBanner" id="proBanner">
        <div class="col-md-12 p-0 m-0">
          <div class="card-body card-body-padding d-flex align-items-center justify-content-between">
            <div class="ps-lg-1">
              <div class="d-flex align-items-center justify-content-between">
                <p class="mb-0 font-weight-medium me-3 buy-now-text">Free 24/7 customer support, updates, and more with this template!</p>
                <a href="https://www.bootstrapdash.com/product/purple-bootstrap-admin-template/?utm_source=organic&utm_medium=banner&utm_campaign=buynow_demo" target="_blank" class="btn me-2 buy-now-btn border-0">Get Pro</a>
              </div>
            </div>
            <div class="d-flex align-items-center justify-content-between">
              <a href="https://www.bootstrapdash.com/product/purple-bootstrap-admin-template/"><i class="mdi mdi-home me-3 text-white"></i></a>
              <button id="bannerClose" class="btn border-0 p-0">
                <i class="mdi mdi-close text-white me-0"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="./PhoneBookController?Action=DASHBOARD"><img src="assets/images/logo2.png" alt="logo" aspect-ratio=167/419 style="height:66px;width:172px;"></a>
          <a class="navbar-brand brand-logo-mini" href="./PhoneBookController?Action=DASHBOARD"><img src="assets/images/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="search-field d-none d-md-block">
            <form class="d-flex align-items-center h-100" action="#">
              <div class="input-group">
                <div class="input-group-prepend bg-transparent">
                  <i class="input-group-text border-0 mdi mdi-magnify"></i>
                </div>
                <input type="text" class="form-control bg-transparent border-0" placeholder="Search projects">
              </div>
            </form>
          </div>
          <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-img">
                  <img src="assets/images/faces/face1.jpg" alt="image">
                  <span class="availability-status online"></span>
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black"><%=user.getuName()%></p>
                </div>
              </a>
              <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                <a class="dropdown-item" href="PhoneBookController?Action=GETUSER" style="color: #2F2D3B;">
                  <i class="fa fa-user-circle-o me-2" style="color:rgb(88, 124, 241)"></i>Profile</a>
                  <a class="dropdown-item"  href="#myModal2" data-toggle="modal" style="color: #2F2D3B;" >
                    <i class="fa fa-lock me-2" style="color:rgb(96, 129, 236)"></i> Password Change</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="PhoneBookController?Action=LOGOUT" style="color: #2F2D3B;">
                  <i class="mdi mdi-logout me-2" style="color:rgb(96, 129, 236)"></i> Logout </a>
                  <a class="dropdown-item" href="PhoneBookController?Action=DELETEACCOUNT" style="color: #2F2D3B;" onclick="return confirm('Are You Sure?')" >
                  <i class="mdi mdi-logout me-2" style="color:rgb(96, 129, 236)"></i> DELETE </a>
              </div>
            </li>
          
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
         
            <li class="nav-item">
              
             
                <a class="nav-link" href="./PhoneBookController?Action=DASHBOARD"> 
                <span class="menu-title"><i class="fa fa-dashboard" style="font-size:20px;"></i>&nbsp;Dashboard</span>
              
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="menu-title"> <i class="fa fa-tablet" style="font-size:20px"></i>&nbsp;Contact Registration</span>
                <i class="menu-arrow"></i>
              
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="./PhoneBookController?Action=TOCREATECONTACT">Create Contact</a></li>
                  <li class="nav-item"> <a class="nav-link" href="./PhoneBookController?Action=TOVIEWCONTACT">View Contact</a></li>
                </ul>
              </div>
            </li>
             <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic1">
                <span class="menu-title">  <i class="	fa fa-line-chart" style="font-size:20px"></i>&nbsp; My Group</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="ui-basic1">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="./PhoneBookController?Action=CREATEGROUP">Create Group</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic1">
                <span class="menu-title">  <i class="	fa fa-line-chart" style="font-size:20px"></i>&nbsp;Group</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="ui-basic1">
                <ul class="nav flex-column sub-menu">
                    <%for(GroupDivision group:glist)
                  { 
                  %>
                  <li class="nav-item"> <a class="nav-link" href="./PhoneBookController?Action=GETGROUP&gid=<%=group.getgId() %>" ><%=group.getgName() %></a>
                 
                  </li>
                                      
                    <% 
                    }
                   %>            
                </ul>
              </div>
            </li>
            <% if(user.getuRole().equals("Admin")){
            %>
             <li class="nav-item">
                <span class="menu-title"> <i class="fa fa-edit" style="font-size:20px"></i>&nbsp;Total User     :- <%=request.getAttribute("count") %></span>
              </a>
               </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic2">
                <span class="menu-title"><i class="fa fa-th-large" style="font-size:20px"></i>&nbsp;Users</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="ui-basic2">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="./PhoneBookController?Action=VIEWUSER">view User</a></li>
                </ul>
              </div>
            </li>
          <% } %>
         
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
                            <% if(request.getAttribute("message")!=null) {
                  %>
                      <p style="color:red;font-size: 20px;"><%=request.getAttribute("message") %></p>
                  <%
                  } 
                  %>
        
            <div class="page-header">
              <h3 class="page-title">
                <span class="page-title-icon bg-gradient-primary text-white me-2">
                  <i class="mdi mdi-home"></i>
                </span> Dashboard
              </h3>
              <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">
                    <span></span>Overview <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                  </li>
                </ul>
              </nav>
            </div>
            <div class="row">
              <div class="col-md-3 stretch-card grid-margin">
                <div class="card bg-gradient-danger card-img-holder text-white" style="border-radius: 10px;">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">No. of Plans Available
                    </h4>
                    <h2 class="mb">23</h2>
                    <h6 class="card-text"> Jan-Oct 2021 <i class="fa fa-shopping-cart" style="color:rgb(238, 234, 234);float: right;font-size:40px;"></i></h6>
                  </div>
                </div>
              </div>
              <div class="col-md-3 stretch-card grid-margin">
                <div class="card bg-gradient-info card-img-holder text-white" style="border-radius: 10px;">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Citizens Approved
                    </h4>
                    <h2 class="mb">8577641</h2>
                    <h6 class="card-text">Jan-Oct 2021  <i class="	far fa-money-bill-alt" style="color:rgb(238, 234, 234);float: right;font-size:40px;"></i></h6>
                  </div>
                </div>
              </div>
              <div class="col-md-3 stretch-card grid-margin">
                <div class="card bg-gradient-success card-img-holder text-white" style="border-radius: 10px;">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Citizens Denied
                    </h4>
                    <h2 class="mb">4565</h2>
                    <h6 class="card-text">Jan-Oct 2021 <i class="fa fa-users" style="color:rgb(238, 234, 234);float: right;font-size:40px;"></i></h6>
                  </div>
                </div>
              </div>
              <div class="col-md-3 stretch-card grid-margin">
                <div class="card bg-gradient-success card-img-holder text-white" style="border-radius: 10px;">
                  <div class="card-body">
                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                    <h4 class="font-weight-normal mb-3">Families Benefited 
                    </h4>
                    <h2 class="mb">5676</h2>
                    <h6 class="card-text">Jan-Oct 2021<i class="fa fa-heart" style="color:rgb(238, 234, 234);float: right;font-size:40px;"></i></h6>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-7 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="clearfix">
                      <h4 class="card-title float-left">Visit And Sales Statistics</h4>
                      <div id="visit-sale-chart-legend" class="rounded-legend legend-horizontal legend-top-right float-right"></div>
                    </div>
                    <canvas id="visit-sale-chart" class="mt-4"></canvas>
                  </div>
                </div>
              </div>
              <div class="col-md-5 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Traffic Sources</h4>
                    <canvas id="traffic-chart"></canvas>
                    <div id="traffic-chart-legend" class="rounded-legend legend-vertical legend-bottom-left pt-4"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Recent Tickets</h4>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th> Assignee </th>
                            <th> Subject </th>
                            <th> Status </th>
                            <th> Last Update </th>
                            <th> Tracking ID </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>
                              <img src="assets/images/faces/face1.jpg" class="me-2" alt="image"> David Grey
                            </td>
                            <td> Fund is not recieved </td>
                            <td>
                              <label class="badge badge-gradient-success">DONE</label>
                            </td>
                            <td> Dec 5, 2017 </td>
                            <td> WD-12345 </td>
                          </tr>
                          <tr>
                            <td>
                              <img src="assets/images/faces/face2.jpg" class="me-2" alt="image"> Stella Johnson
                            </td>
                            <td> High loading time </td>
                            <td>
                              <label class="badge badge-gradient-warning">PROGRESS</label>
                            </td>
                            <td> Dec 12, 2017 </td>
                            <td> WD-12346 </td>
                          </tr>
                          <tr>
                            <td>
                              <img src="assets/images/faces/face3.jpg" class="me-2" alt="image"> Marina Michel
                            </td>
                            <td> Website down for one week </td>
                            <td>
                              <label class="badge badge-gradient-info">ON HOLD</label>
                            </td>
                            <td> Dec 16, 2017 </td>
                            <td> WD-12347 </td>
                          </tr>
                          <tr>
                            <td>
                              <img src="assets/images/faces/face4.jpg" class="me-2" alt="image"> John Doe
                            </td>
                            <td> Loosing control on server </td>
                            <td>
                              <label class="badge badge-gradient-danger">REJECTED</label>
                            </td>
                            <td> Dec 3, 2017 </td>
                            <td> WD-12348 </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Recent Updates</h4>
                    <div class="d-flex">
                      <div class="d-flex align-items-center me-4 text-muted font-weight-light">
                        <i class="mdi mdi-account-outline icon-sm me-2"></i>
                        <span>jack Menqu</span>
                      </div>
                      <div class="d-flex align-items-center text-muted font-weight-light">
                        <i class="mdi mdi-clock icon-sm me-2"></i>
                        <span>October 3rd, 2018</span>
                      </div>
                    </div>
                    <div class="row mt-3">
                      <div class="col-6 pe-1">
                        <img src="assets/images/dashboard/img_1.jpg" class="mb-2 mw-100 w-100 rounded" alt="image">
                        <img src="assets/images/dashboard/img_4.jpg" class="mw-100 w-100 rounded" alt="image">
                      </div>
                      <div class="col-6 ps-1">
                        <img src="assets/images/dashboard/img_2.jpg" class="mb-2 mw-100 w-100 rounded" alt="image">
                        <img src="assets/images/dashboard/img_3.jpg" class="mw-100 w-100 rounded" alt="image">
                      </div>
                    </div>
                    <div class="d-flex mt-5 align-items-top">
                      <img src="assets/images/faces/face3.jpg" class="img-sm rounded-circle me-3" alt="image">
                      <div class="mb-0 flex-grow">
                        <h5 class="me-2 mb-2">School Website - Authentication Module.</h5>
                        <p class="mb-0 font-weight-light">It is a long established fact that a reader will be distracted by the readable content of a page.</p>
                      </div>
                      <div class="ms-auto">
                        <i class="mdi mdi-heart-outline text-muted"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-7 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Project Status</h4>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th> # </th>
                            <th> Name </th>
                            <th> Due Date </th>
                            <th> Progress </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td> 1 </td>
                            <td> Herman Beck </td>
                            <td> May 15, 2015 </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-gradient-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td> 2 </td>
                            <td> Messsy Adam </td>
                            <td> Jul 01, 2015 </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-gradient-danger" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td> 3 </td>
                            <td> John Richards </td>
                            <td> Apr 12, 2015 </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-gradient-warning" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td> 4 </td>
                            <td> Peter Meggik </td>
                            <td> May 15, 2015 </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-gradient-primary" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td> 5 </td>
                            <td> Edward </td>
                            <td> May 03, 2015 </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-gradient-danger" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td> 5 </td>
                            <td> Ronald </td>
                            <td> Jun 05, 2015 </td>
                            <td>
                              <div class="progress">
                                <div class="progress-bar bg-gradient-info" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-5 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title text-white">Todo</h4>
                    <div class="add-items d-flex">
                      <input type="text" class="form-control todo-list-input" placeholder="What do you need to do today?">
                      <button class="add btn btn-gradient-primary font-weight-bold todo-list-add-btn" id="add-task">Add</button>
                    </div>
                    <div class="list-wrapper">
                      <ul class="d-flex flex-column-reverse todo-list todo-list-custom">
                        <li>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="checkbox" type="checkbox"> Meeting with Alisa </label>
                          </div>
                          <i class="remove mdi mdi-close-circle-outline"></i>
                        </li>
                        <li class="completed">
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="checkbox" type="checkbox" checked> Call John </label>
                          </div>
                          <i class="remove mdi mdi-close-circle-outline"></i>
                        </li>
                        <li>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="checkbox" type="checkbox"> Create invoice </label>
                          </div>
                          <i class="remove mdi mdi-close-circle-outline"></i>
                        </li>
                        <li>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="checkbox" type="checkbox"> Print Statements </label>
                          </div>
                          <i class="remove mdi mdi-close-circle-outline"></i>
                        </li>
                        <li class="completed">
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="checkbox" type="checkbox" checked> Prepare for presentation </label>
                          </div>
                          <i class="remove mdi mdi-close-circle-outline"></i>
                        </li>
                        <li>
                          <div class="form-check">
                            <label class="form-check-label">
                              <input class="checkbox" type="checkbox"> Pick up kids from school </label>
                          </div>
                          <i class="remove mdi mdi-close-circle-outline"></i>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
              <!-- password change -->
              <div id="myModal2" class="modal fade">
                <div class="modal-dialog modal-confirm">
                  <div class="modal-content">
              
                                  
                      <div class="mainDiv">
                        <div class="cardStyle">
                          <form action="./PhoneBookController?Action=UPDATEPASSWORD" method="post" name="signupForm" id="signupForm">
                            
                            <img src="" id="signupLogo"/>
                            
                            <h4 class="formTitle">
                              Login to your account
                            </h4>
                            <div class="inputDiv">
                              <label class="inputLabel" for="password">Current Password</label>
                              <input type="password" id="password" name="password" required>
                            </div>
                              
                          <div class="inputDiv">
                            <label class="inputLabel" for="password">New Password</label>
                            <input type="password" id="password" name="newpassword" required>
                          </div>
                            
                          <div class="inputDiv">
                            <label class="inputLabel" for="confirmPassword">Confirm New Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required="required">
                          </div>
                          
                          <div class="buttonWrapper">
                            <button type="submit" id="submitButton"  class="submitButton pure-button pure-button-primary">
                              <span>Continue</span>
                              <!-- <span id="loader"></span> -->
                            </button>
                          </div>
                            
                        </form>
                        </div>
                    
                  </div>
                </div>
              </div> 
              </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/todolist.js"></script>
    <!-- End custom js for this page -->
    
  </body>
</html>