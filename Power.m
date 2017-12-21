function R = Power(nume, d, eps)
% Functia care calculeaza vectorul PageRank folosind metoda puterii.
% Intrari:
% -> nume: numele fisierului din care se citeste;
% -> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
			suma = suma + M(i, j);
		endfor;

		for j = 1:N
			if (M(i, j) == 1) % daca i are legatura catre j
				A(j, i) = 1 / suma;
			endif
		endfor

	endfor

	% Algortimul Power Method

	E = ones(N, 1) * ones(1, N);

	[lambda R] = PutereDir(d * A + ((1 - d) / N) * E, eps); % aflarea valorii proprii maxime si a vectorului propriu

	R = R / norm(R, 1); % normam vectorul propriu

	fclose(fid); % inchidem fisierul

endfunction