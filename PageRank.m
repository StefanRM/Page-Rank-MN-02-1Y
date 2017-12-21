function [R1 R2 R3] = PageRank(nume, d, eps)
% Calculeaza indicii PageRank pentru cele 3 cerinte
% Scrie fisierul de iesire nume.out

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

	% doar pentru parcurgerea fisierului
	for i = 1:N
		i = fscanf(fid, "%d", 1); % nodul curent coincide cu contorul
		nr_legaturi = fscanf(fid, "%d", 1); %  nr de legaturi ce urmeaza

		legaturi = fscanf(fid, "%d", nr_legaturi); % citim toate adiacentele
		for j = 1:nr_legaturi
			M(i, legaturi(j)) = 1;
		endfor

		M(i, i) = 0; % punem zero pe diagonala principala pentru orice eventualitate
	endfor

	% cele doua valori de la sfarsitul fisierului
	val1 = fscanf(fid, "%f", 1);
	val2 = fscanf(fid, "%f", 1);

	fclose(fid); % inchidem fisierul

	nume_out = strcat(nume, '.out'); % numele fisierului in care vom scrie

	fid = 0;
	while (fid < 1) % deschidem fisierul in care vom scrie
		[fid, mesaj] = fopen(nume_out, 'wt');
		if (fid == -1) % in caz de esec
			disp(mesaj);
		endif
	endwhile

	% initializarea celor 3 PageRank-uri in functie de algoritm
	R1 = Iterative(nume, d, eps);
	R2 = Algebraic(nume, d);
	R3 = Power(nume, d, eps);

	% afisarea in fisier
	fprintf(fid, '%d\n\n', N);

	fprintf(fid, '%d\n', R1);
	fprintf(fid, '\n');

	fprintf(fid, '%d\n', R2);
	fprintf(fid, '\n');

	fprintf(fid, '%d\n', R3);
	fprintf(fid, '\n');

	PR1 = R2_copy = R2;

	% insertion sort
	for i = 2:N
		j = i;

		while ((j > 1) && (PR1(j) > PR1(j - 1)))
			aux = PR1(j);
			PR1(j) = PR1(j - 1);
			PR1(j - 1) = aux;

			j = j - 1;
		endwhile
	endfor

	tol = 0.0000001; % toleranta pentru numerele care au diferenta foarte foarte mica

	% afisarea indicilor si a gradului de apartenenta in fisier
	for i = 1:N
		fprintf(fid, '%d ', i);

		for j = 1:N
			if ((PR1(i) == R2_copy(j)) || (abs(PR1(i) - R2_copy(j) < tol))) % daca sunt egale sau daca diferenta este foarte foarte mica
				fprintf(fid, '%d ', j);
				R2_copy(j) = -1; % marcam valoarea pentru a nu o lua din nou in considerare
				break;
			endif
		endfor

		u = Apartenenta(PR1(i), val1, val2);
		fprintf(fid, '%f\n', u);
	endfor

	fclose(fid); % inchidem fisierul in care am scris

endfunction