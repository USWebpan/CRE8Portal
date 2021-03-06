<%--
Default Home Page Layout with CSS and JS for the tiles position of the Front End UI
 --%>
<%@ include file="../layout/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
  	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="Fri, 18 Jul 2014 1:00:00 GMT" />
	
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
  
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/js/template/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/js/template/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- iCheck -->
   <link href="${pageContext.request.contextPath}/resources/js/template/iCheck/skins/flat/green.css" rel="stylesheet" />
	<!-- Animate.css -->
	<link href="${pageContext.request.contextPath}/resources/js/template/animate.css/animate.min.css" rel="stylesheet" />
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/resources/css/mainStyle.css?v=2" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/footer_common.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.css" rel="stylesheet" />
    <style type="text/css" class="init">
	
td.details-control {
	background: url('../resources/images/details_open.png')  no-repeat center !important;
	cursor: pointer;
}
tr.details td.details-control {
	background: url('../resources/images/details_close.png')  no-repeat center !important;
}

	</style>
    <link href="${pageContext.request.contextPath}/resources/css/datatables.css?v=1" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-dialog.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/autocomplete-0.3.0.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/jquery.mloading.css" rel="stylesheet" />
    
    <script src="${pageContext.request.contextPath}/resources/js/template/jquery/3.2.1/jquery.min.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/js/datatables.min.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/js/masks.js" ></script> --%>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.mask.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.full.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.numbox-1.3.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/commonUtil.js?v=1"></script>
	<script src="${pageContext.request.contextPath}/resources/js/stringUtil.js"></script>
	 <link href="${pageContext.request.contextPath}/resources/js/template/select2/select2.min.css?v=2" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/resources/js/template/select2/select2.min.js"></script>
    
    <link href="${pageContext.request.contextPath}/resources/css/jquery-confirm.css?v=2" rel="stylesheet" />
	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/CRE8-Pharma-logo.png" sizes="32x32" />
	
 	<c:forEach var="css" items="${stylesheets}">
    	<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>" />
    </c:forEach>

	<title><tiles:getAsString name="title" /></title>
<c:if test="${not empty passwordwarningmessage}">
    <script>
    	$(document).ready(function(){
		     	var msg='<br><center><font color="maroon" style="font-size:14px">'+ '${passwordwarningmessage}' + '</font></center>';
		     	$.alert({
				    title: '',
				    content:msg,
				});
     		});
    </script>
