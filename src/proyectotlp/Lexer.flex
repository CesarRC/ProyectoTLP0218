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
"=" {return ASSIGN;}        /* '=' retorna token ASSIGN */
"<" {return LESSTHAN;}        /* '<' retorna token LESSTHAN */
">" {return GREATHERTHAN;}        /* '>' retorna token GREATHERTHAN */
"+" {return SUMA;}          /* '+' retorna SUMA */
"-" {return RESTA;}         /* '-' retorna RESTA */ 
"*" {return MULTIP;}        /* '*' retorna MULTIP */
//"/" {return DIV;}           /* '/' retorna DIV */
";" {return EOI;}           /* ';' retorna EOI */
"{" {return LEFT;}           /* llave de apertura retorna LEFT*/
"}" {return RIGHT;}          /*llave de cierre retorn RIGHT*/
"while" {return WHILE;}      /*palabra reservada while*/
"for" {return FOR;}         /*palabra reservada for*/
"if" {return IF;}           /*palabra reservada if*/
"(" {return LEFTP;}         /*parentesis de apertura retorna LEFT(*/
")" {return RIGHTP;}         /*parentesis de cierre retorna RIGHTP(*/
"return" {return RETURN;}    /*valor de retorno retorna RETURN*/
{L}({L}|{D})* {lexeme=yytext(); return ID;}         /* Una letra seguida de letras o numeros se asigna como lexema, retorna ID */
 ("(-"{D}+")")|{D}+ {lexeme=yytext(); return INT;}  /* Digito o conjunto de digitos con o sin signo retorna INT */
{D}+"."{D}* {lexeme=yytext(); return FLOAT;}        /* Digito o conjunto de digitos con o sin signo retorna Float */
"'"{L}"'" {lexeme=yytext(); return CHAR;}           /*Letra o guion bajo retorna char*/
"\""({L}|{D})*"\"" {lexeme=yytext(); return STRING;}/*cadena de digitos o letras retorna String*/
. {return ERROR;}                                   /* Si no cumple ninguna de las anteriores, retornar ERROR */
