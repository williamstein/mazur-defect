@parallel(32)
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


def parse_table():
    out = open('table-detmod-report.txt','w')
    total = 0
    for X in open('table-detmod.txt').readlines():
        i = X.find(' ')
        p = int(X[:i])
        v = eval(X[i+1:])
        n = len([x for x in v if x==0])
        out.write('%s %s\n'%(p,n))
        total += n
    out.write('\n\n TOTAL: %s\n'%total)
