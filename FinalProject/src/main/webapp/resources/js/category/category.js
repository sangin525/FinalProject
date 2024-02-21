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
    var recipeTitle = new URLSearchParams(window.location.search).get('recipeTitle');
    
    if(recipeTitle){ // mainCategory.jsp에서 클릭해서 들어왔을 경우
        $(".categoryList1 a").each(function() {
            if ($(this).text() == recipeTitle) {
                $(this).addClass('active');
            } else {
                $(this).removeClass('active');
            }
        });
    } else { // mainCategory.jsp를 통하지 않고 들어왔을 경우
        $(".categoryList1 a").first().addClass("active");
    }
    
    $(".categoryList2 a").first().addClass("active");
    $(".categoryList3 a").first().addClass("active");
    $(".categoryList4 a").first().addClass("active");

    $(".categoryContain a").click(function(){
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
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