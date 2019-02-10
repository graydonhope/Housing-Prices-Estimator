function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

m = length(y); % number of training examples
J = 0;

sumValue = 0;

for i = 1:m
  Xi = X([i],[1,2]);      %Value of row i and columns 1,2 of X matrix
  sumValue += ((Xi * theta) - y([i]))**2;  
endfor

J = ((1/(2*m)) * sumValue);

end
