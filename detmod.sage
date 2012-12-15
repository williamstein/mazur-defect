@parallel(12)
def f(p,k):
    M = ModularSymbols(1,k,sign=1,base_ring=GF(p))
    S = M.cuspidal_subspace()
    T = S.hecke_matrix(p)
    return T.determinant()

def g(p):
    return [X[1] for X in f([(p, k) for k in [12,14,..,(p+3)//2]])]

def table(pmin, pmax):
    for p in primes(pmin, pmax+1):
        open('table-detmod.txt','a').write('%s %s\n'%(p, g(p)))
