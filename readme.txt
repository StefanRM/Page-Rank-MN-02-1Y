.___________. _______ .___  ___.      ___          ___  
|           ||   ____||   \/   |     /   \        |__ \ 
`---|  |----`|  |__   |  \  /  |    /  ^  \          ) |
    |  |     |   __|  |  |\/|  |   /  /_\  \        / / 
    |  |     |  |____ |  |  |  |  /  _____  \      / /_ 
    |__|     |_______||__|  |__| /__/     \__\    |____|


=== Cerinta 1 ===

	Functia Iterative() calculeaza matricea R folosind algoritmul iterativ.
Primeste ca parametri numele fisierului din care se citeste, d, coeficientul de
probabilitate ca navigatorul sa continue navigarea, si eps, eroarea care apare in
algoritm.
	Se seteaza formatul la free (pentru a avea numarul potrivit de zecimale).
Se deschide fisierul si citeste in matricea de adiacenta M legaturile dintre noduri.
Apoi se calculeaza matricea A, care are proprietatea ca daca j are link catre i atunci
A(i, j) = 1 / L(pj). Se initializeaza matricea R si se aplica formula matriceala pentru
algoritmul Iterative.

=== Cerinta 2 ===

	Functia Algebraic() calculeaza matricea R folosind varianta algebrica de calcul.
Primeste ca parametri numele fisierului din care se citeste si d, coeficientul de
probabilitate ca navigatorul sa continue navigarea.
	Se seteaza formatul la free (pentru a avea numarul potrivit de zecimale).
Se deschide fisierul si citeste in matricea de adiacenta M legaturile dintre noduri.
Apoi se calculeaza matricea A, care are proprietatea ca daca j are link catre i atunci
A(i, j) = 1 / L(pj).
	Se initializeaza matricea T care va fi inversata folosind functia GramScmidt(),
care returneaza inversa matricei T folosind algoritmul Gram-Schmidt modificat, dupa care
se rezolva sisteme superior triunghiulare pentru fiecare coloana a matricei unitate I.
Matricea R se afla folosind formula din algoritmul Algebraic.

=== Cerinta 3 ===

	Functia Power() calculeaza matricea R folosind metoda puterii.
Primeste ca parametri numele fisierului din care se citeste, d ,coeficientul de
probabilitate ca navigatorul sa continue navigarea, si eps, eroarea care apare in
algoritm.
	Se seteaza formatul la free (pentru a avea numarul potrivit de zecimale).
Se deschide fisierul si citeste in matricea de adiacenta M legaturile dintre noduri.
Apoi se calculeaza matricea A, care are proprietatea ca daca j are link catre i atunci
A(i, j) = 1 / L(pj).
	Se initializeaza matricea E (plina de 1) si se calculeaza cea mai mare valoare
proprie si R (vectorul propriu al acesteia) folosind metoda puterii directe. Dupa aceea
se normeaza R.

=== Cerinta 4 ===

1) Apartenenta() - functia care calculeaza valoarea functiei membru in punctul x
		dupa ce s-au aflat coeficientii a si b punand conditia de continuitate
		functiei din enunt;

2) PageRank()
	Functia calculeaza indicii PageRank pentru cele 3 cerinte, sriind in fisierul
de iesire nume.out.
	Primeste ca parametri numele fisierului din care se citeste, d ,coeficientul
de probabilitate ca navigatorul sa continue navigarea, si eps, eroarea care apare in
algoritmi.
	Se seteaza formatul la free (pentru a avea numarul potrivit de zecimale).
Se deschide fisierul si citeste in matricea de adiacenta M legaturile dintre noduri.
(acest lucru se face doar pentru a parcurge fisierul pana la cele doua valori val1 si val2).
	Se sorteaza PR (R-ul din algoritmul algebraic) prin metoda Insertion Sort. Se
seteaza o toleranta de 0.0000001 pentru numerele care au diferenta foarte foarte mica,
pentru ca aceste numere putem zice ca sunt 'egale'. Se afiseaza clasamentul celor mai
importante pagini, clasament in care intereseaza locul obtinut, numarul paginii care a
obtinut acest loc si gradul de apartenenta a acestei pagini la multimea paginilor importante.

