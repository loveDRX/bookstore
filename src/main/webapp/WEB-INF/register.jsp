<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>注册</title>

   
    <link rel="stylesheet" href="css/bootstrapValidator.css"/>
    
    <!-- Include the FontAwesome CSS if you want to use feedback icons provided by FontAwesome -->
    <!--<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />-->
     
   
</head>
<body>
<%@ include file="/WEB-INF/header.jsp"%>  
 <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-6 col-lg-offset-2">
                    <div class="page-header">
                        <h2>新用户注册</h2>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal" action="customer/doRegister">
                      <div class="form-group">
                            <label class="col-lg-3 control-label">用户名：</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="username" placeholder="用户名" />
                            </div>
                          </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">密码：</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="password" />
                            </div>
                        </div>
                         <button type="submit" class="btn btn-primary" >提交</button>
                     </form>
                       <!--
                         <div class="form-group">
                            <label class="col-lg-3 control-label">确认密码:</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="confirmPassword" />
                            </div>
                        </div> 
                       

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Email：</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="email" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Birthday：</label>
                            <div class="col-lg-5">
                                <input type="text" id="test1" name="birthday" class="form-control" >
                            </div>
                        </div>               -->        
							<!-- <script src="js/laydate.js"></script>  改成你的路径 
							<script>
							//执行一个laydate实例
							laydate.render({
							  elem: '#test1' //指定元素
							});
							</script>

                       <div class="form-group">
                            <label class="col-lg-3 control-label">Gender</label>
                            <div class="col-lg-5">
                                <div class="radio">
                     <label>               
                                                    男<input type="radio" name="gender" value="0" /> 
                     </label>
                           </div>
                          </div>
						 </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Gender</label>
                            <div class="col-lg-5">
                                <div class="radio">
                       <label>                                                       
                                                         女 <input type="radio" name="gender" value="1" />
                       </label>
                           </div>
                          </div>
						 </div>
                            <%@ include file="/WEB-INF/city.jsp"%> 
                        <div class="form-group">
                            <label class="col-lg-3 control-label" id="captchaOperation"></label>
                            <div class="col-lg-2">
                                <input type="text" class="form-control" name="address" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                               
                                <button type="button" class="btn btn-info" id="validateBtn">Manual validate</button>
                                <button type="button" class="btn btn-info" id="resetBtn">Reset form</button>
                            </div>
                        </div>
                   
                </div>
            </section>
            :form -->
        </div>
    </div>

   
<script type="text/javascript">
$(document).ready(function() {
    // Generate a simple captcha
    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

    $('#defaultForm').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
             username: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: 'The username is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: 'The username must be more than 6 and less than 30 characters long'
                    }  
                }
            },
            email: {
                validators: {
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'username',
                        message: 'The password cannot be the same as username'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and cannot be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    },
                    different: {
                        field: 'username',
                        message: 'The password cannot be the same as username'
                    }
                }
            },
           
            captcha: {
                validators: {
                    callback: {
                        message: 'Wrong answer',
                        callback: function(value, validator) {
                            var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);
                            return value == sum;
                        }
                    }
                }
            }
        }
    });


    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#defaultForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#defaultForm').data('bootstrapValidator').resetForm(true);
    });
});
</script>

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
</body>
</html>