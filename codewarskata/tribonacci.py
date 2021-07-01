def tribonacci(signature, n):
    res = signature[:n]
    for i in range(n - 3): res.append(sum(res[-3:]))
    return res
signature=[1,1,1]
n=10
print(tribonacci(signature,n))
