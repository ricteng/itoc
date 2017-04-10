<%@taglib uri="/ecbt-tags" prefix="e"%>
<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
		<%
			String strURL = request.getHeader("Referer");
			String strHost = request.getHeader("Host");
			System.out.println("Login host:" + strHost + ", Referer:" + strURL);
			if (strURL!=null && strURL.indexOf("weberho.com") >= 0){
				session.setAttribute("ent_source", "6501");
				session.setAttribute("city_source", "650100");
			}
			if (strURL!=null && strURL.indexOf("sysinglewindow") >= 0){
				session.setAttribute("ent_source", "2101");
				session.setAttribute("city_source", "210100");
			}
			if (strHost!=null && 
				(strHost.indexOf("cbtunion.net") >= 0 
				 || strHost.indexOf("209.9.107.53")>=0
				 || strHost.indexOf("192.168.20.21")>=0
				 )) {
				session.setAttribute("ent_source", "3702");
				session.setAttribute("city_source", "370200");
			}
			if (session.getAttribute("ent_source")==null){
				session.setAttribute("ent_source", "");
			}
			String ent_source = (String)session.getAttribute("ent_source");
		%>
<html lang="en">
	<head>
		<meta name="keywords"  content="一站式跨境贸易综合服务平台,ecbt,eCBT One Stop Cross Border Trade"></meta>
		<meta name="description"  content="一站式跨境贸易综合服务平台,ecbt,eCBT One Stop Cross Border Trade"></meta>
		<meta http-equiv="Cache-Control" content="no-store" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>eCBT One Stop Cross Border Trade</title>
	<%@include file="/include/base.jsp"%>
	<body class="c-login-bg-mig5">
		<%
			String ent_top = "top.jsp";
			if (ent_source!=null && ent_source.length()>0){
				ent_top = "top_"+ ent_source + ".jsp";
			}
		%>
		<jsp:include flush="true" page="<%=ent_top %>"></jsp:include>
		<div class="container-fluid">
		  <!-- <div class="con-top">
		    <img class="top-login" src="<%=request.getContextPath()%>/style/image/qy_log1.png">
		    <div class="text-left nav-top-login pull-right">
							<ul class="nav class-tabs" id="login-Tab">
								<li><a href="#">首页</a></li>
								<li><a href="#">外贸服务</a></li>
								<li><a href="#">服务社区</a></li>
								<li><a href="#">融资服务</a></li>
								<li><a href="#">需求竞单</a></li>
							</ul>
						</div>
		  </div> -->
		</div>
		<div class="container c-container" id="login" ng-controller="loginController as lg">
			<div class="con-top">
		    	<div class="c-pull-r">
			    	<div class="cc-log_w">
				    	<div class="c-log_m">
				    		<div class="text-center c-pm" >
				    			<img class="c-logo2" src="<%=request.getContextPath()%>/style/image/c_logo2.png">
				    			<img class="c-kmym" src="<%=request.getContextPath()%>/style/image/c-kmym<%=ent_source%>.png">
				        		<!-- <h1 class="c-l_bt text-center">跨贸云盟</h1> -->
				    		</div>	
				    		
							<fieldset>
								<form id="loginform" class="bs-example bs-example-form" data-example-id="simple-input-groups">
					              
									<div class="input-group input_k">
										<span class="input-group-addon lo_zh" id="basic-addon1"></span>
										<input type="text" ng-model="loginname" 
											class="form-control line_n input-sm"
											placeholder="<e:i18n key="login.loginname"/>"
											autofocus  />
									</div>
									<div class="input-group input_k">
									    <span class="input-group-addon lo_mm" id="basic-addon1"></span>
										<input class="form-control line_n input-sm" ng-model="password"
											placeholder="<e:i18n key="login.password"/>"
											type="password" value=""  >
									</div>
								 	<div class="input-group input_k">
										<input class="fl-1 psword-input"  maxlength="4" size="20" name="capture" ng-model="kaptcha" type="text" style="width: 95px;" placeholder="请输入验证码">&nbsp;&nbsp;
										<img class="fl-1 psword-img ml5" src="<%=request.getContextPath()%>/public/captcha-image" name="kaptchaImage" ng-click="kaptchaImage()" id="kaptchaImage" style="width: 80px; position: relative;" />
										<div class="fl-1 p5 ml5">
					                      	<!-- <b class="font-14 height-l30"></b>--><a href="javascript:void(0)" class="red-color font-14" ng-click="kaptchaImage()">看不清换一张</a>
					                	</div>
									</div>
					                <div class="alert" style="color:red"role="alert">{{msalert}}</div>
					                 <!-- 登录按钮 -->
						            <button class="btn btn-pay btn-block" id="login" ng-keyup="lg.myKeyup($event)" ng-click="lg.login()" name="login" tabindex="4">
						            	<e:i18n key="login.login"/>
						            </button>
									<div class="res-t c-res-t">
										<!-- label class="toggle">
										  <input type="checkbox" checked="">
										  <span class="handle"></span>
										</label>&nbsp;记住密码 -->
										<i class="pull-right"><a href="<%=request.getContextPath()%>/page/public/register.jsp">免费注册 </a> | <a href="<%=request.getContextPath()%>/page/public/forget1.jsp">忘记密码？</a></i>
									</div>
					            </form>
					            <%-- <div class="nav mm_p">
					              <div class="navbar-left"> <a href="#">
					                <e:i18n key="login.Registered"/>
					                </a> </div>
					              <div class="navbar-right l_r"> <a href="#">
					                <e:i18n key="login.Forgetpassword"/>
					                </a> </div>
					            </div> --%>
							</fieldset>
						</div>
					</div>	
				</div>
			</div>
		</div>
		<div class="text-center login_bottom">
			<nav class="navbar navbar-default border-none mb0 zindex">
				<div class="container-full cc-bottom-infor">
				<%
					String ent_bottom = "login_bottom.jsp";
					if (ent_source!=null && ent_source.length()>0){
						ent_bottom = "login_bottom_"+ ent_source + ".jsp";
					}
				%>
				<jsp:include page="<%=ent_bottom %>" flush="true"></jsp:include>
				</div>
			</nav>
		</div>
	</body>
