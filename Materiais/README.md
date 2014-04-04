[Java Book](http://java2s.com/Book/Java/CatalogJava.htm) - The C Book, só que de Java
[Java Index](http://www.roseindia.net/java/master-java/index.shtml) - Site com Referências Gerais de Java
[C Basics](http://einstein.drexel.edu/courses/Comp_Phys/General/C_basics/) Referências Gerais em C
[C FAQ](http://c-faq.com/questions.html) Respostas para perguntas gerais envolvendo C
[C Tutorial](http://www.programiz.com/c-programming) - [C Tutorial Exemplos](http://www.programiz.com/c-programming/examples/) Tutorial básico e alguns exemplos em C
[C the Hard Way](http://c.learncodethehardway.org/book/) - Livro ainda sendo escrito, recomendo
[C Course](http://www.computerscienceforeveryone.com/Course_1/Unit_1/Lesson_1/) - Vídeo Aulas
[Python the Hard Way](http://learnpythonthehardway.org/book/) - Mais um da Série Learn The Hard Way, para Python 2
[How to Think Python](http://www.openbookproject.net/thinkcs/python/english3e/) - Python 3
[Java Introduction](http://chortle.ccsu.edu/java5/index.html) - Introdução a Java
[MIT Computer Science](http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-00sc-introduction-to-computer-science-and-programming-spring-2011/) - Curso do MIT muito bom e usado por todo o mundo, gratuito.
[C++](http://stackoverflow.com/questions/388242/the-definitive-c-book-guide-and-list) - Lista Gigante com os melhores livros para sair MANJANDO de C++
[C# Video Aulas](http://channel9.msdn.com/Series/C-Sharp-Fundamentals-Development-for-Absolute-Beginners) - Vídeo Aulas para iniciantes em C#
[C/C++ Dicas](http://www.cprogramming.com/tips/) - Pequena lista com algumas dicas úteis em C/C++


---------------------------------------------------

#Dicas e Truques

##[C] Trocar duas variáveis sem usar outra variável temporária
  x ^= y;
  y ^= y;
  x ^= y;

Usa-se o *bitwise operator* XOR.




##[C] Calcular Fatorial

Calcular fatoriais é um dos exemplos mais comuns em recursividade. O código é: 

int fatorial(int i) {
     if(i)
          return i * fatorial(i-1);
     return 1;
}

O problema é que fatoriais ficam muito grandes muito rápido. Apenas 13(!) é tão grande que já da overflow em um int32. O melhor a se fazer é criar um vetor com os valores fatoriais:

int fatorial(int i) {
     if (i<0 || i>12) {
          fprintf(stderr, "Fatorial muito grande\n");
          exit(EXIT_FAILURE); 
     }
     static const int fatoriais[] = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600};
     return fatoriais[i];
}


##[C] %s na função printf para strings

Já que printf() recebe strings como argumentos, talvez você ache que não precisa usar %s quando for mostrar uma string.

Exemplo:

	char string[12]="Hello World";
	printf(string);


Mas isso pode ser extremamente perigoso e pode deixar o seu programa vulnerável, e se a sua string usar %d? printf() é uma função varargs, ela usa o formato da string pra saber quantos argumentos ela recebe. Se você dá um argumento, mas colocar o especificador de formato, ela vai achar que têm mais argumentos e ler eles da pilha. Isso irá fazer mostrar informações da memória. Isso revela informações sobre a memória do seu programa e o deixa vulnerável a ataques. Use: 

	char string[12]="Hello World";
	printf("%s", string);

##[Lua] Parte Inteira de um número

	print(select(2, math.modf(number)))

Se o primeiro argumento é um número, select retorna todos os argumentos após esse número. Alguns exemplos:
	print(select(1, 1, 2, 3)) --> 1 2 3
	print(select(2, 1, 2, 3)) --> 2 3
	print(select(3, 1, 2, 3)) --> 3

Ou:
	print((math.modf(number)))


##[Lua] Trocar valor das variáveis

**Parsing order**
x, x = 1, 2
print(x) --> 1

Lua parece designar varáveis da direita para esquerda. Agora se declararmos elas localmente: 

	local x, x = 1, 2
	print(x) --> 2

Variáveis Locais parecem ser designadas da esquerda para direita. Um ponto notável é que quando fazendo múltiplas declarações de variáveis, a expressão é analisada antes de ser designada. Então podemos trocar o valor de variáveis sem usar o XOR: 

	local a, b = 1, 2
	a, b = b, a
	print(a, b) --> 2, 1

A primeiro coisa que Lua faz é designar 1 para a e 2 para b. Então na segunda declaração Lua descobre o que b(2) é e o que a(1) é. Então designa novamente a e b.

##[Lua]

Aqui está um código para formatar uma string com o nome de uma pessoa:

	local p = "Olá, %s!"
	print(string.format(p,"yournamehere"))

Há um jeito melhor. Strings saõ geradas com uma metatabela automáticamente que da a elas todos os membros da biblioteca string, então você pode chamar métodos sem usar a biblioteca string:

	print(("Hello, %s!"):format("yournamehere"))

Você pode fazer isso para todas as funções da biblioteca string, ao invés de fazer string.sub(p,1,1) você pode fazer simplesmente p:sub(1,1)



---------------------------------------------------------------

Adicionem também ou retirem se quiserem, eu coloquei alguns só de exemplo mas aqui fica a seu critério o que colocar. Pode colocar também suas próprias funções se quiser.