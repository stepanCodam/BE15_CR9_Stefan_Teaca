--Select all  number of rows from all tables
SELECT COUNT(*) from customer;
SELECT COUNT(*) from payment;
SELECT COUNT(*) from products;
SELECT COUNT(*) from shipping;
SELECT COUNT(*) from shippingcompany;

--Selects the row from the table customer where the last name of the customer is Vasques
SELECT f_name FROM customer WHERE l_name = "Vasques";

--Select the username and payment method of the user(s) who's payment date was 2022-01-05
SELECT username, fk_payment_method FROM customer
JOIN products ON products.fk_user_id = customer.user_id
JOIN payment ON payment.fk_prod_id = products.prod_id
WHERE payment.payment_date ="2022-01-05";

--Select the username who's shipping location is Spain
SELECT username FROM customer 
JOIN location ON fk_user_id = user_id 
JOIN shipping ON fk_shipping_id = shipping_id 
WHERE location.country_name = "Spain";

--Select the company which has sent anything to Brazil
SELECT company_name FROM shippingcompany 
JOIN shipping ON fk_company_id = company_id 
JOIN location ON fk_shipping_id = shipping_id 
WHERE location.country_name = "Brazil";

--Select the products which have been delivered between 2022-05-30 and 2022-06-05 and show them

SELECT prod_name FROM products
JOIN payment ON fk_prod_id = prod_id
JOIN shippingcompany ON fk_invoice_number = invoice_number
JOIN shipping ON fk_company_id = company_id
WHERE shipping.shipping_date BETWEEN "2022-05-30" AND "2022-06-05";