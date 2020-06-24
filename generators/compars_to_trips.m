function [ triplets ] = compars_to_trips( n, m, k, signed_col_compars )
% Given k columns, converts m comparisons per column into m * k triplets
triplets = zeros(m * k, 3);
count = 1;
for i = 1:k
    alts = [1:i-1 i+1:n];
    compars_to_i = signed_col_compars{i};
    comps = compars_to_i(:, 1:2);
    flip = find(compars_to_i(:, 3) == -1);
    comps(flip, [1, 2]) = comps(flip, [2, 1]);
    for j = 1:m
        triplets(count, :) = [i alts(comps(j, :))];
        count = count + 1;
    end
end      
end

