def sol_equa(n):
    return [[(n/i + i)/2,(n/i - i)/4] for i in range(1, int(n ** 0.5) + 1)
    if n % i == 0 and (n/i + i) % 2 ==0 and (n/i - i) % 4 ==0]
