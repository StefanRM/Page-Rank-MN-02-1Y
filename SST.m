function x = SST(A, b)
% rezolvarea unui sistem superior triunghiular

	[n n] = size(A);
	x = zeros(n, 1);
	for i = n:-1:1
		s = 0;
		for j = i+1:n
			s = s + A(i, j) * x(j, 1);
		endfor
		x(i, 1) = (b(i, 1) - s) / A(i, i);
	endfor
endfunction