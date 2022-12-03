%{
#include "Syntaxe.tab.h"
#include <stdio.h>
#include <stdlib.h>
int ligne = 0;
int colonne = 0;
int nbr_err_lex = 0;
%}
Mc_CALCUL #CALCUL
Mc_BOUCLE #BOUCLE
Mc_TAB #TAB
Mc_INT INT
Mc_DOUBLE DOUBLE
Mc_CHAR CHAR
Mc_STRING STRING
Mc_PROGRAM Program
Mc_FOR FOR
Mc_READ READ
Mc_WHILE WHILE 
Mc_PRINT PRINT
Mc_CONST CONST
Mc_IF IF
IDF [A-Z][a-zA-Z0-9]*
CST_Int [1-9][0-9]*|0
CST_Double [0-9]+(\.[0-9]+)?|[1-9][0-9]*|0
CHAR ['].[']
STR ["].*["] 
Pv ;
Crochet_Ouv \[    
Crochet_Fer \]
Par_Ouv \(
Par_Fer \)
Ps :
Virgule ,
Guillemet \"
Affect =
Opr_Plus \+
Opr_Moins -
Opr_Div \/
Opr_Mul \*
Opr_Comp_Egalite ==
Opr_Comp_Inegalite !=
Opr_Comp_Inf \<
Opr_Comp_Sup \>
Opr_Comp_InfEgal \<=
Opr_Comp_SupEgal \=>
Accolade_Ouv \{
Accolade_Fer \}
Slash_comment \/\/
SautDeLigne \n
%%
{Mc_CALCUL} {return Mc_CALCUL;}
{Mc_BOUCLE} {return Mc_BOUCLE;}
{Mc_TAB} {return Mc_TAB;}
{Mc_INT} {return Mc_INT;}
{Mc_DOUBLE} {return Mc_DOUBLE;}
{Mc_CHAR} {return Mc_CHAR;}
{Mc_STRING} {return Mc_STRING;}
{Mc_PROGRAM} {return Mc_PROGRAM;}
{Mc_FOR} {return Mc_FOR;}
{Mc_READ} {return Mc_READ;}
{Mc_WHILE} {return Mc_WHILE;}  
{Mc_PRINT} {return Mc_PRINT;}
{Mc_CONST} {return Mc_CONST;}
{Mc_IF} {return Mc_IF;}
{IDF} {if(yyleng<=12){colonne+=yyleng;return IDF;} else{printf("le nom de la variable ne doit pas depasse 12 caracteres\n");}} 
{CST_Int} {return CST_Int;}
{CST_Double} {return CST_Double;}
{CHAR} {return CHAR;}
{STR} {return STR;}
{Pv} {return Pv;}
{Crochet_Ouv} {return Crochet_Ouv;}
{Crochet_Fer} {return Crochet_Fer;}
{Par_Ouv} {return Par_Ouv;}
{Par_Fer} {return Par_Fer;}
{Ps} {return Ps;}
{Virgule} {return Virgule;}
{Guillemet} {return Guillemet;}
{Affect} {return Affect;}
{Opr_Plus} {return Opr_Plus;}
{Opr_Moins} {return Opr_Moins;}
{Opr_Div} {return Opr_Div;}
{Opr_Mul} {return Opr_Mul;}
{Opr_Comp_Egalite} {return Opr_Comp_Egalite;}
{Opr_Comp_Inegalite} {return Opr_Comp_Inegalite;}
{Opr_Comp_Inf} {return Opr_Comp_Inf;}
{Opr_Comp_Sup} {return Opr_Comp_Sup;}
{Opr_Comp_InfEgal} {return Opr_Comp_InfEgal;} 
{Opr_Comp_SupEgal} {return Opr_Comp_SupEgal;}
{Accolade_Ouv} {return Accolade_Ouv;}
{Accolade_Fer} {return Accolade_Fer;}
{Slash_comment} {return Slash_comment;}
{SautDeLigne} {ligne++; colonne=0; return SautDeLigne;}
[\t] 
[ ] {colonne++;}
. {nbr_err_lex++;
    printf("Erreur lexicale a la ligne %d, la colonne %d, a cause de %s\n", ligne, colonne,yytext);
    return err;
    }
%% 