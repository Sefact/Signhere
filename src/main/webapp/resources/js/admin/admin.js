/**
 *
 */
function postAjax(jobCode, clientData, fn, header){
   /* Step 1*/
   let ajax = new XMLHttpRequest();
      
   /* Step2 */
   ajax.onreadystatechange = function(){
      if(ajax.readyState == 4 && ajax.status == 200){
         /* Step 5 */
         window[fn](JSON.parse(ajax.responseText));
      }
   };
   /* Step 3 */
   ajax.open("POST", jobCode);
   /* Step 4 */
   //ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   ajax.setRequestHeader("Content-type", header);
   ajax.send(clientData);
}

function getAjax(jobCode, clientData, fn){
   /* Step 1*/
   let ajax = new XMLHttpRequest();
   
   /* Step2 */
   ajax.onreadystatechange = function(){
      if(ajax.readyState == 4 && ajax.status == 200){
         /* Step 5 */
         window[fn](JSON.parse(ajax.responseText));
      }
   };
   
   /* Step 3 */
   if(clientData != ""){ jobCode += "?" + clientData; }
   ajax.open("GET", jobCode);
   /* Step 4 */
   ajax.send();

function makeForm(action, method, name = null) {
	let form = document.createElement("form");	
	if(name != null){
		form.setAttribute("name", name);
	}
	form.setAttribute("action", action);
	form.setAttribute("method", method);
	
	return form;
}


//직원검색
function empSearch() {
	
	let form = document.createElement("form");
	
	empName= document.getElementsByName("empName")[0];
	empGrade= document.getElementsByName("empGrade")[0];
	empDepartment= document.getElementsByName("empDepartment")[0];

	form.submit();
}


// 직원추가 버튼 시 활성화 Modal
$('#theModal').on('show.bs.modal', function (e) {
    var button = $(e.relatedTarget);
    //var modal = $(this);
    modal.find('.modal-body').load(button.attr("href"));
	
	$.ajax({
		type : 'get',
		url : 'src/main/wepapp/WEB-INF/views/admin/admin.jsp',
		dataType : 'List',
		success : function data(data){
			alert(List.stringify(data))
		},
		error : function(){
			alert("정보 불러오기를 실패");
		}
	})
});


// 활성화된 직원추가 Modal에서 값을 입력한 후, 추가버튼 클릭 시 발생
function addEmployee() {
	let newEmpId = document.getElementsByName("newEmpId")[0];
	let newEmpName = document.getElementsByName("newEmpName")[0];
	let empGrade = document.getElementsByName("empGrade")[0];
	let empDepartment = document.getElementsByName("empDepartment")[0];
	let form = makeForm("addEmployee","POST");
	
	form.setAttribute("newEmpId", newEmpId.value);
	form.setAttribute("newEmpName", newEmpName.value);
	form.setAttribute("empGrade", empGrade.value);
	form.setAttribute("empDepartment", empDepartment.value);
	
	form.submit();
}

//ID 중복체크 //ID 조건은 입사년도 4 + 월 2 + "001~"
function empIdDupCheck() {
	let empIdDupCheck = document.getElementsByName("newEmpId")[0];
	
			
		
	}	
		
//ID 유효성검사
/* function isValidateCheck(type, word) {
	let result;
		const codeComp =/^[a-z]{1}[0-9|a-z|A-Z]{7,11}$/g;
  		const pwdComp1= /[a-z]/g;
  		const pwdComp2= /[A-Z]/g;
 		const pwdComp3= /[0-9]/g;
		const pwdComp4= /[!@#$%^&*]/g;
   
   if(type == 1){
      result = codeComp.test(word); 
   }else if(type == 2){
      let count = 0;
		count += pwdComp1.test(word)? 1:0;
		count += pwdComp2.test(word)? 1:0;
		count += pwdComp3.test(word)? 1:0;
		count += pwdComp4.test(word)? 1:0;
		
		result = (count >= 3)? true:false;
      }
   return result;
}*/