<script>
	angular.element(document).ready(function() {
		var loginC = angular.module('loginC', [ 'mgcrea.ngStrap', 'ek' ]);
	
		initPost(loginC);

		loginC.controller('loginController', function($scope, $http) {			
			$scope.msalert ="";
			$scope.loginname = "";
			$scope.password = "";
			
			$scope.kaptcha = "";
			$scope.kaptchaImage = function kaptchaImage(){
				$('#kaptchaImage').hide().attr('src', ctxRoot + '/public/captcha-image?' + Math.floor(Math.random() * 100)).fadeIn();
			};
			
			$scope.forwards = function() {
				$("#new-po1").load(ctxRoot + "/page/public/register", {}, function() {});
			};
			
			this.login = function login() {
				
				
				if(trim($scope.loginname).length==0||trim($scope.password).length==0){
					$scope.msalert = '<e:i18n key="login.1"/>';
					return;
				}
					
				var userData = null;
				var dataToPost ={
					    "service":"pdc/user/"+$scope.loginname,
				        "method":"GET",
				        "version":"v1",
				        "parameter":[],
				        "content":""
				};
				$http.post(ctxRoot + '/rest/ab', dataToPost).success(function(data) {
					userData = eval(angular.fromJson(strDec(data.a,"qwe.123","qwe","123")));
					userData["password2"]=$scope.password;
					userData["loginname2"]=$scope.loginname;
					userData["kaptcha"]=$scope.kaptcha;
					$http.post(ctxRoot + '/public/Login', userData).success(function(data) {
						if (data.success == true) {
							location.href = ctxRoot + data.msg;
						} else {
							if(data.msg=='1'){
								$scope.msalert = '<e:i18n key="login.1"/>';
							}else if (data.msg=='2'){
								$scope.msalert = '<e:i18n key="login.8"/>';
							}else if (data.msg=='3'){
								$scope.msalert = '<e:i18n key="login.8"/>';
							}else if (data.msg=='5'){
								$scope.msalert = '<e:i18n key="login.5"/>';
							}else if (data.msg=='6'){
								$scope.msalert = '<e:i18n key="login.6"/>';
							}else if (data.msg=='7'){
								$scope.msalert = '<e:i18n key="login.7"/>';
							}
						}
					});
				});
				
			};
			
			$scope.myKeyup = function(e){
				var keycode = window.event?e.keyCode:e.which;
				if(keycode==13){
	                $scope.login();
	            }
			};
			
		});

		angular.bootstrap(document.getElementById('login'), [ 'loginC' ]);

	});
</script>
</html>
