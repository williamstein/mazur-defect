@parallel(12)
def f(p,k):
    M = ModularSymbols(1,k,sign=1,base_ring=GF(p))
    S = M.cuspidal_subspace()
    T = S.hecke_matrix(p)
    r = T.rank()
    return dimension_cusp_forms(1,k) - r

def g(p):
    v = []
    for X in f([(p, k) for k in [12,14,..,(p+3)//2]]):
        if X[1] > 0:
            v.append(X)
    return v

def table(pmin, pmax):
    for p in primes(pmin, pmax+1):
        open('table-defect.txt','a').write('%s %s\n'%(p, g(p)))
