macroScript SketchupImporterHelper
category: "Juninho"
tooltip: "Sketchup Importer Helper"
Icon:#("SIH",1)
(
	on execute do (
		fileIn ((getDir #userScripts)+"\\Juninho\\SketchupImporterHelper.ms")
	)
)
messageBox "Sketchup Importer Helper has now been installed!\n\nAdding the script to a toolbar:\nCustomize > Customize User Interface > Toolbars\nUnder category \"Juninho\", drag the \"Sketchup Importer Helper\" onto any toobar." beep:False title:"Sketchup Importer Helper Installation"
colorman.reInitIcons()