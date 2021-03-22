<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>編輯食譜</title>    
</head>
<body>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
    #all{
		width: 1500px;
		height: auto;
		margin: 50px auto;
		/* background-color: rgb(243, 241, 240); */

	}

    #left{
		width: 800px;
		float: left;
		/* background-color: brown; */
		text-align: center;
	}
    #right{
		width: 300px;

		float: left;
		/* background-color: rgb(42, 165, 144); */
        

	}
    #text{
        margin-top: 10px;
        margin-bottom: 30px;
        border: 2px solid black;
        border-radius: 4px;
        width:400px;
        height: 40px;
    }
    #ta{
        margin-top: 10px;
        border: 2px solid black;
        border-radius: 4px;
        width:500px;
        height:200px;
    }
    #size{
    	margin-left:-20px;
 		width:150px;
 		display:inline-block;
    }
    #fontSize{
        margin-left: 120px;
       
    }
    #cooktime{
    	display:inline-block;
        margin-left: 100px;
 		width:150px;
        margin-bottom: 30px;
    }
    #ingredients{
        
        border-radius: 4px;
        width: 520px;
        height: auto;
        text-align:center;
        margin-left: 150px;
        margin-bottom: 50px;
    }
    #step{
        box-shadow:3px 3px 5px 6px #cccccc; 
        border-radius: 4px;
        width: 800px;
        text-align:center;
        margin-left: 0px;
        margin-bottom: 50px;
        margin-top:30px;
        padding:5px;
    }

    button{
        background-color:antiquewhite;
        width: 120px;
        height: 50px;
        cursor: pointer; 
        
    }
    button:hover{
        border-radius: 30px;
	    background-color: rgba(255,255,255,.3); 
	    transition: all 0.5s;
    }
    #submitbtn{
        background-color: rgb(245, 98, 98);
    }

    #labelUpload{
        cursor: pointer;
    }

    textarea{
    	border: solid;
        border-radius: 5px;
        resize: none;
    }

    img{
        cursor: pointer;
        border: solid;
        border-radius: 5px;
    }
    img.imgRemove{
    	border:0px;
    }
    img.ingredientsRemove{
  		border: 0px;
  	}
    textarea.textbox{
    	margin-left: 20px;
    	width:450px;
    	height:150px;
    }
    #showIngredient{
    	 box-shadow:3px 3px 5px 6px #cccccc; 
    	 margin-bottom:50px;
    }
    #ingTable{
    	width:780px;
    }
    #calculate{
    	width:100%;
    }
    #calbtn{
    	margin-top:50px;
    	margin-left:50px;
    }
    
    #index{
        display: inline-block;
        vertical-align: top;
        margin-left: 10px;
        margin-right: 20px;
        margin-top: 80px;
        font-family:fantasy;
        font-size: x-large;
    }
    img.stepPic{
    	vertical-align: top;
    	width:200px;
    	height:150px;
    }
    label.labelPic{
    	vertical-align: top;
    	width:200px;
    	height:150px;
    }
    div.perStep{
    	width:100%;
    }

    </style>
    
<h2 class="page-title text-center" style='color:black;'>Add Recipe</h2><hr>

