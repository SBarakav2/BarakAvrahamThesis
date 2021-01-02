% Description:
% 1. first build an STBC using the "conjugate-negative format", i.e. the
%    entry of the matrix denotes the index of the information symbol, a
%    '-' sign denotes that it is accompanied with minus, and the sign of 'j'
%    denotes that it is accompanied with conjugate sign.
% 2. call the function buildEVCM to get the equivalent virtual channel
%    matrix (if exists). The resulting matrix is also in the
%    "conjugate-negative" format.
% 3. The function will return also the 'conjugate operation' that is needed
%    to be applied over the received symbols in order to obtain the
%    equivalent channel.
%    '1' means a conjugate op is need, '0' otherwise.

%% Example 1
ALAMOUTI_PATTERN = [1     2;
                   -2j   1j];
[EVCM,conjVec] = buildEVCM(ALAMOUTI_PATTERN)   ;           

fprintf('-------------------------- Alamouti EVCM --------------------------\n');
fprintf('EVCM:\n');
disp(EVCM);
fprintf('conjugate operations:\n');
disp(conjVec);
%% Example 2              
ABBA_QSTBC_PATTERN = [1       2        3        4;
                      2j     -1j       4j      -3j;
                      3       4        1        2;
                      4j     -3j       2j      -1j];
[EVCM,conjVec] = buildEVCM(ABBA_QSTBC_PATTERN)   ;      
fprintf('-------------------------- ABBA-QSTBC EVCM --------------------------\n');
fprintf('EVCM:\n');
disp(EVCM);
fprintf('conjugate operations:\n');
disp(conjVec);
%% Example 3                            
RATE_3_4_OSTBC = [1       2        3        0;
                 -2j       1j      0        3;
                  3j       0        -1j      2;
                  0       3j       -2j       -1];
[EVCM,conjVec] = buildEVCM(RATE_3_4_OSTBC)   ;
fprintf('-------------------------- Rate 3/4 OSTBC --------------------------\n');
fprintf('EVCM:\n');
disp(EVCM);
fprintf('conjugate operations:\n');
disp(conjVec);

%% Example 4                            
OTHER_STBC =     [1       2        3        0;
                 -2j       1j      0        3j;
                  3j       0j        -1j       2j;
                  0       3j       -2j     -1j];
[EVCM,conjVec] = buildEVCM(OTHER_STBC)   ;
fprintf('-------------------------- Other EVCM --------------------------\n');
fprintf('EVCM:\n');
disp(EVCM);
fprintf('conjugate operations:\n');
disp(conjVec);