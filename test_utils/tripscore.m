function [pred_err] = tripscore(triplets, Xtrue, Xhat)
% probability that uniformly sampled triplet query on Xhat matches Xtrue
i = triplets(:, 1); j = triplets(:, 2); k = triplets(:, 3);

pred_err = mean(sign(distances(Xtrue, i, k) - distances(Xtrue, i, j)) ...
    ~= sign(distances(Xhat, i, k) - distances(Xhat, i, j)));
end
        