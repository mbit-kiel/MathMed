#cs ----------------------------------------------------------------------------
 Author:         mbit
 Script Function:
	extracts proof dag from vampire output and converts it into a format readable by graphviz.
#ce ----------------------------------------------------------------------------
#include <array.au3>

Global $cfgfile = @ScriptDir & "\vampviz.ini"
Global $dot = IniRead($cfgfile, "vampviz", "graphviz_path", @ScriptDir & "\graphviz\bin\dot.exe")
Global $dotfmt = IniRead($cfgfile, "vampviz", "output_format", "pdf")
Global $line_split = IniRead($cfgfile, "vampviz", "line_split", "75")

If $cmdline[0] >= 1 Then
	$infile = $cmdline[1]
Else
	$infile = FileOpenDialog ("Open vampire proof output", @ScriptDir, "All (*.*)")
	If @error Then
		msgbox(48, "error", "error opening file")
		Exit
	EndIf
EndIf


$graphfilename = StringRegExpReplace($infile, '\.[^\."]+"?\Z', "_graph.gv")

$outfilename = StringRegExpReplace($infile, '\.[^\."]+"?\Z', "_graph." & $dotfmt)

$lines = FileRead($infile)
$outfile = FileOpen($graphfilename, 2)
$lines = StringRegExpReplace($lines, "([{}|<>])", "\\$1")
$aInferences = StringRegExp($lines, "\d+\. .+", 3)
FileWriteLine($outfile, "digraph G {")
for $Inference in $aInferences
	$Parts = StringRegExp($Inference, "(\d+)\. (.+) \[(.+?) ?((?:\d+,?)+)?\]\z", 1)
	$Conclusion = $Parts[0]
	$Formula = autowrap($Parts[1], $line_split)
	$Rule = $Parts[2]
	$label = "{{"&$Conclusion&"|"&$Rule&"}|"&$Formula&"}"
	FileWriteLine($outfile, @TAB & $Conclusion & ' [shape=record, label="'&$label&'"];')
	If UBound($Parts) = 4 Then
		$Premises = StringReplace($Parts[3], ",", "; ")
		If StringInStr($Premises, ";") Then $Premises = "{"& $Premises & "}"
		FileWriteLine($outfile, @TAB & $Premises & " -> " & $Conclusion & ";")
	EndIf
Next
FileWriteLine($outfile, "}")
FileClose($outfile)

;MsgBox(64, "info", $dot & " -T" & $dotfmt & " " & $graphfilename & " -o "& $outfilename)
RunWait($dot & " -T" & $dotfmt & " " & $graphfilename & " -o "& $outfilename)
if @error then msgbox(48, "error", "error running graphviz")


Func autowrap($text, $maxchars)
	Local $out = ""
	Local $aWords = StringSplit($text, " ")
	Local $lineLen = 0
	Local $lineWords = 0
	For $i = 1 to $aWords[0]
		If ($lineWords <> 0) And ($lineLen+StringLen($aWords[$i])+1 > $maxchars) Then
			$out &= "\n" & $aWords[$i] & " "
			$lineLen = StringLen($aWords[$i])+1
			$lineWords = 1
		Else
			$out &= $aWords[$i] & " "
			$lineLen += StringLen($aWords[$i])+1
			$lineWords += 1
		EndIf
	Next
	$out = StringRegExpReplace($out, " \Z", "")
	Return $out
EndFunc