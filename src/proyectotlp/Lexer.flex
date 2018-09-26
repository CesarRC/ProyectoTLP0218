package proyectotlp;
import static proyectotlp.Token.*;
%%                          /* DEFINICIONES */
%class Lexer                /* Indica nombre de la clase java que se generará */
%type Token                 /* Se retornarán valores tipo Token */
L = [a-zA-Z_]               /* L puede tomar el valor de cualquier letra o un guión bajo */
D = [0-9]                   /* D es todos los digitos */
WHITE=[ \t\r\n]             /* WHITE indica tabluación, espacio o retorno de carro */
%{
public String lexeme;
%}
%%                          /* REGLAS LEXICAS */                 /*cometarios */
"//"({L}|.)+"\\n" {return COMENT;} /*cometarios */
"/\*"({L}|.)+"\*/" {return COMENT;} /*cometarios */
{WHITE} {}                  /* Si se encuentra un espacio, ignorarlo */
"=" {lexeme=yytext(); return ASSIGN;}        /* '=' retorna token ASSIGN */
"<" {lexeme=yytext(); return LESSTHAN;}        /* '<' retorna token LESSTHAN */
">" {lexeme=yytext(); return GREATHERTHAN;}        /* '>' retorna token GREATHERTHAN */
"+" {lexeme=yytext(); return SUMA;}          /* '+' retorna SUMA */
"-" {lexeme=yytext(); return RESTA;}         /* '-' retorna RESTA */ 
"*" {lexeme=yytext(); return MULTIP;}        /* '*' retorna MULTIP */
//"/" {lexeme=yytext(); return DIV;}           /* '/' retorna DIV */
";" {lexeme=yytext(); return EOI;}           /* ';' retorna EOI */
"{" {lexeme=yytext(); return LEFT;}           /* llave de apertura retorna LEFT*/
"}" {lexeme=yytext(); return RIGHT;}          /*llave de cierre retorn RIGHT*/
"while" {lexeme=yytext(); return WHILE;}      /*palabra reservada while*/
"for" {lexeme=yytext(); return FOR;}         /*palabra reservada for*/
"if" {lexeme=yytext(); return IF;}           /*palabra reservada if*/
"(" {lexeme=yytext(); return LEFTP;}         /*parentesis de apertura retorna LEFT(*/
")" {lexeme=yytext(); return RIGHTP;}         /*parentesis de cierre retorna RIGHTP(*/
"return" {return RETURN;}    /*valor de retorno retorna RETURN*/
{L}({L}|{D})* {lexeme=yytext(); return ID;}         /* Una letra seguida de letras o numeros se asigna como lexema, retorna ID */
 ("(-"{D}+")")|{D}+ {lexeme=yytext(); return INT;}  /* Digito o conjunto de digitos con o sin signo retorna INT */
{D}+"."{D}* {lexeme=yytext(); return FLOAT;}        /* Digito o conjunto de digitos con o sin signo retorna Float */
"'"{L}"'" {lexeme=yytext(); return CHAR;}           /*Letra o guion bajo retorna char*/
"\""({L}|{D})*"\"" {lexeme=yytext(); return STRING;}/*cadena de digitos o letras retorna String*/
. {return ERROR;}                                   /* Si no cumple ninguna de las anteriores, retornar ERROR */
