DROP DATABASE [IF EXISTS] computerparts;
CREATE DATABASE computerparts;
USE computerparts;

CREATE TABLE motherboard (
    serial_number varchar(10) NOT NULL, 
    name varchar(50), ram_slots int NOT NULL, 
    ram_type varchar(4) NOT NULL, 
    form_factor varchar(5) NOT NULL, 
    socket varchar(10) NOT NULL,
    PRIMARY KEY (serial_number)
    );

CREATE TABLE central_processing_unit (
    serial_number varchar(10) NOT NULL, 
    name varchar(50) NOT NULL, 
    motherboard_sn varchar(10) NOT NULL,
    tdp int NOT NULL, 
    core_count int NOT NULL, 
    smt varchar(3) NOT NULL, 
    socket varchar(10) NOT NULL,
    PRIMARY KEY (serial_number),
    FOREIGN KEY (motherboard_sn) 
    REFERENCES motherboard(serial_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE
  );

CREATE TABLE cpu_cooler (
    serial_number varchar(10) NOT NULL, 
    name varchar(50) NOT NULL, 
    motherboard_sn varchar(10) NOT NULL, 
    fan_rpm int NOT NULL, 
    noise_level int NOT NULL, 
    socket varchar(10) NOT NULL,
    PRIMARY KEY (serial_number),
    FOREIGN KEY (motherboard_sn) 
    REFERENCES motherboard(serial_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

CREATE TABLE graphics_processing_unit (
    serial_number varchar(10) NOT NULL, 
    name varchar(50) NOT NULL, 
    motherboard_sn varchar(10) NOT NULL, 
    core_clock int NOT NULL, 
    memory int NOT NULL, 
    gpu_length int NOT NULL,
    PRIMARY KEY (serial_number),
    FOREIGN KEY (motherboard_sn) 
    REFERENCES motherboard(serial_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

CREATE TABLE computer_case (
    serial_number varchar(10) NOT NULL, 
    name varchar(50) NOT NULL, 
    motherboard_sn varchar(10) NOT NULL, 
    psu_sn varchar(10) NOT NULL, 
    gpu_space int NOT NULL, 
    storage_bays int NOT NULL,
    PRIMARY KEY (serial_number),
    FOREIGN KEY (motherboard_sn) 
    REFERENCES motherboard(serial_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (psu_sn) 
    REFERENCES motherboard(serial_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

CREATE TABLE power_supply (
    serial_number varchar(10) NOT NULL, 
    name varchar(50) NOT NULL, 
    wattage int NOT NULL, 
    modular int NOT NULL, 
    efficiency_rating int NOT NULL, 
    form_factor varchar(4) NOT NULL,
    PRIMARY KEY (serial_number)
    );

CREATE TABLE storage_drive (
    serial_number varchar(10) NOT NULL, 
    name varchar(50) NOT NULL, 
    case_sn varchar(10) NOT NULL, 
    capacity int NOT NULL, 
    interface varchar(4) NOT NULL, 
    form_factor varchar(4) NOT NULL,
    PRIMARY KEY (serial_number),
    FOREIGN KEY (case_sn) 
    REFERENCES motherboard(serial_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

CREATE TABLE random_access_memory (
    serial_number varchar(10) NOT NULL, 
    name varchar(50) NOT NULL, 
    motherboard_sn varchar(10) NOT NULL, 
    capacity int NOT NULL, 
    number_of_modules int NOT NULL, 
    type varchar(4) NOT NULL,
    PRIMARY KEY (serial_number),
    FOREIGN KEY (motherboard_sn) 
    REFERENCES motherboard(serial_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );

CREATE TABLE cooling (
    cpu_sn varchar(10) NOT NULL, 
    cooler_sn varchar(50) NOT NULL,
    PRIMARY KEY (cpu_sn, cooler_sn));

#Insert entries into the motherboard table
INSERT INTO motherboard (
    serial_number, name , ram_slots, ram_type, form_factor, socket) 
    VALUES ("M123456781", "Asus Prime x370", 4, "ddr4", "atx", "am4");
INSERT INTO motherboard (
    serial_number, name , ram_slots, ram_type, form_factor, socket) 
    VALUES ("M123456782", "Gigabyte ds3h", 4, "ddr3", "atx", "lga1155");
INSERT INTO motherboard (
    serial_number, name , ram_slots, ram_type, form_factor, socket) 
    VALUES ("M123456783", "Asus x99-pro", 8, "ddr4", "atx", "lga2011v3");
INSERT INTO motherboard (
    serial_number, name , ram_slots, ram_type, form_factor, socket) 
    VALUES ("M123456784", "Aus ROG Zenith Extreme", 8, "ddr4", "e-atx", "tr4");
INSERT INTO motherboard (
    serial_number, name , ram_slots, ram_type, form_factor, socket) 
    VALUES ("M123456785", "Aorus pro ac wifi ", 2, "ddr4", "m-itx", "am4");

#Insert entries into the cpu table
INSERT INTO central_processing_unit (
    serial_number, name, motherboard_sn, tdp, core_count, smt, socket)
    VALUES ("C123456781", "Amd Ryzen 5 1600", "M123456781", 65, 6, "yes", "am4");
INSERT INTO central_processing_unit (
    serial_number, name, motherboard_sn, tdp, core_count, smt, socket)
    VALUES ("C123456782", "Intel Core i5 3570k", "M123456782", 77, 4, "no", "lga1155");
INSERT INTO central_processing_unit (
    serial_number, name, motherboard_sn, tdp, core_count, smt, socket)
    VALUES ("C123456783", "Intel Core i7 5820k", "M123456783", 140, 6, "yes", "lga2011v3");
INSERT INTO central_processing_unit (
    serial_number, name, motherboard_sn, tdp, core_count, smt, socket)
    VALUES ("C123456784", "Amd Threadripper 3970X", "M123456784", 280 , 32, "yes", "tr4");
INSERT INTO central_processing_unit (
    serial_number, name, motherboard_sn, tdp, core_count, smt, socket)
    VALUES ("C123456785", "Amd Ryzen 7 1800x", "M123456785", 95, 8, "yes", "am4");

#Insert entries into the cpu cooler table
INSERT INTO cpu_cooler (
    serial_number, name, motherboard_sn, fan_rpm, noise_level, socket)
    VALUES ("CC12345671", "Corsair h100i", "M123456781", 2200, 20, "am4");
INSERT INTO cpu_cooler (
    serial_number, name, motherboard_sn, fan_rpm, noise_level, socket)
    VALUES ("CC12345672", "Intel Stock Cooler", "M123456782", 1200, 30, "lga1155");
INSERT INTO cpu_cooler (
    serial_number, name, motherboard_sn, fan_rpm, noise_level, socket)
    VALUES ("CC12345673", "EK Supremecy Evo", "M123456783", 2200, 15, "lga2011v3");
INSERT INTO cpu_cooler (
    serial_number, name, motherboard_sn, fan_rpm, noise_level, socket)
    VALUES ("CC12345674", "Dual stack noctua cooler", "M123456784", 1800, 35, "tr4");
INSERT INTO cpu_cooler (
    serial_number, name, motherboard_sn, fan_rpm, noise_level, socket)
    VALUES ("CC12345675", "NZXT Kraken", "M123456785", 2200, 20, "am4");