%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror();
extern int ligne;
extern int colonne;
extern int nbr_err_lex;
extern char* yytext;
int nb_err_syn=0;
%}

%token Mc_CALCUL Mc_BOUCLE Mc_TAB Mc_INT Mc_DOUBLE 
Mc_CHAR 
Mc_STRING 
Mc_PROGRAM 
Mc_FOR 
Mc_READ 
Mc_WHILE  
Mc_PRINT 
Mc_CONST
Mc_IF
IDF 
CST_Int 
CST_Double 
CHAR 
STR 
STR_Comm
Pv 
Crochet_Ouv     
Crochet_Fer 
Par_Ouv 
Par_Fer 
Ps 
Virgule 
Guillemet 
Affect 
Opr_Plus 
Opr_Moins 
Opr_Div 
Opr_Mul
Opr_Comp_Egalite 
Opr_Comp_Inegalite 
Opr_Comp_Inf
Opr_Comp_Sup 
Opr_Comp_InfEgal 
Opr_Comp_SupEgal 
Accolade_Ouv 
Accolade_Fer 
Slash_comment 
SautDeLigne
err


%%
S: PlsIncld DefProgram
;
PlsIncld: Incld PlsIncld|
;
Incld: Mc_CALCUL SautDeLigne|Mc_BOUCLE SautDeLigne|Mc_TAB SautDeLigne
;
DefProgram: Mc_PROGRAM IDF SautDeLigne Accolade_Ouv SautDeLigne CorpsProgram Accolade_Fer SautDeLigne
;
CorpsProgram: PlsDec CorpsProgram | PlsInst CorpsProgram | Commentaire CorpsProgram |  
;
MultiLigne: SautDeLigne|
;
PlsDec : Dec MultiLigne PlsDec|
;
Dec: DecVar | DecConst | DecTab
;
DecVar : Type ListeVars Pv
;
DecConst : Type Mc_CONST ListeConsts Pv
;
DecTab: Type ListeTabs Pv
;
Type: Mc_INT | Mc_DOUBLE | Mc_CHAR | Mc_STRING
;
ListeVars: IDF Virgule ListeVars | IDF
;
ListeConsts : ConstInt | ConstDouble | ConstChar | ConstString 
;
ConstInt: IDF Affect CST_Int Virgule | IDF Affect CST_Int 
; 
ConstDouble: IDF Affect CST_Double Virgule | IDF Affect CST_Double
;
ConstChar: IDF Affect CHAR Virgule | IDF Affect CHAR
; 
ConstString: IDF Affect STR Virgule | IDF Affect STR
;
ListeTabs: Tableau Virgule ListeTabs| Tableau
;
Tableau: IDF Crochet_Ouv TailleTab Crochet_Fer
; 
TailleTab: CST_Int | IDF
;
PlsInst: OprerationInst MultiLigne PlsInst | Boucle PlsInst | Condition PlsInst |
;
OprerationInst : Affectation | Lecture | Affichage | Boucle | Condition
;
Affectation: IDF Affect Resultat Pv
;
Resultat: CONSTtype | ExpressArithm
;
CONSTtype: CST_Int | CST_Double | CHAR | STR
;

ExpressArithm: Op Opr Op
;
Op: CONSTtype | IDF | ExpressArithm
;
Opr: Opr_Plus | Opr_Moins | Opr_Mul | Opr_Div
;

// commentaire //
Lecture: Mc_READ Par_Ouv ContenuLecture Par_Fer Pv
;
ContenuLecture: IDF| Tableau
;
Affichage: Mc_PRINT Par_Ouv ContenuAff Par_Fer Pv
;
ContenuAff: IDF | STR| Tableau
;
Boucle: SignatureBoucle SautDeLigne Accolade_Ouv SautDeLigne PlsInst Accolade_Fer SautDeLigne
;

SignatureBoucle: BoucleWhile | BoucleFor
;
BoucleWhile: Mc_WHILE Par_Ouv ConditionBloc Par_Fer
;
ConditionBloc: Op OprComparaison Op 
;
OprComparaison: Opr_Comp_Egalite | Opr_Comp_Inegalite | Opr_Comp_Inf | Opr_Comp_Sup | Opr_Comp_InfEgal | Opr_Comp_SupEgal
;
BoucleFor: Mc_FOR Par_Ouv InitFor Ps NmbrePas Ps CondArret Par_Fer
;
InitFor: IDF Affect CST_Int
;
NmbrePas: CST_Int|IDF
;
CondArret: CST_Int|IDF| ExpressArithm
;
Condition: Mc_IF Par_Ouv ConditionBloc Par_Fer SautDeLigne Accolade_Ouv SautDeLigne PlsInst Accolade_Fer SautDeLigne
;

Commentaire: /*Slash_comment*/ contenuCommentaire /*Slash_comment*/ | /*/Slash_comment*/ contenuCommentaire /*Slash_comment*/ SautDeLigne
;
contenuCommentaire: STR_Comm //| SautDeLigne contenuCommentaire |
;


%%
yyerror(){
    nb_err_syn++;
    printf("Erreur syntaxique a la ligne %d, colonne %d a cause de %s\n",ligne,colonne,yytext);
    return 1;
}
int main(){
    yyparse();
    if(nb_err_syn == 0){
        printf("Syntaxe correcte \n");
    } else {
        printf("Syntaxe incorrecte \n");
    }
    return 1;
}