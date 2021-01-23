function [EVCM,conjOp] = buildEVCM(STBC_pattern)
% The function gets an STBC_pattern (in the "conjugate-negative" format)
% and returns the EVCM (equivalent virtual channel matrix) of the pattern
% and the corresponding 'conjOp' which is a vector that includes only values of 1's and
% 0's that represent wether the one should conjate or not the recieved vector 'y' in
% order to get the equvalent channel.

% Note: if there is no EVCM the returned values will be -1.

%% Check if input is ok
% check STBC sizes
if(size(STBC_pattern,3)~=1)
    error('buildMatrixSet:: STBC pattern must be 2 dimensional matrix');
end
% check wether all STBC pattern enteries are pure imaginary or real
phaseValues = abs(phase(STBC_pattern(:)));
if( (abs(phaseValues) > 0.02) .* (abs(phaseValues-pi/2) > 0.02))
    error('buildMatrixSet:: STBC pattern must include pure imaginary or real values');
end

% General values
T = size(STBC_pattern,1);
N_t = size(STBC_pattern,2);


% Build EVCM:
variables_with_zero = unique(abs(STBC_pattern));
variables = variables_with_zero(variables_with_zero~=0);
K = length(variables);
EVCM = zeros(N_t, K);
% Go over all the rows to find the index of each variable
for rowInd = 1:T
    currentRow = STBC_pattern(rowInd,:);
    for varInd = 1:K
        var = variables(varInd);
        % find index
        index = find(abs(currentRow) == var);
        if(isempty(index))
            EVCM(rowInd,varInd) = 0;
        else
            EVCM(rowInd,varInd) = index;
            % find sign and conj
            value = STBC_pattern(rowInd,index);
            EVCM(rowInd,varInd) = sign(value) * EVCM(rowInd,varInd);
        end
    end
end

% Build conjugate operations:
conjOp = zeros(T,1);

% find conjugation pattern of the STBC
% '1' if conjugated, '-1' if not conjugated, '0' for zeros.
conjMat = 2 * abs(imag(sign(STBC_pattern))) - 1;
conjMat(STBC_pattern == 0) = 0;

% go over each row and assure it contains the same conjugation + save
% non-zero conjugation
for rowInd = 1:T    
    nonZeroInd = find(conjMat(rowInd,:) ~= 0,1,'first');
    nonZeroElem = conjMat(rowInd,nonZeroInd);
    for colInd = 1:N_t
        examinedElem = conjMat(rowInd,colInd);
        if(nonZeroElem ~= examinedElem && examinedElem ~=0)
            EVCM = -1;
            conjOp = -1;
            return
        else
            conjOp(rowInd) = conjMat(rowInd,nonZeroInd);
        end
    end
end

conjOp = (conjOp +1) / 2;




