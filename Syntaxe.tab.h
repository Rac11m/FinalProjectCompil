
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     Mc_CALCUL = 258,
     Mc_BOUCLE = 259,
     Mc_TAB = 260,
     Mc_INT = 261,
     Mc_DOUBLE = 262,
     Mc_CHAR = 263,
     Mc_STRING = 264,
     Mc_PROGRAM = 265,
     Mc_FOR = 266,
     Mc_READ = 267,
     Mc_WHILE = 268,
     Mc_PRINT = 269,
     Mc_CONST = 270,
     Mc_IF = 271,
     IDF = 272,
     CST_Int = 273,
     CST_Double = 274,
     CHAR = 275,
     STR = 276,
     Pv = 277,
     Crochet_Ouv = 278,
     Crochet_Fer = 279,
     Par_Ouv = 280,
     Par_Fer = 281,
     Ps = 282,
     Virgule = 283,
     Guillemet = 284,
     Affect = 285,
     Opr_Plus = 286,
     Opr_Moins = 287,
     Opr_Div = 288,
     Opr_Mul = 289,
     Opr_Comp_Egalite = 290,
     Opr_Comp_Inegalite = 291,
     Opr_Comp_Inf = 292,
     Opr_Comp_Sup = 293,
     Opr_Comp_InfEgal = 294,
     Opr_Comp_SupEgal = 295,
     Accolade_Ouv = 296,
     Accolade_Fer = 297,
     Slash_comment = 298,
     SautDeLigne = 299,
     err = 300
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


