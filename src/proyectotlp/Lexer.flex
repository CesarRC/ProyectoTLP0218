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
%%                          /* REGLAS LEXICAS */
{WHITE} {}                  /* Si se encuentra un espacio, ignorarlo */
"=" {return ASSIGN;}        /* '=' retorna token ASSIGN */
"+" {return SUMA;}          /* '+' retorna SUMA */
"-" {return RESTA;}         /* '-' retorna RESTA */ 
"*" {return MULTIP;}        /* '*' retorna MULTIP */
"/" {return DIV;}           /* '/' retorna DIV */
{L}({L}|{D})* {lexeme=yytext(); return ID;}         /* Una letra seguida de letras o numeros se asigna como lexema, retorna ID */
 ("(-"{D}+")")|{D}+ {lexeme=yytext(); return INT;}  /* Digito o conjunto de digitos con o sin signo retorna INT */
. {return ERROR;}                                   /* Si no cumple ninguna de las anteriores, retornar ERROR */
