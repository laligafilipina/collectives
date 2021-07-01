def proper_fractions(n):
    phi = n > 1 and n
    for p in range(2, int(n ** .5) + 1):
        if not n % p:
            phi -= phi // p
            while not n % p:
                n //= p
    if n > 1: phi -= phi // n
    return phi
