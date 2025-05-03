Randomize Timer

_Title "Random2"

' Chargement du contenu du fichier
Dim contenu As String
Open "Random2.txt" For Input As #1
Do While Not EOF(1)
    Line Input #1, ligne$
    contenu = contenu + ligne$ + " "
Loop
Close #1

' Extraire les mots du contenu
Dim mots$(1 To 1000) ' tableau de mots, ajuster la taille si besoin
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

' Boucle d'affichage
Screen 0
Cls

Print "Leetnia et Elveria : deux."

Dim fullscreen As _Byte: fullscreen = 0
touche$ = InKey$

' // ' // '// ' (( Resoudre les bugs de gravite ISS )) :
Locate 11, 11
Locate 10, 10

Locate 12, 12
Locate_NI = 0

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

    ' Choix aléatoire entre afficher un mot ou un caractère
    choix = Int(Rnd * 2) ' 0 ou 1

    couleur = Int(Rnd * 15) + 1
    Color couleur

    ' (( Suite 1 Resoudre les bugs de gravite ISS )) :
    Locate 12, 12
    Locate_NI = Locate_NI - 1

    ' (( Suite 1 Resoudre les bugs de gravite ISS )) :
    If Locate_NI <= -10 Then Locate_NI = 0: Rem Safe ?    ?
    If Locate_NI >= 100 Then Locate_NI = 0: Rem Dafe Safe ?

    ' Problems: Automate, +, -, NOON H.
    Locate Abs(12 + Locate_NI), Abs(12 + Locate_NI)

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

    ' Balise Label1

    ' Problems: Automate, +, -, NOON H.
    Locate Abs(12 + Locate_NI) - 1, Abs(12 + Locate_NI) - 1

    Print " "; ' espace entre chaque affichage

    ' Balise Label2

    _Limit 10 ' ralentir un peu la boucle (~10 FPS)

Loop Until touche$ <> "" And touche$ <> Chr$(0) + Chr$(133) And LCase$(touche$) <> "5" And LCase$(touche$) <> "G" And LCase$(touche$) <> "X"
' quitter la boucle si une touche est pressée

Print "Leetnia et Elveria : deux."

Rem SAFE ?

Rem System

Rem SAFE ?