<form method="post" action="<%=request.getContextPath() %>/front_end/recipe/rec.do" enctype="multipart/form-data">
    
    <div id="all">
        <div id="left">
             <font size="+2">標題</font><br>
             <input type="text" id="text" name="title" required="required" placeholder="請填寫食譜標題" ><br>
             <font size="+2">請上傳圖片</font><br>
             <label id="labelUpload">
                 <input id="myFile" type="file" name="recipePic" required="required" style="display: none;">
                <img id="img" src="<%=request.getContextPath()%>/resource/images/upload.png" alt="" width="250">
             </label><br><br><br>
             
             <font size="+2">食譜簡介</font><br>
             <textarea  class='intro' name="intro" id="ta"  required="required" placeholder="輸入食譜描述(最多200字)" maxlength="200"></textarea><br><br>
             <font size="+2">份量(人份)</font> <font size="+2" id="fontSize">烹調時間(分鐘)</font><br><br>
             <select name="size" id="size">
                 <option value="-1">未設定</option>
                 <option value="2">2人份</option>
                 <option value="4">4人份</option>
                 <option value="6">6人份</option>
                 <option value="8">8人份</option>
             </select>
             <select name="cooktime" id="cooktime">
                <option value="-1">未設定</option>
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="25">25</option>
                <option value="30">30+</option>
            </select><br>
            <font size="+2">食材</font><br><br>
             <div id="calculate"></div>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
   				請選擇食材
  			</button><br><br>
  			
  			
  			<div id="showIngredient">
  			
  			</div>
  			
  		

             
            <font size="+2">步驟</font><br><br>
            <input type="button" id="addBtn" value="添加步驟">
            <div id="step">

                
            </div>

        </div>
        <div id="right">
            <input type="submit" value="發布食譜"><br><br>
            <input type="hidden" name="action" value="addRecipe">
            <input type="hidden" name="memID" value="${memVO.memID}">

            
           


        </div>
    </div>
    
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width:1000px">
      <div class="modal-content" background-color="red">
        <div class="modal-header">
          <h2 class="modal-title" id="exampleModalLabel">請選擇食材</h2>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <jsp:include page="/front_end/recipe/listComforRec.jsp" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</form>
    <script type="text/javascript">
   
    $("#showIngredient").on("click",".ingredientsRemove",function(){
		$(this).parents("tr").remove();
		calculate();
		
	});
    
    
        function init(){
        let myFile = document.getElementById("myFile"); //上傳檔案鈕的資料
        
        myFile.addEventListener('change', function(e) {
        
        let files = e.target.files;

        if(files){

            for(let i = 0; i < files.length; i++){
                let file = files[i];

                if(file.type.indexOf('image') > -1){
                    

                    let reader = new FileReader();
                    reader.addEventListener('load',function(e){
                        let result = e.target.result;
                        console.log(result);
     
                        let img = document.getElementById('img');

                        img.setAttribute('src',result);
 
                    });
                    reader.readAsDataURL(file);
                }else{
                    alert('別亂傳，請上傳圖片檔!');
                }
            }
        }

        });
    }

    $("body").on("click",".imgRemove",function(){
        $(this).parent("div.perStep").remove();
        var count = 1;
        $(".indexClass").each(function(){
            $(this).text(count);
            count++;
        });
        
    });

    $("#step").on("change","input[type='file']",function(e){
        let file = e.target.files[0];
        let img = $(this).parent().children("img")[0];
        console.log(img);

                if(file.type.indexOf('image') > -1){
                    

                    let reader = new FileReader();
                    reader.addEventListener('load',function(e){
                        let result = e.target.result;
                        
                        img.src=result; 
                    });
                    reader.readAsDataURL(file);
                }else{
                    alert('別亂傳，請上傳圖片檔!');
                }
        });
	
    $("#addBtn").click(function(){
    	addBox();
    	 var count = 1;
         $(".indexClass").each(function(){
             $(this).text(count);
             count++;
         });
    });
        
    var count = 1000;
    var count2 = 0;
    var count3 = 3000;
    var indexCount = 1;
	function addBox(){
            var div = document.createElement('div');
           
            var label = document.createElement("label");
            
            var file = document.createElement("input");
            var hidden = document.createElement("input");
            hidden.setAttribute('type','hidden');
            hidden.setAttribute('name','fileName');
            hidden.setAttribute('value','stepPic'+count);
            file.setAttribute('id','file');
            file.setAttribute('type','file');
            file.setAttribute('style','display:none;');
            var img = document.createElement("img");
            var br = document.createElement("br");
            img.setAttribute('id','img'+count);
            img.setAttribute('class','stepPic');
            img.setAttribute('src','<%=request.getContextPath()%>/resource/images/upload.png');
            file.setAttribute('name','stepPic'+count);
            var textBox = document.createElement("textarea");
            var imgRemove = document.createElement("img");
            imgRemove.setAttribute('src','<%=request.getContextPath()%>/resource/images/trash.png');
            imgRemove.setAttribute('class','imgRemove');
            textBox.setAttribute('cols',30);
            textBox.setAttribute('rows',10);
            textBox.setAttribute('class','textbox');
            textBox.setAttribute('name','stepText');
            count++;
            count2++;
            imgRemove.setAttribute('onclick','remove()');
            count3++;
            div.setAttribute('id',count2);
            div.setAttribute('class',"perStep");
            label.setAttribute('id',count);
            label.setAttribute('class','labelPic');
            textBox.id = count3;
            var index = document.createElement('div');
            index.setAttribute('id','index');
            index.setAttribute('class','indexClass');
            index.innerText = indexCount;
            indexCount++;
            var left = document.getElementById('left');
            document.getElementById("step").appendChild(div);
            document.getElementById(count2).appendChild(index);
            document.getElementById(count2).appendChild(label);
            document.getElementById(count).appendChild(file);
            document.getElementById(count).appendChild(hidden);
            document.getElementById(count).appendChild(img);
            document.getElementById(count2).appendChild(textBox);
            document.getElementById(count2).appendChild(imgRemove);
            // if(count>=15){
            // var btn = document.getElementById('btn');
            //     btn.setAttribute('disabled','disabled');
            // }
            console.log("New elements id : " + textBox.id); 
        }

    $( function() {
    $( "#step" ).sortable({
    	 cursor:"crosshair",
         opacity:0.6,
         update:function(){
             var count = 1;
             $(".indexClass").each(function(){
                 $(this).text(count);
                 count++;
             });
         }
    });
    $( "#step" ).disableSelection();
  } );
    
    
    
    $("#showIngredient").on("change","input[name='ingNums']",function(){
    	var ingNumArr = new Array();
    	$(".ingNums").each(function(){
    		var ingNum = parseInt($(this).val());
    		ingNumArr.push(ingNum);
    	});
    	var calArr = new Array();
    	$(".cal").each(function(){
    		var cal = parseFloat($(this).text());
    		calArr.push(cal);
    	});
    	var carbArr = new Array();
		$(".carb").each(function(){
			var carb = parseFloat($(this).text());
			
			carbArr.push(carb);
		});
		var proArr = new Array();
		$(".pro").each(function(){
			var pro = parseFloat($(this).text());
			
			proArr.push(pro);
		});
		var fatArr = new Array();
		$(".fat").each(function(){
			var fat = parseFloat($(this).text());
			
			fatArr.push(fat);
		});
    	
		//個別加總
    	var totalCal = 0;
		var totalCarb = 0;
		var totalPro = 0;
		var totalFat = 0;
    	
    	for(let i = 0 ; i<ingNumArr.length; i++){
    		if(isNaN(ingNumArr[i])){
    			totalCal += calArr[i];
    			totalCarb += carbArr[i];
    			totalPro += proArr[i];
    			totalFat += fatArr[i];
    		}else{
    			totalCal += (calArr[i] * ingNumArr[i]); 
    			totalCarb += (carbArr[i] * ingNumArr[i]); 
    			totalPro += (proArr[i] * ingNumArr[i]); 
    			totalFat += (fatArr[i] * ingNumArr[i]); 
    		}
    	}
    	var totalCal2 = totalCal.toFixed(2);
    	var totalCarb2 = totalCarb.toFixed(2);
    	var totalPro2 = totalPro.toFixed(2);
    	var totalFat2 = totalFat.toFixed(2);
    	
    	var html ="";
		html += "<font id='showTotalCal' size='5' face='Arial' color='red'><b>總熱量為:( "+totalCal2+" )卡路里</b></font><br>";
		html += "<input type='hidden' name='totalCal' value='"+ totalCal2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總碳水化合物為:( "+totalCarb2+" )克</font><br>";
		html += "<input type='hidden' name='totalCarb' value='"+ totalCarb2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總蛋白質為:( "+totalPro2+" )克</font><br>";
		html += "<input type='hidden' name='totalPro' value='"+ totalPro2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總脂肪為:( "+totalFat2+" )克</font>";
		html += "<input type='hidden' name='totalFat' value='"+ totalFat2 +"'>";
	
		$("#calculate").html(html);
    });
    
    
    
    function calculate(){
    	
    	//抓取熱量
    	var calArr = new Array();
    	$(".cal").each(function(){
    		var cal = parseFloat($(this).text());
    		
    		
    		calArr.push(cal);
    	});
//     	console.log(calArr);
		var totalCal = 0;
		for(let i = 0;i<calArr.length;i++){
			totalCal+=calArr[i];
		}
		var totalCal2 = totalCal.toFixed(2);
		
		//抓取碳水
		var carbArr = new Array();
		$(".carb").each(function(){
			var carb = parseFloat($(this).text());
			
			carbArr.push(carb);
		});
		var totalCarb = 0;
		for(let i = 0 ; i <carbArr.length;i++){
			totalCarb+=carbArr[i];			
		}
		var totalCarb2 = totalCarb.toFixed(2);
		//抓取蛋白質
		var proArr = new Array();
		$(".pro").each(function(){
			var pro = parseFloat($(this).text());
			
			proArr.push(pro);
		});
		var totalPro = 0;
		for(let i = 0; i<proArr.length;i++){
			totalPro += proArr[i];
		}
		var totalPro2 = totalPro.toFixed(2);
		//抓取脂質
		var fatArr = new Array();
		$(".fat").each(function(){
			var fat = parseFloat($(this).text());
			
			fatArr.push(fat);
		});
		var totalFat = 0 ;
		for(let i = 0 ; i < fatArr.length ;i++){
			totalFat += fatArr[i];
		}
		var totalFat2 = totalFat.toFixed(2);
		var html ="";
		html += "<font id='showTotalCal' size='5' face='Arial' color='red'><b>總熱量為:( "+totalCal2+" )卡路里</b></font><br>";
		html += "<input type='hidden' name='totalCal' value='"+ totalCal2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總碳水化合物為:( "+totalCarb2+" )克</font><br>";
		html += "<input type='hidden' name='totalCarb' value='"+ totalCarb2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總蛋白質為:( "+totalPro2+" )克</font><br>";
		html += "<input type='hidden' name='totalPro' value='"+ totalPro2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總脂肪為:( "+totalFat2+" )克</font>";
		html += "<input type='hidden' name='totalFat' value='"+ totalFat2 +"'>";
		
		$("#calculate").html(html);
    }    
        
        window.onload = function(){
    		addBox();
    		init();
    	}    
    </script>
    
</body>
</html>