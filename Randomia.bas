

Randomize Timer

Rem clé KEY valeur VALUE       Randomize [( .6 . 9. )] JeakOn A96
Rem clé KEY [333666999.369] valeur VALUE [333666999.369] OK

Dim dateInit As String
Dim heurInit As String

dateInit = Date$
heurInit = Time$

Print "Date : " + dateInit
Print "Heure : " + heurInit


Dim limn As Long
limn = 9


_Title "Randomia " + dateInit + " " + heurInit + " " + Str$(limn)

Sleep 1: Rem   TEST:

' Chargement du contenu du fichier
Dim contenu As String

' keep
Open "Random.txt" For Input As #1

' new
' '  "Random4.txt" For Input As #4

Do While Not EOF(1)
    Line Input #1, ligne$
    contenu = contenu + ligne$ + " "
Loop
Close #1

' Extraire les mots du contenu
Dim mots$(1 To 39999) ' tableau de mots, ajuster la taille si besoin
nbMots = 0
For i = 1 To Len(contenu)
    If Mid$(contenu, i, 1) <> " " And Mid$(contenu, i, 1) <> Chr$(10) And Mid$(contenu, i, 1) <> Chr$(13) Then
        mot$ = mot$ + Mid$(contenu, i, 1)
    ElseIf Len(mot$) > 0 Then
        nbMots = nbMots + 1
        mots$(nbMots) = mot$
        mot$ = ""
    End If
Next i

' Nettoyage si dernier mot pas suivi d'un espace
If Len(mot$) > 0 Then
    nbMots = nbMots + 1
    mots$(nbMots) = mot$
End If

Rem Screen 0
Rem Screen _NewImage(480, 320, 12)
Rem Screen _NewImage(600, 480, 12)
Screen _NewImage(800, 600, 12)
Rem Screen _NewImage(1024, 768, 12)

Cls

' Boucle d'affichage

Print "Leetnia .. Elveria : deux. .. Orakia Randomia Staria Mystia."

Sleep 9:

Dim fullscreen As _Byte: fullscreen = 0
touche$ = InKey$

Do
    ' Plein écran / Fenêtre si "F11"
    touche$ = InKey$
    If touche$ = Chr$(0) + Chr$(133) Then ' F11
        fullscreen = Not fullscreen
        If fullscreen Then
            _FullScreen
        Else
            _FullScreen Off
            _ScreenMove 100, 100 ' repositionner la fenêtre
        End If
    End If

    ' CLS sur commande
    ' '                                                                             ----
    If LCase$(touche$) = "5" Or LCase$(touche$) = "g" Or LCase$(touche$) = "x" Then Cls
    If LCase$(touche$) = "5" Or LCase$(touche$) = "G" Or LCase$(touche$) = "X" Then Cls
    ' '                                                                             ----

    ' Key Z Incr limn , Key S Decr limn '
    ' '
    If limn < 1 Then limn = 1:
    If LCase$(touche$) = "5" Or LCase$(touche$) = "z" Or LCase$(touche$) = "Z" Then limn = limn * 3: Print limn: _Title "Randomia " + dateInit + " " + heurInit + " " + Str$(limn):
    If LCase$(touche$) = "5" Or LCase$(touche$) = "s" Or LCase$(touche$) = "S" Then limn = limn / 3: Print limn: _Title "Randomia " + dateInit + " " + heurInit + " " + Str$(limn):
    If limn < 1 Then limn = 1:
    ' '                                                                             ----

    ' Key 1 2 3 4 Change Screen Resolut '
    ' '
    If LCase$(touche$) = "1" Then Screen _NewImage(480, 320, 12)
    If LCase$(touche$) = "2" Then Screen _NewImage(600, 480, 12)
    If LCase$(touche$) = "3" Then Screen _NewImage(800, 600, 12)
    If LCase$(touche$) = "4" Then Screen _NewImage(1024, 768, 12)
    ' '

    ' Choix aléatoire entre afficher un mot ou un caractère
    choix = Int(Rnd * 4) ' 0 ou 1

    couleur = Int(Rnd * 15) + 1
    Color couleur

    If choix = 0 Then
        ' Afficher un caractère aléatoire
        index = Int(Rnd * Len(contenu)) + 1
        Print Mid$(contenu, index, 1);
    Else
        ' Afficher un mot aléatoire
        If nbMots > 0 Then
            index = Int(Rnd * nbMots) + 1
            Print mots$(index);
        End If
    End If

    Print " "; ' espace entre chaque affichage

    '

    '

    _Limit limn ' ralentir un peu la boucle (~10 FPS)

    '

    '

Loop Until touche$ <> "" And touche$ <> Chr$(0) + Chr$(133) And LCase$(touche$) <> "5" And LCase$(touche$) <> "G" And LCase$(touche$) <> "X" And LCase$(touche$) <> "z" And LCase$(touche$) <> "s" And LCase$(touche$) <> "1" And LCase$(touche$) <> "2" And LCase$(touche$) <> "3" And LCase$(touche$) <> "4"
' quitter la boucle si une touche est pressée

Print "Leetnia .. Elveria : deux. .. Orakia Randomia Staria Mystia."

Rem SAFE ?

Rem System

Rem SAFE ?

Rem COLOR : 000 Randomize Color

Rem SAFE ?:

