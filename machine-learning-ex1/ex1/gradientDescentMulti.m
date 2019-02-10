function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
rowsOfTheta = rows(theta);
columnsOfTheta = columns(theta);
updatedThetaMatrix = nan(rowsOfTheta, columnsOfTheta); % Used as a matrix to store updated theta values
                                                       % so that each theta value gets updated simultaneously.
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
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

    % ============================================================

    % Save the cost J in every iteration    
end

end

