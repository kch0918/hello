$(window).ready(function() {

    $(".menu").click(function() {
        var $this = $(this);
        var submenu = $(this).next(".hide");

        if (submenu.is(":visible")) {
            submenu.slideUp();
            $this.removeClass("on");
        } else {
            submenu.slideDown();
            $this.addClass("on");
        }
    });

    selectUlInit();

})

 // $(".select").each(function() {
 //        var $this = $(this);
 //        var p = $this.find(".select-p");
 //        var ul = $this.find(".select-ul");
 //        var act = ul.find(".active").text();
 //        if (act != "") {
 //            p.text(ul.find(".active").text());
 //        }

 //        p.unbind("click").bind("click", function() {
 //            var chk = ul.css("display");
 //            if (chk == "none") {
 //                $this.addClass("on");
 //            } else {
 //                $this.removeClass("on");
 //            }
 //            ul.slideToggle();
 //        })
 //        ul.find("li").click(function() {
 //            if (typeof $(this)[0].dataset.eng_nm !== 'undefined') {
 //                if (location.href.indexOf("portfolio") > -1) {
 //                    document.querySelector("#eng_cate").value = $(this)[0].dataset.eng_nm;;
 //                } else {
 //                    document.querySelector("#eng_cate2").value = $(this)[0].dataset.eng_nm;
 //                }
 //            }
 //            ul.find("li").removeClass("active");
 //            $(this).addClass("active");
 //            p.text(ul.find(".active").text());
 //            ul.slideUp();
 //        })
 //    })
 
  $(document).on('click','.selectedOption', function () {
    var $this = $(this);
     var chk =  $(this).next('ul').css('display');
      $('.select-box').removeClass('on');
     if(chk == "none"){
         $this.parents(".select-box").addClass('on');   
     }else{
         $this.parents(".select-box").removeClass('on');
     }
    $(this).next('ul').slideToggle(200);
    $('.selectedOption').not(this).next('ul').hide();
});
$('body').on('click', function (e) {
    var chk = $(".select-box ul").css('display');
    if(!$(e.target).hasClass("selectedOption")) {
        $(".select-box").removeClass('on');       
        $(".select-box").find('ul').hide();
    }

});

 $(document).on('click','.select-box ul li', function () {
    var $this = $(this);
    var selectedLI = $(this).text();
    var select = $this.parents(".select-box").find("select");
    var ind = $this.index();
    
    select.find("option").eq(ind).attr("selected","selected");
    $(this).parent().prev('.selectedOption').text(selectedLI);
    $this.parents(".select-box").removeClass('on');
    $(this).parent('ul').hide();
    select.trigger("onchange");
    
});

$('.select-box').show();
$('select').hide();

function selectUlInit() {
    $('select').each(function (index, element) {
        var this_id = $(this).attr("id");
        var title = $(this).attr("de-data");
        $(this).wrap("<div class='select-box'></div>");
        $(this).parent(".select-box").prepend("<div class='selectedOption "+this_id+"'></div><ul class='select-ul "+this_id+"_ul'></ul>")
        
        $(element).each(function (idx, elm) {
            $('option', elm).each(function (id, el) {
                $('.select-box ul:last').append('<li>' + el.text + '</li>');
            });
            $('.select-box ul').hide();
            $('.makeMeUl').children('div.selectedOption').text("select");
        });
        $('.select-box:last').children('div.selectedOption').text(title);
    });
   
}
function lastDay(val) {
	 var d = new Date();
	 d.setTime(new Date().getTime() - (Number(val) * 24 * 60 * 60 * 1000));
	 return getDateStr(d);
}
function lastMonth() {
	  var d = new Date()
	var monthOfYear = d.getMonth()
	d.setMonth(monthOfYear - 1)
	return getDateStr(d)
}
function lastMonthParam(val) {
	var d = new Date()
	var monthOfYear = d.getMonth()
	d.setMonth(monthOfYear - Number(val))
	return getDateStr(d)
}
function setDateBySearch(val) {
	if(val == "all")
	{
		$("#start_date").val("1990-01-01");
	}
	else
	{
		if(val == "7" || val == "15")
		{
			$("#start_date").val(lastDay(val));
		}
		else
		{
			$("#start_date").val(lastMonthParam(val));
		}
	}
	$("#finish_date").val(getNow_date());
}
function getDateStr(myDate){
	var month = new String(myDate.getMonth()+1);
	var day = new String(myDate.getDate());
	if(month.length == 1){ 
		  month = "0" + month; 
		} 
	if(day.length == 1){ 
		  day = "0" + day; 
		} 
	return (myDate.getFullYear() + '-' + month + '-' + day)
}

function getNow_date()
{
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 

	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 
	return year + "-" + month + "-" + day;
}
$(document).ready(function() {

    $("#start_date").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: "yy-mm-dd",
    });
    $("#finish_date").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: "yy-mm-dd"
    });
    $("#start_date").val("1990-01-01");
    $("#finish_date").val(getNow_date());

    // cover select//

    $(document).on('click', '.fix_select_box label', function() {

        if ($(this).hasClass('on')) {
            $('.fix_select_box').addClass('visi');
            $(this).addClass('clikable');
        } else {

            $('.fix_select_box label').removeClass();
            $(this).addClass('on');
            $('.fix_select_box').removeClass('visi');
        }
    })

    $(document).on('click', '.clikable', function() {
        $('.fix_select_box').removeClass('visi');
        $('.fix_select_box label').removeClass('clikable');
    })

});
// 파일명 추출
$(document).ready(function() {
    var fileTarget = $('.upload-hidden');
    $.each(fileTarget, function(index, item){
        $(this).on('change', function() {
        if (window.FileReader) {
            filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        var upName = $('.upload-name');
        upName.eq(index).val(filename);
     });
   });
});