</c:if>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">

        	<div class="col-md-3 left_col">
          		<div class="left_col scroll-view">
            		<div class="navbar nav_title" style="border: 0;">
              			<a href="${pageContext.request.contextPath}/index.jsp" class="site_title">
              				<!-- <i class="fa fa-user-md" style="font-size:35px;color:lightgreen;"></i> <span>CRE8 Portal</span> -->
              				<img src="${pageContext.request.contextPath}/resources/images/CRE8-WEB-white-logo.png" alt="..." style="width: 64px; " />
              			</a>
            		</div>
            		<div class="clearfix"></div>

            		<!-- menu profile quick info -->
            		<div class="profile clearfix">
              			<div class="profile_pic">
                			<%-- <img src="${pageContext.request.contextPath}/resources/images/img.jpg" alt="..." class="img-circle profile_img"> --%>
		                    <c:choose>
                        		<c:when test="${loginDetail.photoUrl != null and loginDetail.photoUrl != ''}">
                        			<img class="img-circle profile_img" src="${pageContext.request.contextPath}/resources/${loginDetail.photoUrl}" />
                        		</c:when>
                        		<c:otherwise>
									<img class="img-circle profile_img" src="${pageContext.request.contextPath}/resources/images/img.jpg"  />
                        		</c:otherwise>
                        	</c:choose>                			
              			</div>
              			<div class="profile_info">
                			<span>Welcome,</span>
                			<h2>${loginDetail.displayName}</h2>
              			</div>
            		</div>
            		<!-- /menu profile quick info -->
            		
            		<!-- /sidebar menu -->	
					<c:choose>
						<c:when test="${loginDetail.type == 'Physician'}">
							<c:if test="${loginDetail.status == 'Approved' or loginDetail.status == 'New Modifications' or loginDetail.status == 'Profile Completed' }">
			            		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			              			<div class="menu_section">
			                			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			              					<div class="menu_section">
			                					<ul class="nav side-menu">
			                  						<li><a href="#Dashboard"><i class="fa fa-home" style="font-size:20px;color:violet;"></i> Home <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/dashboard/physiciandashboard">Dashboard</a></li>
			                  								<li><a href="${pageContext.request.contextPath}/physician/PhysicianProfile">Profile</a></li>
			                  							</ul>
			                  						</li>
			                   						<li><a href="#Physicianass"><i class="fa fa-female" style="font-size:20px;color:yellow;"></i> Physician Assistant <span class="fa fa-chevron-down"></span></a>
			                    						<ul class="nav child_menu">
			                      							<li><a href="${pageContext.request.contextPath}/physician/physicianassistantaccountsummary">Physician Assistant Summary</a></li>
			                    						</ul>
			                  						</li>
			                  						<li><a href="#Patient"><i class="fa fa-male" style="font-size:25px;color:lightblue;"></i> Patient <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/patient/patientaccountsummary">Patient Summary</a></li>
			                  							</ul>
			                  						</li>
			                  						<li><a><i class="fa fa-medkit" style="font-size:20px;color:lightgreen;"></i> Prescription <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/prescription/prescriptionSummary">Prescription Summary</a></li>
			                  							</ul>
			                  						</li>
			                  						<li><a><i class="fa fa-first-order" style="font-size:20px;color:cyan;"></i> Order <span class="fa fa-chevron-down"></span></a>
				                  							<ul class="nav child_menu">
				                  								<li><a href="${pageContext.request.contextPath}/order/orderSummary">Order Summary</a></li>
				                  							</ul>
				                  					</li>
				                  					<li><a><i class="fa fa-files-o" style="font-size:20px;color:pink;"></i> Invoice <span class="fa fa-chevron-down"></span></a>
				                  							<ul class="nav child_menu">
				                  								<li><a href="${pageContext.request.contextPath}/invoice/invoiceSummary">Invoice Summary</a></li>
				                  							</ul>
				                  					</li>
				                  					<li><a><i class="fa fa-ambulance" style="font-size:20px;color:#0388fd;"></i> Clinic <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/clinic/clinicSummary">Clinic Summary</a></li>
			                  							</ul>
		                  							</li>			                  						
			                  						<li><a><i class="fa fa-book" style="font-size:20px;color:orange;"></i> Instruction Manuals <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/manual/manualDocListView">Instruction Manuals</a></li>
			                  							</ul>
			                  						</li>
			                  						<li><a><i class="fa fa-table" style="font-size:20px;color:#25e80f;"></i> Reports <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/reports/patientsListReport">Patient List</a></li>
			                  								<li><a href="${pageContext.request.contextPath}/reports/prescriptionListReport">Prescription List</a></li>
			                  								<li><a href="${pageContext.request.contextPath}/reports/orderListReport">Order List</a></li>
			                  								<li><a href="${pageContext.request.contextPath}/reports/invoiceListReport">Invoice List</a></li>
			                  							</ul>
			                  						</li>			                  						
			                  					</ul>
			                  					<div style="height:2500px;"><br/></div>
			                				</div>
			                			</div>
			                		</div>
			                	</div>
			                </c:if>
							<c:if test="${loginDetail.status == 'New'}">
		            			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			              			<div class="menu_section">
			                			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			              					<div class="menu_section">
			                					<ul class="nav side-menu">
			                  						<%-- <li><a href="#Dashboard"><i class="fa fa-home" style="font-size:20px;color:violet;"></i> Home <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/testdashboard">Dashboard</a></li>
			                  							</ul>
			                  						</li>
			                   						<li><a href="#Physician"><i class="fa fa-stethoscope" style="font-size:20px;color:lightgreen;"></i> Physician <span class="fa fa-chevron-down"></span></a>
			                    						<ul class="nav child_menu">
			                      							<li><a href="${pageContext.request.contextPath}/physician/PhysicianProfile">Physician Profile</a></li>
			                    						</ul>
			                  						</li> --%>
			                  					</ul>
			                  					<div style="height:2500px;"><br/></div>
			                				</div>
			                			</div>
			                		</div>
			                	</div>
		            		</c:if>
		            		
		            		<!-- /menu footer buttons -->
		            		<div class="sidebar-footer hidden-small">
		              			<a data-toggle="tooltip" data-placement="top" title="Logout" href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></a>
		            		</div>
		            		<!-- /menu footer buttons -->
						</c:when>
						<c:when test="${loginDetail.type == 'Physician Assistant'}">
		            		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		              			<div class="menu_section">
		                			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		              					<div class="menu_section">
		                					<ul class="nav side-menu">
		                   						<li><a href="#Dashboard"><i class="fa fa-home" style="font-size:20px;color:violet;"></i> Home <span class="fa fa-chevron-down"></span></a>
		                    						<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/dashboard/physiciandashboard">Dashboard</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/physician/assistantProfile">Profile</a></li>
		                  							</ul>
		                  						</li>
		                   						<%-- <li><a href="#Physician"><i class="fa fa-stethoscope" style="font-size:20px;color:lightgreen;"></i> Physician <span class="fa fa-chevron-down"></span></a>
		                    						<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/physician/assistantProfile">Physician Assistant Profile</a></li>
		                    						</ul>
		                  						</li> --%>
		                  						<li><a href="#Patient"><i class="fa fa-male"  style="font-size:25px;color:lightblue;"></i> Patient <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/patient/patientaccountsummary">Patient Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-medkit" style="font-size:20px;color:lightgreen;"></i> Prescription <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/prescription/prescriptionSummary">Prescription Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-first-order" style="font-size:20px;color:cyan;"></i> Order <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/order/orderSummary">Order Summary</a></li>
		                  							</ul>
			                  					</li>
			                  					<li><a><i class="fa fa-files-o" style="font-size:20px;color:pink;"></i> Invoice <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/invoice/invoiceSummary">Invoice Summary</a></li>
		                  							</ul>
			                  					</li>
			                  					<li><a><i class="fa fa-ambulance" style="font-size:20px;color:#0388fd;"></i> Clinic <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/clinic/clinicSummary">Clinic Summary</a></li>
		                  							</ul>
	                  							</li>
			                  					<li><a><i class="fa fa-book" style="font-size:20px;color:orange;"></i> Instruction Manuals <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/manual/manualDocListView">Instruction Manuals</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-table" style="font-size:20px;color:#25e80f;"></i> Reports <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/reports/patientsListReport">Patient List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/prescriptionListReport">Prescription List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/orderListReport">Order List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/invoiceListReport">Invoice List</a></li>
		                  							</ul>
		                  						</li>		                  						
		                  					</ul>
		                  					<div style="height:1800px;"><br/></div>
		                				</div>
		                			</div>
		                		</div>
		                	</div>
		                	<!-- /menu footer buttons -->
		            		<div class="sidebar-footer hidden-small">
		              			<a data-toggle="tooltip" data-placement="top" title="Logout" href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></a>
		            		</div>
		            		<!-- /menu footer buttons -->
						</c:when>
						<c:when test="${loginDetail.type == 'Patient'}">
		            		<c:if test="${loginDetail.status == 'Approved' or loginDetail.status == 'New Modifications'}">
			            		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			              			<div class="menu_section">
			                			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			              					<div class="menu_section">
			                					<ul class="nav side-menu">
			                   						<li><a href="#Dashboard"><i class="fa fa-home" style="font-size:20px;color:violet;"></i> Home <span class="fa fa-chevron-down"></span></a>
			                    						<ul class="nav child_menu">
			                    							<li><a href="${pageContext.request.contextPath}/dashboard/patientdashboard">Dashboard</a></li>
			                    							<li><a href="${pageContext.request.contextPath}/patient/patientProfile">Profile</a></li>
			                      						</ul>
			                    					</li>
			                    					<li><a><i class="fa fa-medkit" style="font-size:20px;color:lightgreen;"></i> Prescription <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/prescription/prescriptionSummary">Prescription Summary</a></li>
			                  							</ul>
			                  						</li>
			                  						<li><a><i class="fa fa-first-order" style="font-size:20px;color:cyan;"></i> Order <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/order/orderSummary">Order Summary</a></li>
			                  							</ul>
				                  					</li>
				                  					<li><a><i class="fa fa-book" style="font-size:20px;color:orange;"></i> Instruction Manuals <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/manual/manualDocListView">Instruction Manuals</a></li>
			                  							</ul>
				                  					</li>
			                  						<li><a><i class="fa fa-table" style="font-size:20px;color:#25e80f;"></i> Reports <span class="fa fa-chevron-down"></span></a>
			                  							<ul class="nav child_menu">
			                  								<li><a href="${pageContext.request.contextPath}/reports/prescriptionListReport">Prescription List</a></li>
			                  								<li><a href="${pageContext.request.contextPath}/reports/orderListReport">Order List</a></li>
			                  							</ul>
			                  						</li>			                  					
			                  					</ul>
			                  					<div style="height:1800px;"><br/></div>
			                				</div>
			                			</div>
			                		</div>
			                	</div>
		            		</c:if>
		            		<c:if test="${loginDetail.status == 'New'}">
		            			<div style="height:1800px;"><br/></div>
		            		</c:if>
		                	<!-- /menu footer buttons -->
		            		<div class="sidebar-footer hidden-small">
		              			<a data-toggle="tooltip" data-placement="top" title="Logout" href="${pageContext.request.contextPath}/patientlogout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></a>
		            		</div>
		            		<!-- /menu footer buttons -->
						</c:when>						
						<c:when test="${loginDetail.type == 'Admin'}">
		            		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		              			<div class="menu_section">
		                			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		              					<div class="menu_section">
		                					<ul class="nav side-menu">
		                   						<li><a><i class="fa fa-home" style="font-size:20px;color:violet;"></i> Dashboard <span class="fa fa-chevron-down"></span></a>
		                    						<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/dashboard/adminDashboard">Dashboard</a></li>
		                      							<li><a href="${pageContext.request.contextPath}/admin/adminProfile">Profile</a></li>
		                    						</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-stethoscope" style="font-size:20px;color:lightgreen;"></i> Physician <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/physician/physicianSummary">Physician Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-female" style="font-size:20px;color:yellow;"></i> Physician Assistant <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/physician/physicianassistantaccountsummary">Physician Assistant Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-male"  style="font-size:25px;color:lightblue;"></i> Patient <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/patient/patientaccountsummary">Patient Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-medkit" style="font-size:20px;color:lightgreen;"></i> Prescription <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/prescription/prescriptionSummary">Prescription Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-first-order" style="font-size:20px;color:cyan;"></i> Order <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/order/orderSummary">Order Summary</a></li>
		                  							</ul>
			                  					</li>
			                  					<li><a><i class="fa fa-files-o" style="font-size:20px;color:pink;"></i> Invoice <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/invoice/invoiceSummary">Invoice Summary</a></li>
		                  							</ul>
			                  					</li>
			                  					<li><a><i class="fa fa-ambulance" style="font-size:20px;color:#0388fd;"></i> Clinic <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/clinic/clinicSummary">Clinic Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-book" style="font-size:20px;color:orange;"></i> Instruction Manuals <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/manual/documentUpload">Instruction Manuals</a></li>
		                  							</ul>
		                  						</li>
		                  						<%-- <li><a><i class="fa fa-table" style="font-size:20px;color:#25e80f;"></i> Reports <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/reports/patientsListReport">Patient List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/physicianListReport">Physician List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/prescriptionListReport">Prescription List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/orderListReport">Order List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/invoiceListReport">Invoice List</a></li>
		                  							</ul>
		                  						</li>	 --%>	                  					
		                  					</ul>
		                  					<div style="height:1800px;"><br/></div>
		                				</div>
		                			</div>
		                		</div>
		                	</div>	
		                	<!-- /menu footer buttons -->
		            		<div class="sidebar-footer hidden-small">
		              			<a data-toggle="tooltip" data-placement="top" title="Logout" href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></a>
		            		</div>
		            		<!-- /menu footer buttons -->						
						</c:when>
						<c:when test="${loginDetail.type == 'Super Admin'}">
		            		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		              			<div class="menu_section">
		                			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		              					<div class="menu_section">
		                					<ul class="nav side-menu">
		                   						<li><a href="#Dashboard"><i class="fa fa-home" style="font-size:20px;color:violet;"></i> Dashboard <span class="fa fa-chevron-down"></span></a>
		                    						<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/dashboard/adminDashboard">Dashboard</a></li>
		                    						</ul>
		                  						</li>
		                  						
		                  						<c:choose>
											    	<c:when test="${(loginDetail.type == 'Administrator' or loginDetail.type == 'Super Admin' or loginDetail.type == 'Admin')}">
												      	<c:if test="${(loginDetail.adminAccCreationPermission =='Yes')}">
												      		<li><a href="#Admin"><i class="fa fa-user-secret"  style="font-size:20px;color:aqua;"></i>Pharmacy Admin <span class="fa fa-chevron-down"></span></a>
						                  						<ul class="nav child_menu">
						                  							<li><a href="${pageContext.request.contextPath}/admin/adminAccountSummary">Pharmacy Admin Summary</a></li>
						                  						</ul>
						                  					</li>
												    	</c:if>
											      	</c:when>
											      	<c:otherwise>
												    	<li><a href="#Admin"><i class="fa fa-user-secret"  style="font-size:20px;color:aqua;"></i> Pharmacy Admin <span class="fa fa-chevron-down"></span></a>
						                  					<ul class="nav child_menu">
						                  						<li><a href="${pageContext.request.contextPath}/admin/adminAccountSummary">Pharmacy Admin Summary</a></li>
						                  					</ul>
						                  				</li>
											      	</c:otherwise>
											    </c:choose>
											    
		                  						<li><a href="#Physician"><i class="fa fa-stethoscope" style="font-size:20px;color:lightgreen;"></i> Physician <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/physician/physicianSummary">Physician Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a href="#Physicianass"><i class="fa fa-female" style="font-size:20px;color:yellow;"></i> Physician Assistant <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/physician/physicianassistantaccountsummary">Physician Assistant Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a href="#Patient"><i class="fa fa-male"  style="font-size:25px;color:lightblue;"></i> Patient <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/patient/patientaccountsummary">Patient Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-medkit" style="font-size:20px;color:lightgreen;"></i> Prescription <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/prescription/prescriptionSummary">Prescription Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-first-order" style="font-size:20px;color:cyan;"></i> Order <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/order/orderSummary">Order Summary</a></li>
		                  							</ul>
			                  					</li>
			                  					<li><a><i class="fa fa-files-o" style="font-size:20px;color:pink;"></i> Invoice <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/invoice/invoiceSummary">Invoice Summary</a></li>
		                  							</ul>
			                  					</li>
			                  					
		                  						<li><a href="#Patient"><i class="fa fa-users" style="font-size:20px;color:yellow;"></i>Group<span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/group/groupMasterSummary">Group Master</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/group/groupDirectorSummary">Group Director</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-ambulance" style="font-size:20px;color:#0388fd;"></i> Clinic <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/clinic/clinicSummary">Clinic Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-book" style="font-size:20px;color:orange;"></i> Instruction Manuals <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/manual/documentUpload">Instruction Manuals</a></li>
		                  							</ul>
		                  						</li>
		                  						<%-- <li><a><i class="fa fa-table" style="font-size:20px;color:#25e80f;"></i> Reports <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/reports/patientsListReport">Patient List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/physicianListReport">Physician List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/prescriptionListReport">Prescription List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/orderListReport">Order List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/invoiceListReport">Invoice List</a></li>
		                  							</ul>
		                  						</li> --%>
		                  					</ul>
		                  					<div style="height:1800px;"><br/></div>
		                				</div>
		                			</div>
		                		</div>
		                	</div>
		                	
		                	<!-- /menu footer buttons -->
		            		<div class="sidebar-footer hidden-small">
		              			<a data-toggle="tooltip" data-placement="top" title="Logout" href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></a>
		            		</div>
		            		<!-- /menu footer buttons -->
						</c:when>
						<c:when test="${loginDetail.type == 'Group Director'}">
							<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		              			<div class="menu_section">
		                			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		              					<div class="menu_section">
		                					<ul class="nav side-menu">
		                   						<li><a href="#Dashboard"><i class="fa fa-home" style="font-size:20px;color:violet;"></i> Dashboard <span class="fa fa-chevron-down"></span></a>
		                    						<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/dashboard/groupdirectordashboard">Dashboard</a></li>
		                      							<li><a href="${pageContext.request.contextPath}/group/editGroupDirector">Profile</a></li>
		                    						</ul>
		                  						</li>
		                  						<li><a href="#Physician"><i class="fa fa-stethoscope" style="font-size:20px;color:lightgreen;"></i> Physician <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/physician/physicianSummary">Physician Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a href="#Physicianass"><i class="fa fa-female" style="font-size:20px;color:yellow;"></i> Physician Assistant <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                      							<li><a href="${pageContext.request.contextPath}/physician/physicianassistantaccountsummary">Physician Assistant Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a href="#Patient"><i class="fa fa-male"  style="font-size:25px;color:lightblue;"></i> Patient <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/patient/patientaccountsummary">Patient Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-medkit" style="font-size:20px;color:lightgreen;"></i> Prescription <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/prescription/prescriptionSummary">Prescription Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-first-order" style="font-size:20px;color:cyan;"></i> Order <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/order/orderSummary">Order Summary</a></li>
		                  							</ul>
			                  					</li>
			                  					<li><a><i class="fa fa-files-o" style="font-size:20px;color:pink;"></i> Invoice <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/invoice/invoiceSummary">Invoice Summary</a></li>
		                  							</ul>
			                  					</li>
			                  					<li><a href="#Patient"><i class="fa fa-users" style="font-size:20px;color:yellow;"></i>Group<span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/group/loadGroupMaster">Group Master</a></li>
		                  							</ul>
		                  						</li>
			                  					<%-- <li><a href="${pageContext.request.contextPath}/group/editGroupMasterAccount"><i class="fa fa-users" style="font-size:20px;color:yellow;"></i>Group</a>
		                  						</li> --%>
			                  					<li><a><i class="fa fa-ambulance" style="font-size:20px;color:#0388fd;"></i> Clinic <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/clinic/clinicSummary">Clinic Summary</a></li>
		                  							</ul>
		                  						</li>
		                  						<li><a><i class="fa fa-book" style="font-size:20px;color:orange;"></i> Instruction Manuals <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/manual/documentUpload">Instruction Manuals</a></li>
		                  							</ul>
		                  						</li>
		                  						<%-- <li><a><i class="fa fa-table" style="font-size:20px;color:#25e80f;"></i> Reports <span class="fa fa-chevron-down"></span></a>
		                  							<ul class="nav child_menu">
		                  								<li><a href="${pageContext.request.contextPath}/reports/patientsListReport">Patient List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/physicianListReport">Physician List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/prescriptionListReport">Prescription List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/orderListReport">Order List</a></li>
		                  								<li><a href="${pageContext.request.contextPath}/reports/invoiceListReport">Invoice List</a></li>
		                  							</ul>
		                  						</li> --%>
		                  					</ul>
		                  					<div style="height:1800px;"><br/></div>
		                				</div>
		                			</div>
		                		</div>
		                	</div>
		                	
		                	<!-- /menu footer buttons -->
		            		<div class="sidebar-footer hidden-small">
		              			<a data-toggle="tooltip" data-placement="top" title="Logout" href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></a>
		            		</div>
		            		<!-- /menu footer buttons -->
						
						</c:when>
					</c:choose>
					<!-- /sidebar menu -->	
            		
          		</div>
        	</div>
        	        	
        	<!-- top navigation -->
        	<div class="top_nav">
          		<div class="nav_menu">
            		<nav>
              			<div class="nav toggle"><a id="menu_toggle"><i class="fa fa-bars"></i></a></div>
              			<div class="physicianGroupName">
							${loginDetail.physicianGroupName}
							<c:if test="${loginDetail.type == 'Group Director'}">
	              				<span>Group: ${loginDetail.groupName}</span>
              				</c:if>
						</div>
						
              			<ul class="nav navbar-nav navbar-right">
              				
                			<li class="logoutLi">
                  				<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    				<%-- <img src="${pageContext.request.contextPath}/resources/images/img.jpg" alt=""> --%>
				                    <c:choose>
		                        		<c:when test="${loginDetail.photoUrl != null and loginDetail.photoUrl != ''}">
		                        			<img src="${pageContext.request.contextPath}/resources/${loginDetail.photoUrl}" />
		                        		</c:when>
		                        		<c:otherwise>
											<img src="${pageContext.request.contextPath}/resources/images/img.jpg"  />
		                        		</c:otherwise>
		                        	</c:choose>${loginDetail.displayName} <span class=" fa fa-angle-down"></span>
                  				</a>
                  				<div style="text-align:center">
		              				<c:if test="${loginDetail.type == 'Physician Assistant'}">
		              						<a href="${pageContext.request.contextPath}/exitphysicianlogout" style="color:white">
												<h5><b>Switch Physician</b></h5>
											</a>
									</c:if>
								</div>
	                  			<ul class="dropdown-menu dropdown-usermenu pull-right">
	                    			<c:choose>
										<c:when test="${loginDetail.type == 'Physician'}">
	                    					<li><a href="${pageContext.request.contextPath}/physician/PhysicianProfile">Profile</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changePassword">Change Password</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changeSecurityQuestions">Security Questions</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
	                    				</c:when>
	                    				<c:when test="${loginDetail.type == 'Physician Assistant'}">
	                    					<li><a href="${pageContext.request.contextPath}/physician/assistantLeftProfile">Profile</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changePassword">Change Password</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changeSecurityQuestions">Security Questions</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
	                    				</c:when>
	                    				<c:when test="${loginDetail.type == 'Admin' or loginDetail.type == 'Super Admin'}">
	                    					<li><a href="${pageContext.request.contextPath}/admin/adminLeftProfile">Profile</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changePassword">Change Password</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changeSecurityQuestions">Security Questions</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
	                    				</c:when>
	                    				<c:when test="${loginDetail.type == 'Patient'}">
	                    					<li><a href="${pageContext.request.contextPath}/patient/patientLeftProfile">Profile</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changePassword">Change Password</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changeSecurityQuestions">Security Questions</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/patientlogout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
	                    				</c:when>
	                    				<c:when test="${loginDetail.type == 'Group Director'}">
	                    					<li><a href="${pageContext.request.contextPath}/group/editGroupDirector">Profile</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changePassword">Change Password</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/changeSecurityQuestions">Security Questions</a></li>
	                    					<li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
	                    				</c:when>
	                    			</c:choose>
	                    			
	                  			</ul>
	                		</li>
              			</ul>
            		</nav>
          		</div>
        	</div>
        	<!-- /top navigation -->
       
			<!-- Content Wrapper. Contains page content -->
			<!-- page content -->
        	<div class="right_col" role="main">
        	
					<tiles:insertAttribute name="body" />
			
			</div>
			<!-- /page content -->
			<!-- /.content-wrapper -->
	
	        <!-- footer content -->
			<tiles:insertAttribute name="footer" />
			<!-- footer content -->
 		</div>
    </div>
	<!-- jQuery -->
  	<script src="${pageContext.request.contextPath}/resources/js/template/jquery/dist/jquery.min.js"></script>
  	<!-- Bootstrap -->	
  	<script src="${pageContext.request.contextPath}/resources/js/template/bootstrap/dist/js/bootstrap.min.js"></script>
  	<!-- FastClick -->
  	<script src="${pageContext.request.contextPath}/resources/js/template/fastclick/lib/fastclick.js"></script>
  	<!-- iCheck -->
  	<script src="${pageContext.request.contextPath}/resources/js/template/iCheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrapValidator.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap-dialog.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/autocomplete-0.3.0.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-confirm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.mloading.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/ResizeSensor.js"></script>

  	<!-- Custom Theme Scripts -->
  	<script src="${pageContext.request.contextPath}/resources/js/custom.js?v=1"></script>
  	<!-- jQuery Smart Wizard -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.smartWizard_1.js?v=2"></script> 

