#!/bin/bash
###############################################################
##						KOMedia
###############################################################
## Author: fcamachos
# Order your pictures by date

## Folder where script is stored. For more info visit: https://stackoverflow.com/a/4774063
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
###############################################################
## 						Language Settings
###############################################################
## Search your system language and stores it in a variable
lang=$(locale | grep LANGUAGE | cut -d= -f2 | cut -d_ -f1)
## You can add your language following the rules in the next method
case "$lang" in
	es)			
		title="KOMedia"										
		cancelMsg="Proceso cancelado por el usuario"        
        noSelectionMsg="Ninguna opción seleccionada"
        errorMsg="Error inesperado"
        chkMsg="Selecciona las tareas a realizar: (Puedes seleccionar más de una opción)"
        chkOp1="Etiquetar los archivos"
        chkOp2="Mover los archivos"
        Freport="Proceso terminado. Archivos analizados: "
        tagMsg="Etiquetando fechas"
        moveMsg="Moviendo archivos"
        advice="Si hay archivos que no se movieron, prueba cambiar manualmente el nombre por la fecha de captura"
		;; 
	*)	## The Default Language is English
		title="KOMedia"										
		cancelMsg="Process cancelled by user"
        noSelectionMsg="No option selected"
        errorMsg="Unespected error"
        chkMsg="Select your choices: (Can choose more than one)"
        chkOp1="Tag the media"
        chkOp2="Move the media"
        Freport="Process completed. Analized files: "
        tagMsg="Tagging dates"
        moveMsg="Moving files"
        advice="If there are files that were not moved, try manually rename them by capture date"
		;;
esac	
###############################################################
##						PopUp Settings
###############################################################
## You can modify this changing the icon to a one you like
## Also you can modify the last number to control the time the popup is displayed
snd_Cancel(){
    kdialog --icon "$SCRIPTPATH"/icons/tree.png --title "$title" --passivepopup \
    "$cancelMsg" 4
}
#Warns that user didn't select any option
snd_NoSelection(){
    kdialog --icon "$SCRIPTPATH"/icons/tree.png --title "$title" --passivepopup \
    "$noSelectionMsg" 4
}
#inform about unespected errors
snd_Error(){
    kdialog --icon "$SCRIPTPATH"/icons/tree.png --title "$title" --passivepopup \
    "$errorMsg" 4
}
#send "tagging" popup
snd_Tag(){
    kdialog --icon "$SCRIPTPATH"/icons/tree.png --title "$title" --passivepopup \
    "$tagMsg" 2
}
#send "moving" popup
snd_Move(){
    kdialog --icon "$SCRIPTPATH"/icons/tree.png --title "$title" --passivepopup \
    "$moveMsg" 2
}
###############################################################
##						Execution Settings
###############################################################
#if you're familiar with the exiftool, you can personalize this
doSelection(){
    if [ $(expr length "$choice") != 0 ]; then
		for result in $choice
			do
				if [ $result = '"1"' ]; then
                    echo "tagging"
                    snd_Tag
                    tagLog=$( exiftool -v -r -if 'not defined $DateTimeOriginal' '-DateTimeOriginal<GPSDateTime' -execute -if 'not defined $DateTimeOriginal' '-DateTimeOriginal<MediaCreateDate' -execute -if 'not defined $DateTimeOriginal' '-DateTimeOriginal<filename' -execute -if 'not defined $DateTimeOriginal' '-DateTimeOriginal<${filename;$_=substr($_,0,13)} 00:00' -common_args -overwrite_original "$DIR" )					
				fi;
				if [ $result = '"2"' ]; then
                    echo "moving"
                    snd_Move
                    #you can personalize the output directory here
                    moveLog=$( exiftool -v -r -progress '-Directory<DateTimeOriginal' -d './KOMedia/%Y%%-c/%m' "$DIR" )					
				fi;
			done;
	else
		snd_NoSelection;
	fi;
}
###############################################################
##						Execution Start
###############################################################
#Get the directory
DIR=$(kdialog --icon "$SCRIPTPATH"/icons/tree.png --getexistingdirectory $HOME)
if [ $? = 0 ]; then
    #Get the total of files to analyze
    TotalFiles=$( find "$DIR" -type f | wc -l )
    cd "$DIR"
    #if return = 1 then cancel all
    echo $DIR 
    choice=$(kdialog --icon "$SCRIPTPATH"/icons/tree.png --title "$title" --checklist "$chkMsg" 1 "$chkOp1" on 2 "$chkOp2" off)
    case "$?" in
        0)  doSelection 
            kdialog --icon "$SCRIPTPATH"/icons/tree.png --title "$title" --msgbox "$Freport $TotalFiles \n $advice " "$moveLog"
            ;;
        1)  snd_Cancel  ;;
        *)  snd_Error   ;;
    esac
    
else
    snd_Cancel
fi
