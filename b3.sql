drop table if exists drivers;

create table drivers (
    id int primary key auto_increment,
    driver_name varchar(255),
    status varchar(50),
    trust_score int,
    distance_km decimal(5,2)
);

insert into drivers (driver_name, status, trust_score, distance_km) 
values
('nguyen van a', 'available', 85, 1.5),
('tran thi b', 'available', 90, 1.5),
('le van c', 'busy', 95, 0.5),
('pham van d', 'available', 75, 0.8),
('hoang thi e', 'available', 82, 2.0),
('ngo van f', 'available', 80, 1.2);

select driver_name, status, trust_score, distance_km
from drivers
where status = 'available' 
and trust_score >= 80
order by distance_km asc, trust_score desc;