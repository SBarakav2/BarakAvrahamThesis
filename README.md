# findEVCM

==================== Description =======================
1. first build an STBC using the "conjugate-negative format", i.e. the
   entry of the matrix denotes the index of the information symbol, a
   '-' sign denotes that it is accompanied with minus, and the sign of 'j'
   denotes that it is accompanied with conjugate sign.
2. call the function buildEVCM to get the equivalent virtual channel
   matrix (if exists). The resulting matrix is also in the
   "conjugate-negative" format.
3. The function will return also the 'conjugate operation' that is needed
   to be applied over the received symbols in order to obtain the
   equivalent channel.
   '1' means a conjugate op is need, '0' otherwise.
   
==================== Example =======================   
A "conjugate-negative format" of an STBC:

STBC =  [1       2        3        0;
        -2j       1j      0        3j;
         3j       0j        -1j       2j;
         0       3j       -2j     -1j];
The output of the function is:
 
EVCM:
   1.0000 + 0.0000i   2.0000 + 0.0000i   3.0000 + 0.0000i
   0.0000 + 2.0000i   0.0000 - 1.0000i   0.0000 + 4.0000i
   0.0000 - 3.0000i   0.0000 + 4.0000i   0.0000 + 1.0000i
   0.0000 - 4.0000i   0.0000 - 3.0000i   0.0000 + 2.0000i

conjugate operations:
     0
     1
     1
     1
