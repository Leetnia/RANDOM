Randomize Timer

_Title "Random1"

' Chargement du contenu du fichier
Dim contenu As String

' new couleur for psychedelic context ...
Open "couleur.txt" For Input As #4

' keep
Open "Random1.txt" For Input As #1
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

    ' Choix aléatoire entre afficher un mot ou un caractère
    choix = Int(Rnd * 2) ' 0 ou 1

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

    ' ralentir un peu la boucle (~10 FPS)

    ' _Limit 10

    _Limit 42

    ' _Limit 10

    ' ralentir un peu la boucle (~10 FPS)

Loop Until touche$ <> "" And touche$ <> Chr$(0) + Chr$(133)
' quitter la boucle si une touche est pressée

Print "Leetnia et Elveria : deux."

Rem SAFE ?

Rem System

Rem SAFE ?
