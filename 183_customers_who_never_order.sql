SELECT Name FROM Customers c WHERE c.Id NOT IN
    (SELECT CustomerId FROM Orders o)