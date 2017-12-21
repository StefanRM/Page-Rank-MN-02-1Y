function [lambda y] = PutereDir(A, eps)
	% Metoda puterii directe

	[n n] = size(A); % dimensiunile matricii
	y = ones(n, 1); % vectorul propriu al valorii proprii maxime

	while (1)
		z = A * y;
		y = z / norm(z, 2);
		lambda = y' * A * y; % valoarea proprie maxima
		
		if (norm(A * y - lambda * y, 2) < eps) % conditia de oprire
			break;
		endif
	endwhile
	
endfunction