function R = Iterative(nume, d, eps)
% Functia care calculeaza matricea R folosind algoritmul iterativ.
% Intrari:
% -> nume: numele fisierului din care se citeste;
% -> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
% -> eps: eroarea care apare in algoritm.
% Iesiri:
% -> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

	format free; % pentru a avea numarul potrivit de zecimale

	fid = 0; 
	while (fid < 1) % deschidem fisierul
		[fid, mesaj] = fopen(nume, 'rt');
		if (fid == -1) % in caz de esec
			disp(mesaj);
		endif
	endwhile

	N = fscanf(fid, "%d", 1);

	M = zeros(N, N); % matricea de adiacenta
	A = M; % matricea cu 1 / L(pj) daca j are link catre i
	R = zeros(N, 1); % vectorul de PageRank-uri la pasul anterior
	R_fin = R; % vectorul de PageRank-uri la pasul curent

	for i = 1:N
		i = fscanf(fid, "%d", 1); % nodul curent coincide cu contorul
		nr_legaturi = fscanf(fid, "%d", 1); %  nr de legaturi ce urmeaza

		legaturi = fscanf(fid, "%d", nr_legaturi); % citim toate adiacentele
		for j = 1:nr_legaturi
			M(i, legaturi(j)) = 1;
		endfor

		M(i, i) = 0; % punem zero pe diagonala principala pentru orice eventualitate
	endfor

	% calculul matricei A
	for i = 1:N
		suma = 0; % nr de legaturi ale lui i

		% calculam nr de legaturi ale lui i
		for j = 1:N
			suma = suma + M(i,j);
		endfor;

		for j = 1:N
			if (M(i, j) == 1) % daca i are legatura catre j
				A(j, i) = 1 / suma;
			endif
		endfor

	endfor

	% initializam matricea R la primul pas
	for i = 1:N
		R(i) = 1/N;
	endfor

	while(1) % aplicam formula matriceala ptr algoritmul Iterative
		R_fin = d * A * R + ((1 - d) / N) * ones(N,1);

		if (abs(R_fin - R) < eps) % conditia de oprire
			R = R_fin;
			break;
		endif

		R = R_fin;
	endwhile

	fclose(fid); % inchidem fisierul

endfunction