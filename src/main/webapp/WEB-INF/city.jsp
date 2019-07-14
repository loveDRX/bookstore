<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

    
    <link href="css/city-picker.css" rel="stylesheet" type="text/css" />
    <link href="css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<f:view>
 <div class="form-group"  id="distpicker">
                            <label class="col-lg-3 control-label">adress</label>
                            <div class="col-lg-5">
                                <div style="position: relative;">
									<input id="city-picker3" class="form-control" readonly type="text" name="address" value="江苏省/常州市/溧阳市" data-toggle="city-picker">
								</div>
                            </div>
                             <div class="col-lg-4">
								<button class="btn btn-warning" id="reset" type="button">重置</button>
								<button class="btn btn-danger" id="destroy" type="button">确定</button>
						     </div>	
                        </div>
                        
							<script src="js/city-picker.data.js"></script>
	                        <script src="js/city-picker.js"></script>
	                        <script src="js/main.js"></script>
</f:view>
</body>
</html>