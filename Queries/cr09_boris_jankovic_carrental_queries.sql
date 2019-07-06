
--Shows booking dates for all bookings made in 2019 with the car model that was booked
select booking.booking_from , booking.booking_to , cars.model 
from `booking` 
inner join `cars` on cars.fk_booking = booking.booking_id 
where booking.booking_from like '2019%'
-- Example 1 Example 1 Example 1 Example 1 Example 1 Example 1 Example 1 


--Shows the Rental store Manager's Name and the address of the Rental Store where they work
select manager.first_name , manager.hire_date , address.street_name , address.house_nr , address.zip 
from `manager`
inner join `rental_store` on rental_store.fk_manager = manager.manager_id
inner join `address`  on rental_store.fk_address = address.address_id
-- Example 2 Example 2 Example 2 Example 2 Example 2 Example 2 Example 2 


--Shows Cars , their construction year, when their last service was and when the next service is due
select cars.model , cars.manufacturer , cars.construction_year , service.last_service , service.next_service
from `cars`
inner join `service` on service.service_id = cars.fk_service
-- Example 3 Example 3 Example 3 Example 3 Example 3 Example 3 Example 3 

--Shows Customer Name, car model and manufacturer and the dates the customer booked the car
select customer.first_name , customer.last_name , cars.model , cars.manufacturer , booking.booking_from, booking.booking_to 
from `booking`
inner join `customer` on booking.fk_customer = customer.customer_id
inner join `cars` on cars.fk_booking = booking.booking_id
-- Example 4 Example 4 Example 4 Example 4 Example 4 Example 4 Example 4 