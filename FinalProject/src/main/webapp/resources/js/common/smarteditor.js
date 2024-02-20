let oEditors = []
smartEditor = function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "editorTxt",
		sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2",
		htParams: { fOnBeforeUnload : function() {} }
	})
}
$(document).ready(function() {
smartEditor()
})