<script>
 
 $(document).ready(function(){
	 try{
		 //Highlighting the Main-Menu and Sub-Menu Item, added by Shalini on Oct 9,2017 
		 var url = window.location;
		 //alert(url)
		 //alert("<tiles:getAsString name='current' />")
		
		/*  $('body').find('a').each(function(){
			   //alert($(this).attr('jshref'))
			   if($(this).attr('jshref')!=undefined && $(this).attr('jshref')!="undefined"){
			     if($(this).attr('jshref').indexOf("<tiles:getAsString name='current' />")!=-1){
			    	
			        	$(this).closest('li').addClass("current-page").parents('ul').parent().addClass('active active-sm');
			        	$(this).closest('li').addClass("current-page").parents('ul').attr("style","display:block");
			        	//alert($(this).closest('li').addClass("current-page").parents('ul'));
			       }
			   }
	 		}); */
	 		
		 $('body').find('a').each(function(){
			   //alert($(this).attr('href'))
			   if($(this).attr('href')!=undefined && $(this).attr('href')!="undefined"){
			     if($(this).attr('href').indexOf("<tiles:getAsString name='current' />")!=-1){
			    	
			        	$(this).closest('li').addClass("current-page").parents('ul').parent().addClass('active active-sm');
			        	$(this).closest('li').addClass("current-page").parents('ul').attr("style","display:block");
			        	//alert($(this).closest('li').addClass("current-page").parents('ul'));
			       }
			   }
	 		});
	 
	 }catch(e)
	 {
		 alert(e)
	 }
	 //heightAdjust();
});
 
function heightAdjust() {
	var menuHeight = $(".main_menu").css("height");
	var rightHeight = $(".right_col").css("height");
	if (parseInt(menuHeight) > parseInt(rightHeight)) {
		$(".right_col").css("height", menuHeight);
		$(".right_col").css("min-height", menuHeight);
	} else
		$(".main_menu").css("height", parseInt(rightHeight));
}
heightAdjust();

$(document).ready(function(){
	try{
		//Auto-Focus the First Form Element
		document.forms[0].elements[0].focus();
	}catch(e)
	{
		//alert(e)
	}
});
</script>

 	
</body>
</html>
