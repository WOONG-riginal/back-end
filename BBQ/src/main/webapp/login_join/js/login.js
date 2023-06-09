$("#all").click(function() {
	if($("#all").is(":checked")) $("input[name=chk]").prop("checked", true);
	else $("input[name=chk]").prop("checked", false);
	if($("#all").is(":checked")) $("input[name=agree]").prop("checked", true);
	else $("input[name=agree]").prop("checked", false);
});

$(".left input").click(function() {
	var total = $("input[name=chk]").length+$("input[name=agree]").length;
	var checked = $("input[name=chk]:checked").length+$("input[name=agree]:checked").length;

	if(total != checked) $("#all").prop("checked", false);
	else $("#all").prop("checked", true); 
});

$("input").click(function() {
	var agrtotal = $("input[name=chk]").length;
	var agrchecked = $("input[name=chk]:checked").length;
	
	if(agrtotal==agrchecked) {
		$(".submit").css({display:"block"});
		$(".no_ess").css({display:"none"});
	}else{
		$(".submit").css({display:"none"});
		$(".no_ess").css({display:"block"});
	}
});

  var idInput = document.getElementById("id");
  var pwInput = document.getElementById("pw");
  var idError = document.getElementById("idError");
  var pwError = document.getElementById("pwError");
  var idPattern = /^(?=.*[a-zA-Z])(?=.*\d)[A-Za-z\d]{6,16}$/;
  var pwPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
  idInput.addEventListener("focusout", validateId);
  pwInput.addEventListener("focusout", validatePw);

  function validateId() {
    var id = idInput.value;
    idError.innerHTML = "";

    if (!idPattern.test(id)) {
      idError.innerHTML = "아이디는 영문과 숫자 조합으로 6~16자리여야 합니다.";
      addErrorStyle(idError);
    } else {
      removeErrorStyle(idError);
    }
  }

  function validatePw() {
    var pw = pwInput.value;
    pwError.innerHTML = "";
    
    if (!pwPattern.test(pw)) {
      pwError.innerHTML = "비밀번호는 영문, 숫자, 특수문자 조합으로 8~20자리" + "<br>여야 합니다.";
      addErrorStyle(pwError);
    } else {
      removeErrorStyle(pwError);
    }
  }

   addErrorStyle(idError);
   function addErrorStyle(element) {
    var style = document.createElement("style");
    style.innerHTML = ".error { color: red; font-size: 14px; font-weight: bold;}";     
    element.appendChild(style);
  }

  function removeErrorStyle(element) {
    var style = element.querySelector("style");
    if (style) {
      element.removeChild(style);
    }
  }      
    
  var pw = document.getElementById("pw");
  var pwchk = document.getElementById("pwchk");
  var pwchkError = document.getElementById("pwchkError");

  pwchk.addEventListener("focusout",()=>{
	  pwchkError.innerHTML = "";

      if(pwchk.value != ""){
          if(pw.value != pwchk.value) {
              pwchkError.innerHTML = "비밀번호가 일치하지 않습니다.";
			  addErrorStyle(pwchkError);
    	  } else {
      	  	  removeErrorStyle(pwchkError);
          }
      }
  });

var namein=document.getElementById("name");
var tel=document.getElementById("phone");
var email=document.getElementById("email");

idInput.addEventListener("input", btnAvailble);
pwInput.addEventListener("input", btnAvailble);
pwchk.addEventListener("input", btnAvailble);
namein.addEventListener("input", btnAvailble);
tel.addEventListener("input", btnAvailble);
email.addEventListener("input", btnAvailble);

function btnAvailble() {
	var id = idInput.value;
    var pw = pwInput.value;

    if (!pwPattern.test(pw) || !idPattern.test(id) || pw!=pwchk.value || namein.value=="" || tel.value=="" || email.value=="") {
		$(".join-btn").css({display:"none"});
		$(".no_vali").css({display:"block"});
	}else{
		$(".join-btn").css({display:"block"});
		$(".no_vali").css({display:"none"});
	}
}
