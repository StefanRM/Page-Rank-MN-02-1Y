function B = GramSchmidt(A)
% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
% In prima faza se foloseste algoritmul Gram-Schmidt modificat pentru factorizarea QR, apoi se afla inversa matricii A pe bucati, fiecare coloana in parte, folosindu-se rezolvarea unui sistem superior triunghiular
% Intrari:
% -> A: matricea de inversat.
% Iesiri:
% -> B: matricea inversata.

	[n n] = size(A); % dimensiunile matricii

	% initializarile matricelor Q si R din algoritmul Gram-Schmidt
	Q = zeros(n);
	R = zeros(n);

	B = zeros(n); % inversa lui A
	I = eye(n); % matricea unitate

	% algoritmul Gram-Schmidt modificat
	for i = 1:n
		R(i, i) = norm(A(:, i), 2);
		Q(:, i) = A(:, i)/ R(i, i);

		for j = i+1:n
			R(i, j) = Q(:, i)' * A(:, j);
			A(:, j) = A(:, j) - Q(:, i) * R(i, j);
		endfor

	endfor

	% aflarea inversei pe bucati
	for i = 1:n
		b = I(:, i);
		x = SST(R, Q' * b); % rezolvarea unui sistem superior triunghiular
		B(:, i) = x;
	endfor
endfunction