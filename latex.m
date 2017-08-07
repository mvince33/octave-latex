function str = latex(M)
% str = latex(m): Take an array in octave and convert it
%     a string with its representation using LaTeX.
% input: M =  a matrix  to be converted to LaTeX code
%
% output: str = The LaTeX representation of M

% Get the dimensions of M.
m = size(M, 1);
n = size(M, 2);

% LaTeX code to start the array.
str = "\\left( \\begin{array}{";

% Add the appropriate number of 'r's so that
% each column is right justified. (This makes
% matrices with negative numbers prettier.)
for i = 1:n
    str = [str "r"];
end

% Add the last curly brace to opening array line.
str = [str "}"];

% Build the matrix row wise.
for i = 1:m
    temp = "";
    % Add each element with of the ith row 
    for j = 1:(n-1)
        temp = [temp num2str(M(i,j)) " & "];
    end
    % Tell LateX to start a new line
    str = [str; temp num2str(M(i,n)) " \\\\ "];
end
       
% LaTeX code to finish the array. The line break
% is for formatting in Octave.       
str = [str ;  "\\end{array} \\right) \n"];

      