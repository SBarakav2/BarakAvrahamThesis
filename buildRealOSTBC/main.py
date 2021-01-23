from Functions import *

print("-----------------------------------------------------------------")
print("1) Hurwitz-Radon parameters of 8 are:")
print("(a,b,c,d) = " + str(find_hurwitz_radon_parameters(8)) + "\n")
print("where  b*2^a,  a = 4c+d. ")

print("-----------------------------------------------------------------")
print("2) Hurwitz-Radon number fof 8:")
print(hurwitz_radon_number(8))
print("\n")

print("-----------------------------------------------------------------")
print("3) The minimum delay of real OSTBC for N_t = 5 transmit antennas is:")
print(find_minimum_p(5))
print("\n")

print("-----------------------------------------------------------------")
print("4) The set of Hurwitz-Radon matrices is:")
matrices_set = build_hurwitz_radon(8)
for ind, mat in enumerate(matrices_set):
    print("Matrix " + str(ind) + " =")
    print(repr(mat))
    print("\n")

print("-----------------------------------------------------------------")
print("5) Check if indeed meet the Hurwitz-Radon equations:")
print(check_hurwitz_radon(matrices_set))

print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
print("6) OSTBC Construction")
ostbc = build_ostbc(5)
print(repr(ostbc))