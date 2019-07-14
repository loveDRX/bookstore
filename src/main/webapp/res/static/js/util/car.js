/*
*@Name: 母婴商城
*@Author: xuzhiwen
*@Copyright:layui.com
*/

layui.define(['layer'],function(exports){
	var layer = layui.layer;
	
var car = {
  init : function(){
  		var uls = document.getElementById('list-cont').getElementsByTagName('ul');//每一行
  		var inputs = document.getElementsByName('o')
  		var checkInputs = document.getElementsByClassName('check'); // 所有勾选框
      var checkAll = document.getElementsByClassName('check-all'); //全选框
      var SelectedPieces = document.getElementsByClassName('Selected-pieces')[0];//总件数
      var piecesTotal = document.getElementsByClassName('pieces-total')[0];//总价
      var batchdeletion = document.getElementsByClassName('batch-deletion')[0]//批量删除按钮
      //计算
      function getTotal(){
          var seleted = 0,price = 0;
          for(var i = 0; i < uls.length;i++){
        			if(uls[i].getElementsByTagName('input')[0].checked){
                seleted += parseInt(uls[i].getElementsByClassName('Quantity-input')[0].value);
                price += parseFloat(uls[i].getElementsByClassName('sum')[0].innerHTML);
              }
      		}
          SelectedPieces.innerHTML = seleted;
          piecesTotal.innerHTML = '￥' + price.toFixed(2);
      }

      function fn1(){
        alert(1)
      }
      // 小计
      function getSubTotal(ul){
        var unitprice = parseFloat(ul.getElementsByClassName('th-su')[0].innerHTML);
        var count = parseInt(ul.getElementsByClassName('Quantity-input')[0].value);
        var SubTotal = parseFloat(unitprice*count)
        ul.getElementsByClassName('sum')[0].innerHTML = SubTotal.toFixed(2);
      }

      for(var i = 0;i < checkInputs.length;i++){
        checkInputs[i].onclick = function(){
          if(this.className === 'check-all check'){
            for(var j = 0;j < checkInputs.length; j++){
              checkInputs[j].checked = this.checked; 
            }
          }
          if(this.checked == false){
            for(var k = 0;k < checkAll.length;k++){
              checkAll[k].checked = false;
            }
          }
          getTotal()
        }
      }
      for(var i = 0; i < uls.length;i++){
        uls[i].onclick = function(e){
          e = e || window.event;
          var id=this.id;
          var el = e.srcElement;
          var cls = el.className;
       var input = this.getElementsByClassName('Quantity-input')[0];
          var less = this.getElementsByClassName('less')[0];
          var   val = parseInt(input.value);
          var that = this;
          switch(cls){
            case 'add layui-btn':
              input.value = val + 1,
              getSubTotal(this)
              break;
            case 'less layui-btn':
              if(val > 1){
                input.value = val - 1;
              }
              getSubTotal(this)
              break;
            case 'dele-btn':
              layer.confirm('你确定要删除吗',{
                yes:function(index,layero){
                	$.ajax({
            			url:"delcart/"+id+"",
            			type:"delete",
            			async:true,
            			success:function(data){
            				if(data=='1'){
            					alert("删除成功")
            				}else alert("删除失败")
            			}
            		});
                  layer.close(index)	
                  that.parentNode.removeChild(that);
                }
              })
              
              break;
          }
          getTotal()
        }
      }
      batchdeletion.onclick = function(){
        if(SelectedPieces.innerHTML != 0){
          layer.confirm('你确定要删除吗',{
            yes:function(index,layero){
              layer.close(index)
              for(var i = 0;i < uls.length;i++){
                var input = uls[i].getElementsByTagName('input')[0];
                if(input.checked){
                  uls[i].parentNode.removeChild(uls[i]); 
                  i--;
                }
              }
              getTotal() 
            }

          })
        }else{
          layer.msg('请选择商品')
        }
        
      }
        checkAll[0].checked = true;
        checkAll[0].onclick();
       
        
        $('#layui-btn').click(function(){
        	var list=new Array();
         var totalMoney=$('.pieces-total').text().substring(1);
       	 for(var j = 0;j < checkInputs.length-1; j++){
       	   	var object = {}
                if(checkInputs[j].checked == true){
                	object['productId'] = uls[j].id
                	object['productCount'] = uls[j].getElementsByClassName('Quantity-input')[0].value
                	list.push(object);
                	list=list;
                }
              
              }
       	$.ajax({
     		url:"balance?totalMoney="+totalMoney,
     		data:JSON.stringify(list),
     		type:"post",
     		// traditional: true,//这里设为true就可以了
     		
     		dataType:"json",
     		contentType : 'application/json;charset=utf-8',
     		success:function(data){
     			console.log(data)
     			if(data=="111"){
     				//此处注意 /是从绝对路径下请求，不带是从相对路径下请求
     				window.location.href = "/bookstore/order1/orderPay";
     			}else if(data.equals("000")){
     				console.log(data);
     				window.location.href = "/login";
     			}
     		},
     		fail:function(){
     			console.log("test")
     		}
     	});
       })
        
  	  }  	

  }


  exports('car',car)
}); 
