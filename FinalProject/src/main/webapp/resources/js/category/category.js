function toggleCategory() {
    var categoryToggle = document.querySelector(".categoryToggle");
    var categoryTable = document.querySelector(".categotyTable");

   
        if (categoryTable.style.display === "none") {
            categoryTable.style.display = "block";
            categoryToggle.innerText = "카테고리 닫기";
        } else {
            categoryTable.style.display = "none";
            categoryToggle.innerText = "카테고리 열기";
        }
};
  
$(document).ready(function(){
    var activeCategoryNav1 = sessionStorage.getItem('activeCategoryNav1');
    var activeCategoryNav2 = sessionStorage.getItem('activeCategoryNav2');
    var activeCategoryNav3 = sessionStorage.getItem('activeCategoryNav3');
    var activeCategoryNav4 = sessionStorage.getItem('activeCategoryNav4');

    applyActiveClass('.categoryList1', activeCategoryNav1);
    applyActiveClass('.categoryList2', activeCategoryNav2);
    applyActiveClass('.categoryList3', activeCategoryNav3);
    applyActiveClass('.categoryList4', activeCategoryNav4);

	var urlParams = new URLSearchParams(window.location.search);
	var recipeTitle_main = urlParams.get('recipeTitle_main');
	    
	    if (recipeTitle_main) {
	        $(".categoryList1 a").each(function() {
	            if ($(this).text() === recipeTitle_main) {
	                $(this).addClass("active");
	            } else {
	                $(this).removeClass("active");
	            }
	        });
	    }

    function applyActiveClass(categoryListClass, activeCategoryNav){
        if(activeCategoryNav){
            $(categoryListClass + " a").removeClass("active");
            $(categoryListClass + " a:contains('" + activeCategoryNav + "')").addClass("active");
        } else {
            $(categoryListClass + " a:first").addClass("active");
        }
    }

    $(".categoryContain a").click(function(){
        var clickedLink = $(this);
        var categoryList = clickedLink.parent();
        var categoryListClass = "." + categoryList.attr('class');

        categoryList.find("a").removeClass("active");
        clickedLink.addClass("active");

        var activeNavText = clickedLink.text();
        sessionStorage.setItem('activeCategoryNav'+ categoryListClass.charAt(categoryListClass.length-1), activeNavText);

        filterList();
    });

    function filterList() {
        var categoryList1Value = $(".categoryList1 .active").text();
        var categoryList2Value = $(".categoryList2 .active").text();
        var categoryList3Value = $(".categoryList3 .active").text();
        var categoryList4Value = $(".categoryList4 .active").text();

        $(".category_li").each(function() {
            var categoryListfoodValue = $(this).find(".categoryListfood").val();
            var categoryListsituationValue = $(this).find(".categoryListsituation").val();
            var categoryListhowValue = $(this).find(".categoryListhow").val();
            var categoryListingredientValue = $(this).find(".categoryListingredient").val();

            if ((categoryList1Value == categoryListfoodValue || categoryList1Value == "전체") &&
                (categoryList2Value == categoryListsituationValue || categoryList2Value == "전체") &&
                (categoryList3Value == categoryListhowValue || categoryList3Value == "전체") &&
                (categoryList4Value == categoryListingredientValue || categoryList4Value == "전체")) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }

    filterList();
});