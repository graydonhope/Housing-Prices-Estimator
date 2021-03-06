function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
rowsOfTheta = rows(theta);
columnsOfTheta = columns(theta);
updatedThetaMatrix = nan(rowsOfTheta, columnsOfTheta); % Used as a matrix to store updated theta values
                                                       % so that each theta value gets updated simultaneously.
for iter = 1:num_iters
    
    % Keep solution generic. You don't know how many theta values you will have.
    for j = 1:rowsOfTheta
      
      % Calculate the gradient descent for that specific theta value.
      sumValue = 0;
      for i = 1:m
        Xi = X([i],[1,2]);      %Value of row i and columns 1,2 of X matrix
        sumValue += ( ((Xi * theta) - y([i]))*(X([i],[j])) );  
      endfor
           
      updatedTheta = theta([j]) - ((alpha*(1/m)) * sumValue);
      updatedThetaMatrix([j]) = updatedTheta;
    endfor
    
    theta = updatedThetaMatrix;

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
end

end
