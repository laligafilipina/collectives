#solution part @1
def queue_time(customers, n):
    tills = [0]*n
    for i in customers:
         tills[0] += i; tills.sort()
    return max(tills)

#solution part @2
class MarketQueue():
    
    def __init__(self,customers,n):
        self.customers = customers
        self.n=n
        self.timer = 0
        self.active_checkouts = []
        
    def calculate_total_time(self):
        while self.customers:
            self.process_queue()   
        return self.timer

    def process_queue(self):
        if len(self.active_checkouts) < self.n:
            queue_index = self.n - len(self.active_checkouts)
            self.active_checkouts.extend(self.customers[:queue_index])
            self.customers[:queue_index] = []
        while self.active_checkouts and (len(self.active_checkouts) == self.n or not self.customers) :
            self.timer += 1
            self.process_active_checkouts()
    
    def process_active_checkouts(self):
        finished_customers = []
        for index,customer in enumerate(self.active_checkouts):
            if customer > 1:
                self.active_checkouts[index] = int(customer-1)
            else:
                finished_customers.append(customer)
        
        for finished in finished_customers:
            self.active_checkouts.remove(finished)

# implementing requirements
def queue_time(customers,n):
    return MarketQueue(customers,n).calculate_total_time()

