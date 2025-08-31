CREATE DATABASE Space_Missions;

USE Space_Missions;

CREATE TABLE Agencies(
   Agency_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
   Agency_name NVARCHAR(100) NOT NULL,
   Country NVARCHAR(100) NOT NULL,
   Founded_year SMALLINT NOT NULL,
   Budget_billion_usd DECIMAL(10,2)
);



CREATE TABLE Missions(
     Mission_id INT PRIMARY KEY IDENTITY(1,1),
     Mission_name NVARCHAR(100) NOT NULL,
     Destination  NVARCHAR(100) NOT NULL,
     Mission_type NVARCHAR(100) NOT NULL,
     Status NVARCHAR(20) NOT NULL CHECK (status IN ('Completed','Planned','Failed','Ongoing')),
     launch_date DATE NOT NULL,
     duration_days INT CHECK (duration_days >= 0),
     Agency_id INT  FOREIGN KEY REFERENCES Agencies(Agency_id)

);




CREATE TABLE Spacecraft(
     Spacecraft_id INT PRIMARY KEY IDENTITY(1,1),
     Spacecraft_name NVARCHAR(100) NOT NULL,
     Manufacturer    NVARCHAR(100) NOT NULL,
     Type NVARCHAR(50) NOT NULL,
     Cost_million_usd DECIMAL(10,2),
     first_launch_year INT,
     Mission_id INT NOT NULL FOREIGN KEY REFERENCES Missions(Mission_id)

);


CREATE TABLE Astronauts (
    Astronaut_id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Nationality NVARCHAR(50) NOT NULL,
    Gender NVARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female')),
    Birth_year INT NOT NULL,
    Missions_count INT CHECK (missions_count >= 0)
);


CREATE TABLE Mission_Crew (
    Mission_id INT NOT NULL FOREIGN KEY REFERENCES Missions(mission_id),
    Astronaut_id INT NOT NULL FOREIGN KEY REFERENCES Astronauts(astronaut_id),
    Role NVARCHAR(50) NOT NULL CHECK (role IN ('Commander','Pilot','Mission Specialist','Flight Engineer',
       'Payload Specialist',
       'Scientist',
        'Engineer'
    )),
    PRIMARY KEY (mission_id, astronaut_id)
);

INSERT INTO Agencies (Agency_name, Country, Founded_year, Budget_billion_usd) VALUES
('NASA','USA',1958,25.2000),
('ESA','Europe',1975,7.1500),
('Roscosmos','Russia',1992,3.2700),
('CNSA','China',1993,11.0000),
('ISRO','India',1969,1.9000),
('JAXA','Japan',2003,2.0500),
('CSA','Canada',1989,0.3000),
('CNES','France',1961,2.0000),
('UK Space Agency','UK',2010,0.6500),
('DLR','Germany',1969,1.1000),
('ASI','Italy',1988,0.9500),
('KARI','South Korea',1989,0.4500),
('AEB','Brazil',1994,0.4000),
('Australian Space Agency','Australia',2018,0.2500),
('Mexican Space Agency','Mexico',2010,0.0032),
('Turkish Space Agency','Turkey',2018,0.3700),
('NASRDA','Nigeria',1999,0.0500),
('ISRAEL Space Agency','Israel',1983,0.1000),
('SANSA','South Africa',2010,0.1500),
('Luxembourg Space Agency','Luxembourg',2018,0.1000),
('New Zealand Space Agency','New Zealand',2016,0.1200),
('UAE Space Agency','UAE',2014,0.5400),
('SRI (Sweden)','Sweden',1972,0.2000),
('Norwegian Space Agency','Norway',1987,0.1000),
('POLSA','Poland',2014,0.0800),
('ROSA','Romania',1991,0.0500),
('Portuguese Space Agency','Portugal',2019,0.0600),
('Greek Space Agency','Greece',2018,0.0400),
('Czech Space Office','Czech Republic',2003,0.0500),
('Netherlands Space Office','Netherlands',2009,0.1100),
('Belgian Institute for Space Aeronomy','Belgium',1964,0.0900),
('Finnish Space Committee','Finland',1987,0.0600),
('Swiss Space Office','Switzerland',1992,0.1200),
('Austrian Space Agency','Austria',1972,0.0700),
('Hungarian Space Office','Hungary',1992,0.0400),
('Slovenian Centre of Excellence','Slovenia',2009,0.0200),
('Slovak Space Office','Slovakia',2019,0.0200),
('Irish Space Office','Ireland',1987,0.0300),
('Spanish INTA','Spain',1942,0.8000),
('KACST Space Program','Saudi Arabia',2018,0.4000),
('SUPARCO','Pakistan',1961,0.0800),
('ANGKASA','Malaysia',2002,0.0600),
('Vietnam Space Center','Vietnam',2011,0.1500),
('Philippine Space Agency','Philippines',2019,0.0800),
('Kenya Space Agency','Kenya',2017,0.0300),
('Ethiopian Space Science','Ethiopia',2016,0.0200),
('Egyptian Space Agency','Egypt',2018,0.1000),
('Argentine CONAE','Argentina',1991,0.1000),
('Peruvian Space Agency','Peru',2006,0.0300),
('Bolivian Space Agency','Bolivia',2010,0.0300),
('Mongolian Space Agency','Mongolia',2010,0.0200),
('Moroccan CRERS','Morocco',1989,0.0300),
('Ukrainian Space Agency','Ukraine',1992,0.2000),
('Belarus Space','Belarus',2009,0.0400),
('Lithuanian Space Association','Lithuania',2009,0.0200),
('Latvian Space Office','Latvia',2009,0.0200),
('Serbian Office for Space Sciences','Serbia',2010,0.0200),
('Azercosmos','Azerbaijan',2010,0.0500),
('Bahrain NSSA','Bahrain',2014,0.0300),
('Qatar Space Program','Qatar',2018,0.0500),
('Oman National Space Program','Oman',2019,0.0300),
('Tunisian Space Association','Tunisia',2013,0.0200),
('ASAL','Algeria',2002,0.0700),
('Ghana Space Science','Ghana',2012,0.0200),
('Ivory Coast Space Initiative','Côte d’Ivoire',2018,0.0100),
('Angolan National Space','Angola',2013,0.0300),
('ZINGSA','Zimbabwe',2018,0.0200),
('SPARRSO','Bangladesh',1980,0.0500),
('Bhutan Space Program','Bhutan',2016,0.0100),
('Sri Lanka Space Program','Sri Lanka',2018,0.0200),
('NESRA','Nepal',2016,0.0100),
('GISTDA','Thailand',2000,0.1000),
('Singapore Space & Technology','Singapore',2001,0.0600),
('Iranian Space Agency','Iran',2004,0.2000),
('Iraq Space Program','Iraq',2015,0.0200),
('Kuwait Space Program','Kuwait',2018,0.0200),
('QZS Program','Japan',2010,0.2000),
('South Sudan Space Initiative','South Sudan',2018,0.0100),
('NSIL','India',2019,0.5000),
('SpaceX','USA',2002,2.0000),
('Blue Origin','USA',2000,1.5000),
('Rocket Lab','New Zealand',2006,0.3000),
('Virgin Galactic','USA',2004,0.2000),
('Relativity Space','USA',2015,0.1000),
('Axiom Space','USA',2016,0.2000);




select Mission_id from Missions where Mission_id=372



INSERT INTO Missions (Mission_name, Destination, Mission_type, Status, launch_date, duration_days, Agency_id) VALUES
-- Apollo program (نماذج)
('Apollo 7','Low Earth Orbit','Manned','Completed','1968-10-11',11,1),
('Apollo 8','Moon','Manned','Completed','1968-12-21',6,1),
('Apollo 11','Moon','Manned','Completed','1969-07-16',8,1),
('Apollo 12','Moon','Manned','Completed','1969-11-14',10,1),
('Apollo 13','Moon','Manned','Failed','1970-04-11',6,1),
('Apollo 14','Moon','Manned','Completed','1971-01-31',9,1),
('Apollo 15','Moon','Manned','Completed','1971-07-26',12,1),
('Apollo 16','Moon','Manned','Completed','1972-04-16',11,1),
('Apollo 17','Moon','Manned','Completed','1972-12-07',12,1),

-- Space Shuttle (نماذج بارزة)
('STS-1 Columbia','Low Earth Orbit','Manned','Completed','1981-04-12',2,1),
('STS-31 (Hubble Deploy)','Low Earth Orbit','Manned','Completed','1990-04-24',6,1),
('STS-61 (Hubble Servicing 1)','Low Earth Orbit','Manned','Completed','1993-12-02',11,1),
('STS-95 Discovery','Low Earth Orbit','Manned','Completed','1998-10-29',9,1),
('STS-107 Columbia','Low Earth Orbit','Manned','Failed','2003-01-16',16,1),

-- ISS expeditions (نماذج)
('ISS Expedition 1','Low Earth Orbit','Space Station','Completed','2000-10-31',136,1),
('ISS Expedition 2','Low Earth Orbit','Space Station','Completed','2001-03-08',163,1),
('ISS Expedition 26','Low Earth Orbit','Space Station','Completed','2010-11-26',159,1),
('ISS Expedition 64','Low Earth Orbit','Space Station','Completed','2020-10-14',173,1),
('ISS Expedition 68','Low Earth Orbit','Space Station','Ongoing','2022-09-21',500,1),

-- Deep space / planetary exploration
('Voyager 1','Interstellar Space','Deep Space Mission','Ongoing','1977-09-05',17500,1),
('Voyager 2','Interstellar Space','Deep Space Mission','Ongoing','1977-08-20',17550,1),
('Pioneer 10','Deep Space','Deep Space Mission','Completed','1972-03-03',11400,1),
('Pioneer 11','Deep Space','Deep Space Mission','Completed','1973-04-06',9500,1),
('New Horizons','Pluto and Kuiper Belt','Deep Space Mission','Ongoing','2006-01-19',7100,1),
('Juno','Jupiter','Planetary Exploration','Ongoing','2011-08-05',5100,1),
('Dawn','Vesta and Ceres','Planetary Exploration','Completed','2007-09-27',4080,1),
('Cassini–Huygens (NASA/ESA/ASI)','Saturn','Planetary Exploration','Completed','1997-10-15',7280,1),

-- Mars (روفر/لاندر/مداري)
('Viking 1','Mars','Lander','Completed','1975-08-20',2245,1),
('Viking 2','Mars','Lander','Completed','1975-09-09',1281,1),
('Mars Pathfinder','Mars','Planetary Exploration','Completed','1996-12-04',224,1),
('Spirit (MER-A)','Mars','Rover','Completed','2003-06-10',2210,1),
('Opportunity (MER-B)','Mars','Rover','Completed','2003-07-07',5460,1),
('Phoenix Mars Lander','Mars','Lander','Completed','2007-08-04',300,1),
('Curiosity (MSL)','Mars','Rover','Ongoing','2011-11-26',4600,1),
('InSight','Mars','Lander','Completed','2018-05-05',1450,1),
('Mars 2020 Perseverance','Mars','Rover','Ongoing','2020-07-30',1500,1),

-- Lunar / Artemis-related
('Artemis I','Moon','Unmanned','Completed','2022-11-16',25,1),
('CAPSTONE','Cislunar','Planetary Exploration','Completed','2022-06-28',450,1),

-- Space telescopes / Earth obs
('Hubble Space Telescope','Low Earth Orbit','Space Telescope','Ongoing','1990-04-24',12900,1),
('Chandra X-ray Observatory','High Earth Orbit','Space Telescope','Ongoing','1999-07-23',9500,1),
('James Webb Space Telescope','Sun-Earth L2','Space Telescope','Ongoing','2021-12-25',960,2), -- ملاحظة: JWST تقوده NASA بالشراكة مع ESA/CSA، لكن تم إدراجه أعلاه لـ ESA أيضاً؛ هنا نحافظ على الدقة بوضع الـ Agency_id للقيادة الرئيسية لاحقاً. سنُدرجه تحت ESA في كتلتها مع Agency_id=2 فقط. احذف هذا السطر لو هتكتفي بكتلة ESA له.
('TESS','High Earth Orbit','Space Telescope','Ongoing','2018-04-18',2400,1),
('Kepler','Heliocentric Orbit','Space Telescope','Completed','2009-03-07',3350,1),
('Spitzer Space Telescope','Heliocentric Orbit','Space Telescope','Completed','2003-08-25',6000,1),
('WMAP','Sun-Earth L2','Space Telescope','Completed','2001-06-30',3650,1),
('Landsat 8','Sun-Synchronous Orbit','Earth Observation','Ongoing','2013-02-11',4300,1),
('Landsat 9','Sun-Synchronous Orbit','Earth Observation','Ongoing','2021-09-27',1400,1),
('Terra','Sun-Synchronous Orbit','Earth Observation','Ongoing','1999-12-18',8900,1),
('Aqua','Sun-Synchronous Orbit','Earth Observation','Ongoing','2002-05-04',8000,1),
('ICESat-2','Sun-Synchronous Orbit','Earth Observation','Ongoing','2018-09-15',2500,1),
('OCO-2','Sun-Synchronous Orbit','Earth Observation','Ongoing','2014-07-02',4000,1),

-- Solar / heliophysics
('Parker Solar Probe','Sun','Deep Space Mission','Ongoing','2018-08-12',2550,1),
('SOHO (NASA/ESA)','Sun-Earth L1','Space Telescope','Ongoing','1995-12-02',10800,1),
-- Planetary / cometary
('Rosetta','Comet 67P/Churyumov–Gerasimenko','Planetary Exploration','Completed','2004-03-02',4011,2),
('Mars Express','Mars','Planetary Exploration','Ongoing','2003-06-02',7700,2),
('Venus Express','Venus','Planetary Exploration','Completed','2005-11-09',3300,2),
('BepiColombo (ESA/JAXA)','Mercury','Planetary Exploration','Ongoing','2018-10-20',2500,2),
('JUICE','Jupiter System','Planetary Exploration','Ongoing','2023-04-14',800,2),

-- Space telescopes / astronomy
('Gaia','Sun-Earth L2','Space Telescope','Ongoing','2013-12-19',3900,2),
('XMM-Newton','High Earth Orbit','Space Telescope','Ongoing','1999-12-10',9000,2),
('Herschel Space Observatory','Sun-Earth L2','Space Telescope','Completed','2009-05-14',1500,2),
('Planck','Sun-Earth L2','Space Telescope','Completed','2009-05-14',1550,2),
('James Webb Space Telescope (with NASA/CSA)','Sun-Earth L2','Space Telescope','Ongoing','2021-12-25',960,2),

-- Earth Observation (Copernicus + بعثات أخرى)
('Envisat','Sun-Synchronous Orbit','Earth Observation','Failed','2002-03-01',3700,2),
('CryoSat-2','Sun-Synchronous Orbit','Earth Observation','Ongoing','2010-04-08',5000,2),
('Sentinel-1A','Sun-Synchronous Orbit','Earth Observation','Ongoing','2014-04-03',3700,2),
('Sentinel-1B','Sun-Synchronous Orbit','Earth Observation','Failed','2016-04-25',2300,2),
('Sentinel-2A','Sun-Synchronous Orbit','Earth Observation','Ongoing','2015-06-23',3200,2),
('Sentinel-2B','Sun-Synchronous Orbit','Earth Observation','Ongoing','2017-03-07',2900,2),
('Sentinel-3A','Sun-Synchronous Orbit','Earth Observation','Ongoing','2016-02-16',3000,2),
('Sentinel-3B','Sun-Synchronous Orbit','Earth Observation','Ongoing','2018-04-25',2400,2),
('Sentinel-5P','Sun-Synchronous Orbit','Earth Observation','Ongoing','2017-10-13',2500,2),
('MetOp-A','Sun-Synchronous Orbit','Earth Observation','Completed','2006-10-19',4000,2),
('MetOp-B','Sun-Synchronous Orbit','Earth Observation','Ongoing','2012-09-17',3500,2),
('MetOp-C','Sun-Synchronous Orbit','Earth Observation','Ongoing','2018-11-07',2000,2),
-- Solar missions
('Solar Orbiter (ESA/NASA)','Heliocentric Orbit','Deep Space Mission','Ongoing','2020-02-10',1900,2),
-- Navigation (Galileo)
('Galileo IOV-1','Medium Earth Orbit','Satellite Deployment','Completed','2011-10-21',3650,2),
('Galileo IOV-2','Medium Earth Orbit','Satellite Deployment','Completed','2012-10-12',3650,2),
('Galileo FOC Batch 1','Medium Earth Orbit','Satellite Deployment','Ongoing','2014-08-22',3650,2),
('Galileo FOC Batch 2','Medium Earth Orbit','Satellite Deployment','Ongoing','2015-03-27',3650,2),
-- أول أقمار صناعية
('Sputnik 1','Low Earth Orbit','Satellite Deployment','Completed','1957-10-04',21,3),
('Sputnik 2','Low Earth Orbit','Satellite Deployment','Completed','1957-11-03',162,3),
('Sputnik 3','Low Earth Orbit','Satellite Deployment','Completed','1958-05-15',692,3),
-- برنامج Vostok
('Vostok 1','Low Earth Orbit','Manned','Completed','1961-04-12',1,3),
('Vostok 2','Low Earth Orbit','Manned','Completed','1961-08-06',1,3),
('Vostok 3','Low Earth Orbit','Manned','Completed','1962-08-11',4,3),
('Vostok 4','Low Earth Orbit','Manned','Completed','1962-08-12',3,3),
('Vostok 5','Low Earth Orbit','Manned','Completed','1963-06-14',5,3),
('Vostok 6','Low Earth Orbit','Manned','Completed','1963-06-16',3,3),
-- برنامج Voskhod
('Voskhod 1','Low Earth Orbit','Manned','Completed','1964-10-12',1,3),
('Voskhod 2','Low Earth Orbit','Manned','Completed','1965-03-18',1,3),
-- برنامج Luna (القمر)
('Luna 2','Moon','Lunar Mission','Completed','1959-09-12',2,3),
('Luna 3','Moon','Lunar Mission','Completed','1959-10-04',12,3),
('Luna 9','Moon','Lunar Mission','Completed','1966-01-31',3,3),
('Luna 10','Moon','Lunar Mission','Completed','1966-03-31',56,3),
('Luna 16','Moon','Sample Return','Completed','1970-09-12',12,3),
('Luna 17','Moon','Rover','Completed','1970-11-10',322,3),
('Luna 20','Moon','Sample Return','Completed','1972-02-14',12,3),
('Luna 24','Moon','Sample Return','Completed','1976-08-09',13,3),
-- Mars Program
('Mars 2','Mars','Planetary Exploration','Failed','1971-05-19',0,3),
('Mars 3','Mars','Planetary Exploration','Completed','1971-05-28',1,3),
('Phobos 1','Mars','Planetary Exploration','Failed','1988-07-07',0,3),
('Phobos 2','Mars','Planetary Exploration','Failed','1988-07-12',57,3),
-- محطة الفضاء Salyut
('Salyut 1','Low Earth Orbit','Space Station','Completed','1971-04-19',175,3),
('Salyut 6','Low Earth Orbit','Space Station','Completed','1977-09-29',1764,3),
('Salyut 7','Low Earth Orbit','Space Station','Completed','1982-04-19',3216,3),
-- محطة الفضاء Mir
('Mir EO-1','Low Earth Orbit','Space Station','Completed','1986-03-13',365,3),
('Mir EO-4','Low Earth Orbit','Space Station','Completed','1988-12-21',179,3),
('Mir EO-15','Low Earth Orbit','Space Station','Completed','1993-07-01',180,3),
('Mir EO-28','Low Earth Orbit','Space Station','Completed','2000-04-04',73,3),
-- برنامج Soyuz (نماذج مختارة)
('Soyuz 1','Low Earth Orbit','Manned','Failed','1967-04-23',2,3),
('Soyuz 11','Low Earth Orbit','Manned','Failed','1971-06-06',22,3),
('Soyuz TMA-1','Low Earth Orbit','Manned','Completed','2002-10-30',10,3),
('Soyuz MS-10','Low Earth Orbit','Manned','Failed','2018-10-11',0,3),
('Soyuz MS-17','Low Earth Orbit','Manned','Completed','2020-10-14',183,3),
-- مشاركات في ISS
('ISS Expedition 3','Low Earth Orbit','Space Station','Completed','2001-08-10',127,3),
('ISS Expedition 24','Low Earth Orbit','Space Station','Completed','2010-06-15',163,3),
('ISS Expedition 50','Low Earth Orbit','Space Station','Completed','2016-10-19',173,3),
('ISS Expedition 64','Low Earth Orbit','Space Station','Completed','2020-10-14',173,3),
('ISS Expedition 68','Low Earth Orbit','Space Station','Ongoing','2022-09-21',500,3),
-- أول أقمار صناعية
('Dong Fang Hong 1','Low Earth Orbit','Satellite Deployment','Completed','1970-04-24',28,4),
-- برنامج Shenzhou (مأهول)
('Shenzhou 1','Low Earth Orbit','Test/Prototype','Completed','1999-11-19',0,4),
('Shenzhou 2','Low Earth Orbit','Unmanned','Completed','2001-01-09',7,4),
('Shenzhou 3','Low Earth Orbit','Unmanned','Completed','2002-03-25',7,4),
('Shenzhou 4','Low Earth Orbit','Unmanned','Completed','2002-12-29',6,4),
('Shenzhou 5','Low Earth Orbit','Manned','Completed','2003-10-15',1,4),
('Shenzhou 6','Low Earth Orbit','Manned','Completed','2005-10-12',5,4),
('Shenzhou 7','Low Earth Orbit','Manned','Completed','2008-09-25',3,4),
('Shenzhou 9','Low Earth Orbit','Manned','Completed','2012-06-16',13,4),
('Shenzhou 10','Low Earth Orbit','Manned','Completed','2013-06-11',15,4),
('Shenzhou 11','Low Earth Orbit','Manned','Completed','2016-10-17',33,4),
('Shenzhou 12','Low Earth Orbit','Manned','Completed','2021-06-17',90,4),
('Shenzhou 13','Low Earth Orbit','Manned','Completed','2021-10-15',183,4),
('Shenzhou 14','Low Earth Orbit','Manned','Completed','2022-06-05',183,4),
('Shenzhou 15','Low Earth Orbit','Manned','Completed','2022-11-29',183,4),
('Shenzhou 16','Low Earth Orbit','Manned','Completed','2023-05-30',180,4),
('Shenzhou 17','Low Earth Orbit','Manned','Ongoing','2023-10-26',300,4),
-- برنامج Tiangong (محطات فضائية)
('Tiangong-1','Low Earth Orbit','Space Station','Completed','2011-09-29',1630,4),
('Tiangong-2','Low Earth Orbit','Space Station','Completed','2016-09-15',850,4),
('Tiangong Space Station Module Tianhe','Low Earth Orbit','Space Station','Ongoing','2021-04-29',1400,4),
('Tiangong Space Station Module Wentian','Low Earth Orbit','Space Station','Ongoing','2022-07-24',800,4),
('Tiangong Space Station Module Mengtian','Low Earth Orbit','Space Station','Ongoing','2022-10-31',750,4),
-- برنامج Chang’e (القمر)
(N'Chang’e 1','Moon','Lunar Mission','Completed','2007-10-24',494,4),
(N'Chang’e 2','Moon','Lunar Mission','Completed','2010-10-01',945,4),
(N'Chang’e 3','Moon','Lunar Mission','Completed','2013-12-01',973,4),
(N'Chang’e 4','Moon','Lunar Mission','Ongoing','2018-12-07',2300,4),
(N'Chang’e 5','Moon','Sample Return','Completed','2020-11-23',23,4),
(N'Chang’e 6','Moon','Sample Return','Ongoing','2024-05-03',100,4),
-- برنامج Tianwen (كواكب)
('Tianwen-1','Mars','Planetary Exploration','Ongoing','2020-07-23',1500,4),
-- برامج أقمار صناعية كبيرة
('Gaofen-1','Sun-Synchronous Orbit','Earth Observation','Ongoing','2013-04-26',4300,4),
('Gaofen-2','Sun-Synchronous Orbit','Earth Observation','Ongoing','2014-08-19',3800,4),
('Gaofen-4','Geostationary Orbit','Earth Observation','Ongoing','2015-12-28',3400,4),
('Gaofen-7','Sun-Synchronous Orbit','Earth Observation','Ongoing','2019-11-03',2000,4),
('Beidou-3 M1','Medium Earth Orbit','Satellite Deployment','Completed','2015-03-30',3000,4),
('Beidou-3 IGSO-1','Inclined Geosynchronous Orbit','Satellite Deployment','Ongoing','2019-11-05',1800,4),
('Beidou-3 GEO-3','Geostationary Orbit','Satellite Deployment','Ongoing','2020-06-23',1600,4),
('Aryabhata','Low Earth Orbit','Satellite Deployment','Completed','1975-04-19',5,5),
('SLV-3 E1','Low Earth Orbit','Test/Prototype','Failed','1979-08-10',0,5),
('SLV-3 E2','Low Earth Orbit','Test/Prototype','Completed','1980-07-18',1,5),
('INSAT-1A','Geostationary Orbit','Satellite Deployment','Failed','1982-04-10',90,5),
('IRS-1A','Sun-Synchronous Orbit','Earth Observation','Completed','1988-03-17',3650,5),
('PSLV-D1','Low Earth Orbit','Test/Prototype','Failed','1993-09-20',0,5),
('PSLV-D2','Sun-Synchronous Orbit','Satellite Deployment','Completed','1994-10-15',3000,5),
('Chandrayaan-1','Moon','Lunar Mission','Completed','2008-10-22',312,5),
('Mangalyaan (Mars Orbiter Mission)','Mars','Planetary Exploration','Completed','2013-11-05',2990,5),
('PSLV-C37','Sun-Synchronous Orbit','Satellite Deployment','Completed','2017-02-15',3000,5),
('GSAT-29','Geostationary Orbit','Satellite Deployment','Completed','2018-11-14',2000,5),
('Chandrayaan-2','Moon','Lunar Mission','Failed','2019-07-22',48,5),
('PSLV-C51 (Amazonia-1)','Sun-Synchronous Orbit','Satellite Deployment','Completed','2021-02-28',2500,5),
('Chandrayaan-3','Moon','Lunar Mission','Completed','2023-07-14',45,5),
('Aditya-L1','Sun-Earth L1','Space Telescope','Ongoing','2023-09-02',300,5),
('Ohsumi','Low Earth Orbit','Satellite Deployment','Completed','1970-02-11',5,6),
('H-IIA F6','Low Earth Orbit','Test/Prototype','Failed','2003-11-29',0,6),
('Hayabusa','Asteroid Itokawa','Planetary Exploration','Completed','2003-05-09',2550,6),
('Kaguya (SELENE)','Moon','Lunar Mission','Completed','2007-09-14',504,6),
('Akatsuki','Venus','Planetary Exploration','Ongoing','2010-05-20',5000,6),
('Hayabusa2','Asteroid Ryugu','Sample Return','Completed','2014-12-03',2190,6),
('SLIM','Moon','Lunar Mission','Ongoing','2023-09-07',180,6),
('HTV-1','Low Earth Orbit','Space Station','Completed','2009-09-10',52,6),
('Kibo Module (ISS)','Low Earth Orbit','Space Station','Ongoing','2008-06-03',5800,6),
('XRISM','Sun-Earth L1','Space Telescope','Ongoing','2023-09-06',200,6),
('Alouette 1','Low Earth Orbit','Satellite Deployment','Completed','1962-09-29',3650,7),
('Alouette 2','Low Earth Orbit','Satellite Deployment','Completed','1965-11-29',3650,7),
('Radarsat-1','Sun-Synchronous Orbit','Earth Observation','Completed','1995-11-04',6570,7),
('Radarsat-2','Sun-Synchronous Orbit','Earth Observation','Ongoing','2007-12-14',5800,7),
('Radarsat Constellation Mission','Sun-Synchronous Orbit','Earth Observation','Ongoing','2019-06-12',1800,7),
('Canadarm (ISS)','Low Earth Orbit','Space Station','Ongoing','1981-11-13',15700,7),
('Dextre (ISS)','Low Earth Orbit','Space Station','Ongoing','2008-03-11',5800,7),
('Helios 1','Heliocentric Orbit','Planetary Exploration','Completed','1974-12-10',1850,8),
('Helios 2','Heliocentric Orbit','Planetary Exploration','Completed','1976-01-15',1800,8),
('Rosetta (ESA mission with DLR contribution)','Comet 67P','Planetary Exploration','Completed','2004-03-02',4011,8),
('Mars Express (ESA mission with DLR contribution)','Mars','Planetary Exploration','Ongoing','2003-06-02',7700,8),
('TerraSAR-X','Sun-Synchronous Orbit','Earth Observation','Ongoing','2007-06-15',5800,8),
('TanDEM-X','Sun-Synchronous Orbit','Earth Observation','Ongoing','2010-06-21',5000,8),
('Eu:CROPIS','Low Earth Orbit','Test/Prototype','Completed','2018-12-03',550,8),
('Astérix','Low Earth Orbit','Satellite Deployment','Completed','1965-11-26',720,9),
('SPOT-1','Sun-Synchronous Orbit','Earth Observation','Completed','1986-02-22',6600,9),
('SPOT-5','Sun-Synchronous Orbit','Earth Observation','Completed','2002-05-04',4800,9),
('Helios 1A','Sun-Synchronous Orbit','Earth Observation','Completed','1995-07-07',4200,9),
('Helios 2B','Sun-Synchronous Orbit','Earth Observation','Ongoing','2009-12-18',5200,9),
('Jason-1','Low Earth Orbit','Earth Observation','Completed','2001-12-07',4700,9),
('Jason-3','Low Earth Orbit','Earth Observation','Ongoing','2016-01-17',3000,9),
('SIRIO','Geostationary Orbit','Satellite Deployment','Completed','1977-08-26',2700,10),
('BeppoSAX','Low Earth Orbit','Space Telescope','Completed','1996-04-30',2280,10),
('COSMO-SkyMed 1','Sun-Synchronous Orbit','Earth Observation','Ongoing','2007-06-08',5800,10),
('COSMO-SkyMed 2','Sun-Synchronous Orbit','Earth Observation','Ongoing','2007-12-09',5800,10),
('COSMO-SkyMed 3','Sun-Synchronous Orbit','Earth Observation','Ongoing','2008-10-25',5700,10),
('COSMO-SkyMed 4','Sun-Synchronous Orbit','Earth Observation','Ongoing','2010-11-05',5000,10),
('AGILE','Low Earth Orbit','Space Telescope','Ongoing','2007-04-23',6200,10),
('Prospero','Low Earth Orbit','Satellite Deployment','Completed','1971-10-28',1460,11),
('Skynet 1A','Geostationary Orbit','Satellite Deployment','Completed','1969-11-22',3650,11),
('Skynet 1B','Geostationary Orbit','Satellite Deployment','Completed','1970-09-10',3650,11),
('Skynet 4A','Geostationary Orbit','Satellite Deployment','Completed','1988-01-01',4000,11),
('Skynet 4C','Geostationary Orbit','Satellite Deployment','Completed','1989-12-18',4500,11),
('Skynet 5A','Geostationary Orbit','Satellite Deployment','Ongoing','2007-03-11',5800,11),
('Skynet 5B','Geostationary Orbit','Satellite Deployment','Ongoing','2007-11-14',5800,11),
('Skynet 5C','Geostationary Orbit','Satellite Deployment','Ongoing','2008-06-12',5800,11),
('Skynet 5D','Geostationary Orbit','Satellite Deployment','Ongoing','2012-12-19',4200,11),
('NovaSAR-1','Sun-Synchronous Orbit','Earth Observation','Ongoing','2018-09-16',2100,11),
('TechDemoSat-1','Low Earth Orbit','Test/Prototype','Completed','2014-07-08',1820,11),
('Biomass (ESA Mission)','Sun-Synchronous Orbit','Earth Observation','Ongoing','2024-05-15',500,11),
('Carbonite-2','Low Earth Orbit','Earth Observation','Completed','2018-01-12',1500,11),
('Surrey Nanosatellite','Low Earth Orbit','Test/Prototype','Completed','2019-02-28',1000,11),
('WRESAT','Low Earth Orbit','Satellite Deployment','Completed','1967-11-29',42,12),
('FedSat','Low Earth Orbit','Satellite Deployment','Completed','2002-12-14',1825,12),
('CubeSat Inspire-2','Low Earth Orbit','Satellite Deployment','Completed','2017-04-18',600,12),
('Binar-1','Low Earth Orbit','Test/Prototype','Ongoing','2021-08-29',1000,12),
('CUAVA-1','Low Earth Orbit','Test/Prototype','Completed','2021-08-29',365,12),
('Binar-2','Low Earth Orbit','Test/Prototype','Ongoing','2023-07-15',300,12),
('Binar-3','Low Earth Orbit','Test/Prototype','Planned','2024-12-01',0,12),
('SpIRIT','Low Earth Orbit','Earth Observation','Ongoing','2023-12-01',200,12),
('DubaiSat-1','Sun-Synchronous Orbit','Earth Observation','Completed','2009-07-29',3000,13),
('DubaiSat-2','Sun-Synchronous Orbit','Earth Observation','Completed','2013-11-21',3000,13),
('KhalifaSat','Sun-Synchronous Orbit','Earth Observation','Ongoing','2018-10-29',2100,13),
('Hope Mars Mission','Mars','Planetary Exploration','Ongoing','2020-07-19',1500,13),
('MBR Explorer','Asteroid Belt','Planetary Exploration','Planned','2028-01-01',0,13),
('UAE CubeSat-1','Low Earth Orbit','Satellite Deployment','Completed','2020-02-01',500,13),
('SaudiSat-1A','Low Earth Orbit','Satellite Deployment','Completed','2000-09-26',3000,14),
('SaudiSat-1B','Low Earth Orbit','Satellite Deployment','Completed','2000-12-20',3000,14),
('SaudiSat-1C','Low Earth Orbit','Satellite Deployment','Completed','2002-06-17',3000,14),
('SaudiSat-4','Low Earth Orbit','Satellite Deployment','Completed','2014-06-19',1800,14),
('SaudiComSat-1','Low Earth Orbit','Satellite Deployment','Completed','2002-09-17',3000,14),
('SGS-1','Geostationary Orbit','Satellite Deployment','Ongoing','2019-02-05',2000,14),
-- Falcon 1 Era
('Falcon 1 Flight 1','Low Earth Orbit','Test/Prototype','Failed','2006-03-24',0,15),
('Falcon 1 Flight 2','Low Earth Orbit','Test/Prototype','Failed','2007-03-21',0,15),
('Falcon 1 Flight 3','Low Earth Orbit','Satellite Deployment','Failed','2008-08-02',0,15),
('Falcon 1 Flight 4','Low Earth Orbit','Satellite Deployment','Completed','2008-09-28',2000,15),
('Falcon 1 Flight 5 (RazakSAT)','Low Earth Orbit','Satellite Deployment','Completed','2009-07-14',1825,15),
-- Falcon 9 Early Flights
('Falcon 9 Flight 1','Low Earth Orbit','Test/Prototype','Completed','2010-06-04',1000,15),
('COTS Demo Flight 1','Low Earth Orbit','Space Station','Completed','2010-12-08',3,15),
('COTS Demo Flight 2+','Low Earth Orbit','Space Station','Completed','2012-05-22',10,15),
('CRS-1','Low Earth Orbit','Space Station','Completed','2012-10-08',18,15),
-- CRS Missions
('CRS-2','Low Earth Orbit','Space Station','Completed','2013-03-01',22,15),
('CRS-3','Low Earth Orbit','Space Station','Completed','2014-04-18',30,15),
('CRS-4','Low Earth Orbit','Space Station','Completed','2014-09-21',30,15),
('CRS-5','Low Earth Orbit','Space Station','Completed','2015-01-10',29,15),
-- Commercial Satellite Launches
('SES-8','Geostationary Orbit','Satellite Deployment','Completed','2013-12-03',3000,15),
('Thaicom 6','Geostationary Orbit','Satellite Deployment','Completed','2014-01-06',3000,15),
('Turksat 4A','Geostationary Orbit','Satellite Deployment','Completed','2014-02-16',3000,15),
('ABS-3A / Eutelsat 115 West B','Geostationary Orbit','Satellite Deployment','Completed','2015-03-02',3000,15),
-- Falcon Heavy Era
('Falcon Heavy Test Flight','Heliocentric Orbit','Test/Prototype','Completed','2018-02-06',5000,15),
('Arabsat-6A','Geostationary Orbit','Satellite Deployment','Completed','2019-04-11',3000,15),
('STP-2','Geostationary Orbit','Satellite Deployment','Completed','2019-06-25',3000,15),
-- Crewed Flights
('Demo-1','Low Earth Orbit','Space Station','Completed','2019-03-02',6,15),
('Demo-2','Low Earth Orbit','Manned','Completed','2020-05-30',64,15),
('Crew-1','Low Earth Orbit','Manned','Completed','2020-11-16',167,15),
('Crew-2','Low Earth Orbit','Manned','Completed','2021-04-23',199,15),
('Crew-3','Low Earth Orbit','Manned','Completed','2021-11-11',175,15),
('Crew-4','Low Earth Orbit','Manned','Completed','2022-04-27',170,15),
('Crew-5','Low Earth Orbit','Manned','Completed','2022-10-05',157,15),
('Crew-6','Low Earth Orbit','Manned','Completed','2023-03-02',184,15),
('Crew-7','Low Earth Orbit','Manned','Ongoing','2023-08-26',365,15),
-- Tourism & Private
('Inspiration4','Low Earth Orbit','Tourism','Completed','2021-09-16',3,15),
('Axiom Mission 1','Low Earth Orbit','Tourism','Completed','2022-04-08',17,15),
('Axiom Mission 2','Low Earth Orbit','Tourism','Completed','2023-05-21',10,15),
-- Starship Tests
('Starship SN8','Suborbital','Test/Prototype','Failed','2020-12-09',0,15),
('Starship SN15','Suborbital','Test/Prototype','Completed','2021-05-05',0,15),
('Starship IFT-1','Suborbital','Test/Prototype','Failed','2023-04-20',0,15),
('Starship IFT-2','Suborbital','Test/Prototype','Completed','2023-11-18',0,15),
('Starship IFT-3','Suborbital','Test/Prototype','Ongoing','2024-03-14',5,15),
-- أول رحلات تجريبية (New Shepard)
('New Shepard NS-1','Suborbital','Test/Prototype','Failed','2015-04-29',0,16),
('New Shepard NS-2','Suborbital','Test/Prototype','Completed','2015-11-23',1,16),
('New Shepard NS-3','Suborbital','Test/Prototype','Completed','2016-01-22',1,16),
('New Shepard NS-4','Suborbital','Test/Prototype','Completed','2016-04-02',1,16),
('New Shepard NS-5','Suborbital','Test/Prototype','Completed','2016-06-19',1,16),
('New Shepard NS-6','Suborbital','Test/Prototype','Completed','2016-10-05',1,16),
('New Shepard NS-7','Suborbital','Test/Prototype','Completed','2017-12-12',1,16),
('New Shepard NS-8','Suborbital','Test/Prototype','Completed','2018-04-29',1,16),
('New Shepard NS-9','Suborbital','Test/Prototype','Completed','2019-01-23',1,16),
-- بداية الرحلات السياحية المأهولة
('New Shepard NS-16','Suborbital','Tourism','Completed','2021-07-20',0,16), -- جيف بيزوس
('New Shepard NS-17','Suborbital','Test/Prototype','Completed','2021-08-25',0,16),
('New Shepard NS-18','Suborbital','Tourism','Completed','2021-10-13',0,16), -- ويليام شاتنر
('New Shepard NS-19','Suborbital','Tourism','Completed','2021-12-11',0,16),
('New Shepard NS-20','Suborbital','Tourism','Completed','2022-03-31',0,16),
('New Shepard NS-21','Suborbital','Tourism','Completed','2022-06-04',0,16),
-- حادثة معروفة
('New Shepard NS-23','Suborbital','Test/Prototype','Failed','2022-09-12',0,16),
-- استئناف الرحلات
('New Shepard NS-24','Suborbital','Test/Prototype','Completed','2023-12-19',0,16),
('New Shepard NS-25','Suborbital','Tourism','Completed','2024-05-19',0,16),
-- مشاريع مستقبلية
('New Glenn First Flight','Low Earth Orbit','Test/Prototype','Planned','2025-11-01',0,16),
-- مرحلة التجارب المبكرة
('Ātea-1','Suborbital','Test/Prototype','Completed','2009-11-30',0,17),
-- Electron Test Flights
(N'It’s a Test','Low Earth Orbit','Test/Prototype','Completed','2017-05-25',1,17),
('Still Testing','Low Earth Orbit','Satellite Deployment','Completed','2018-01-21',2000,17),
(N'It’s Business Time','Low Earth Orbit','Satellite Deployment','Completed','2018-11-11',1800,17),
-- أول المهام التجارية والعلمية
('ELAANA-19','Low Earth Orbit','Satellite Deployment','Completed','2018-12-16',1700,17),
('Make It Rain','Low Earth Orbit','Satellite Deployment','Completed','2019-06-29',1500,17),
('Look Ma, No Hands','Low Earth Orbit','Satellite Deployment','Completed','2019-08-19',1500,17),
('As The Crow Flies','Low Earth Orbit','Satellite Deployment','Completed','2019-10-17',1500,17),
('Running Out of Fingers','Low Earth Orbit','Satellite Deployment','Completed','2019-12-06',1500,17),
-- مهمات خاصة بناسا والقمر
('Capella-1','Low Earth Orbit','Satellite Deployment','Completed','2020-01-31',1400,17),
('Photon Pathstone','Low Earth Orbit','Test/Prototype','Completed','2020-08-31',1000,17),
('CAPSTONE','Moon','Lunar Mission','Ongoing','2022-06-28',600,17),
-- مهمات حديثة ومتنوعة
(N'The Owl’s Night Continues','Sun-Synchronous Orbit','Earth Observation','Completed','2022-02-28',800,17),
('Baby Come Back','Low Earth Orbit','Satellite Deployment','Completed','2023-07-18',400,17),
('We Love The Nightlife','Low Earth Orbit','Satellite Deployment','Completed','2024-02-20',200,17),
('Mission to Venus (Planned)','Venus','Planetary Exploration','Planned','2025-10-15',0,17),
-- الاختبارات المبكرة
('SpaceShipOne Flight 15P','Suborbital','Test/Prototype','Completed','2004-06-21',0,18),
('SpaceShipOne Flight 16P','Suborbital','Test/Prototype','Completed','2004-09-29',0,18),
('SpaceShipOne Flight 17P','Suborbital','Test/Prototype','Completed','2004-10-04',0,18),

-- SpaceShipTwo - VSS Enterprise
('VSS Enterprise Glide Flight 1','Suborbital','Test/Prototype','Completed','2010-10-10',0,18),
('VSS Enterprise Glide Flight 2','Suborbital','Test/Prototype','Completed','2010-11-04',0,18),
('VSS Enterprise Powered Flight 1','Suborbital','Test/Prototype','Completed','2013-04-29',0,18),
('VSS Enterprise Powered Flight 2','Suborbital','Test/Prototype','Completed','2013-09-05',0,18),
('VSS Enterprise Accident','Suborbital','Test/Prototype','Failed','2014-10-31',0,18),

-- VSS Unity (الإصدار الثاني من SpaceShipTwo)
('VSS Unity Glide Flight 1','Suborbital','Test/Prototype','Completed','2016-12-03',0,18),
('VSS Unity Glide Flight 5','Suborbital','Test/Prototype','Completed','2017-01-24',0,18),
('VSS Unity Powered Flight 1','Suborbital','Test/Prototype','Completed','2018-04-05',0,18),
('VSS Unity Powered Flight 2','Suborbital','Test/Prototype','Completed','2018-07-26',0,18),
('VSS Unity Powered Flight 3','Suborbital','Test/Prototype','Completed','2018-12-13',0,18), -- أول وصول لحدود الفضاء رسمياً

-- بداية الرحلات التجارية والسياحية
('Unity 21','Suborbital','Tourism','Completed','2021-05-22',0,18),
('Unity 22','Suborbital','Tourism','Completed','2021-07-11',0,18), -- ريتشارد برانسون
('Unity 23','Suborbital','Tourism','Completed','2021-10-15',0,18),
('Unity 25','Suborbital','Tourism','Completed','2023-05-25',0,18),
('Galactic 01','Suborbital','Tourism','Completed','2023-06-29',0,18),
('Galactic 02','Suborbital','Tourism','Completed','2023-08-10',0,18),
('Galactic 03','Suborbital','Tourism','Completed','2023-09-08',0,18),
('Galactic 04','Suborbital','Tourism','Completed','2023-10-06',0,18),
('Galactic 05','Suborbital','Tourism','Completed','2024-01-26',0,18),
('Galactic 06','Suborbital','Tourism','Planned','2024-12-15',0,18),
-- أول مهمة مأهولة خاصة إلى محطة الفضاء الدولية
('Axiom Mission 1 (Ax-1)','Low Earth Orbit','Tourism','Completed','2022-04-08',17,19),
-- المهمة الثانية
('Axiom Mission 2 (Ax-2)','Low Earth Orbit','Tourism','Completed','2023-05-21',10,19),
-- المهام المخطط لها
('Axiom Mission 3 (Ax-3)','Low Earth Orbit','Tourism','Planned','2024-10-15',14,19),
('Axiom Mission 4 (Ax-4)','Low Earth Orbit','Tourism','Planned','2025-10-15',14,19),
-- مهام بناء المحطة الفضائية التجارية
('Axiom Station Module 1 Launch','Low Earth Orbit','Space Station','Planned','2026-01-15',0,19),
('Axiom Station Module 2 Launch','Low Earth Orbit','Space Station','Planned','2026-09-15',0,19),
-- الرحلات التجريبية المبكرة
('Dream Chaser Approach and Landing Test 1','Suborbital','Test/Prototype','Completed','2013-10-26',0,20),
('Dream Chaser Free-Flight Test 2','Suborbital','Test/Prototype','Completed','2017-11-11',0,20),
-- مهام الإمداد المستقبلية لمحطة الفضاء الدولية
('Dream Chaser CRS-2 Mission 1','Low Earth Orbit','Space Station','Planned','2024-12-15',45,20),
('Dream Chaser CRS-2 Mission 2','Low Earth Orbit','Space Station','Planned','2026-03-01',45,20),
('Dream Chaser CRS-2 Mission 3','Low Earth Orbit','Space Station','Planned','2027-06-01',45,20),
-- مشاركات في مشاريع محطات فضائية
('Orbital Reef Module Delivery 1','Low Earth Orbit','Space Station','Planned','2028-05-15',0,20),
('Orbital Reef Module Delivery 2','Low Earth Orbit','Space Station','Planned','2029-08-15',0,20),
-- مهام دعم تكنولوجي
('LIFE Habitat Deployment Test','Low Earth Orbit','Test/Prototype','Planned','2026-11-10',0,20),
('Aryabhata','Low Earth Orbit','Satellite Deployment','Completed','1975-04-19',730,21),
('SLV-3 E1','Low Earth Orbit','Test/Prototype','Failed','1979-08-10',0,21),
('Rohini RS-1','Low Earth Orbit','Satellite Deployment','Completed','1980-07-18',730,21),
('IRS-1A','Sun-Synchronous Orbit','Earth Observation','Completed','1988-03-17',3650,21),
('INSAT-1A','Geostationary Orbit','Satellite Deployment','Failed','1982-04-10',0,21),
('INSAT-1B','Geostationary Orbit','Satellite Deployment','Completed','1982-08-30',3650,21),
('PSLV-D1','Low Earth Orbit','Test/Prototype','Failed','1993-09-20',0,21),
('PSLV-D2','Sun-Synchronous Orbit','Earth Observation','Completed','1994-10-15',3650,21),
('Chandrayaan-1','Moon','Planetary Exploration','Completed','2008-10-22',312,21),
('Mars Orbiter Mission (MOM)','Mars','Planetary Exploration','Completed','2013-11-05',3000,21),
('Astrosat','Low Earth Orbit','Space Telescope','Completed','2015-09-28',3000,21),
('GSAT-19','Geostationary Orbit','Satellite Deployment','Completed','2017-06-05',3000,21),
('Chandrayaan-2','Moon','Planetary Exploration','Failed','2019-07-22',365,21),
('PSLV-C37','Sun-Synchronous Orbit','Satellite Deployment','Completed','2017-02-15',3000,21), -- أطلق 104 قمر في مهمة واحدة
('PSLV-C51/Amazonia-1','Sun-Synchronous Orbit','Earth Observation','Completed','2021-02-28',3000,21),
('Chandrayaan-3','Moon','Planetary Exploration','Completed','2023-07-14',300,21),
('Aditya-L1','Sun-Earth L1','Space Telescope','Ongoing','2023-09-02',500,21),
('Ariane 1 First Launch','Low Earth Orbit','Test/Prototype','Completed','1979-12-24',0,22),
('Ariane 5 Maiden Flight','Low Earth Orbit','Test/Prototype','Failed','1996-06-04',0,22),
-- Earth Observation
('ERS-1','Sun-Synchronous Orbit','Earth Observation','Completed','1991-07-17',3650,22),
('ERS-2','Sun-Synchronous Orbit','Earth Observation','Completed','1995-04-21',6200,22),
('Envisat','Sun-Synchronous Orbit','Earth Observation','Completed','2002-03-01',3650,22),
('Sentinel-1A','Sun-Synchronous Orbit','Earth Observation','Ongoing','2014-04-03',4000,22),
('Sentinel-1B','Sun-Synchronous Orbit','Earth Observation','Completed','2016-04-25',2500,22),
('Sentinel-2A','Sun-Synchronous Orbit','Earth Observation','Ongoing','2015-06-23',3500,22),
('Sentinel-2B','Sun-Synchronous Orbit','Earth Observation','Ongoing','2017-03-07',3000,22),
('Sentinel-3A','Sun-Synchronous Orbit','Earth Observation','Ongoing','2016-02-16',3000,22),
-- Space Science & Exploration
('Giotto','Comet Halley','Deep Space Mission','Completed','1985-07-02',2100,22),
('Rosetta','Comet 67P','Deep Space Mission','Completed','2004-03-02',4200,22),
('Mars Express','Mars','Planetary Exploration','Ongoing','2003-06-02',8000,22),
('Venus Express','Venus','Planetary Exploration','Completed','2005-11-09',3300,22),
('BepiColombo','Mercury','Planetary Exploration','Ongoing','2018-10-20',3000,22),
('JUICE','Jupiter System','Planetary Exploration','Ongoing','2023-04-14',400,22),
-- Space Telescopes
('Herschel Space Observatory','Sun-Earth L2','Space Telescope','Completed','2009-05-14',1400,22),
('Planck Space Observatory','Sun-Earth L2','Space Telescope','Completed','2009-05-14',1400,22),
('Gaia','Sun-Earth L2','Space Telescope','Ongoing','2013-12-19',4000,22);



SET IDENTITY_INSERT Missions on;


INSERT INTO Missions (Mission_id, Mission_name, Destination, Mission_type, Status, launch_date, duration_days, Agency_id)
VALUES
(372, 'Túpac Katari-1', 'Geostationary Orbit', 'Satellite Deployment', 'Ongoing', '2013-12-20', 4000, 84),
(373, 'BoliviaSat-2', 'Geostationary Orbit', 'Satellite Deployment', 'Planned', '2027-03-15', 0, 84),
(374, 'BoliviaSat-EarthObs', 'Sun-Synchronous Orbit', 'Earth Observation', 'Planned', '2026-08-09', 0, 84),
(375, 'BoliviaSat-Climate', 'Sun-Synchronous Orbit', 'Earth Observation', 'Planned', '2028-05-30', 0, 84),
(376, 'BoliviaSat-Tech', 'Low Earth Orbit', 'Test/Prototype', 'Planned', '2025-10-01', 0, 84),
(377, 'Bolivia Moon Orbiter', 'Moon', 'Lunar Mission', 'Planned', '2031-11-14', 35, 84),
(378, 'Bolivia Mars NanoSat', 'Mars', 'Planetary Exploration', 'Planned', '2033-02-25', 1400, 84),
(379, 'Bolivia Deep Space Demo', 'Deep Space', 'Deep Space Mission', 'Planned', '2035-09-07', 1500, 84),
(380, 'EthiopiaSat-1', 'Low Earth Orbit', 'Earth Observation', 'Completed', '2019-12-20', 1500, 85),
(381, 'ETRSS-1', 'Low Earth Orbit', 'Earth Observation', 'Ongoing', '2019-12-20', 1500, 85),
(382, 'ETRSS-2', 'Low Earth Orbit', 'Earth Observation', 'Planned', '2026-04-15', 0, 85),
(383, 'Ethiopia ClimateSat', 'Sun-Synchronous Orbit', 'Earth Observation', 'Planned', '2027-06-02', 0, 85),
(384, 'Ethiopia GeoSat', 'Geostationary Orbit', 'Satellite Deployment', 'Planned', '2029-03-22', 0, 85);

SET IDENTITY_INSERT Missions OFF;




--------------------------------------------------------------



INSERT INTO Astronauts (Name, Nationality, Gender, Birth_year, Missions_count)
VALUES
-- NASA (USA)
('Neil Armstrong', 'USA', 'Male', 1930, 2),
('Buzz Aldrin', 'USA', 'Male', 1930, 2),
('Michael Collins', 'USA', 'Male', 1930, 2),
('Alan Shepard', 'USA', 'Male', 1923, 2),
('John Glenn', 'USA', 'Male', 1921, 2),
('Jim Lovell', 'USA', 'Male', 1928, 4),
('Sally Ride', 'USA', 'Female', 1951, 2),
('Shannon Lucid', 'USA', 'Female', 1943, 5),
('Peggy Whitson', 'USA', 'Female', 1960, 3),
('Victor Glover', 'USA', 'Male', 1976, 2),
('Jessica Meir', 'USA', 'Female', 1977, 1),
('Christina Koch', 'USA', 'Female', 1979, 2),
('Mark Vande Hei', 'USA', 'Male', 1966, 2),
('Robert Behnken', 'USA', 'Male', 1970, 2),
('Douglas Hurley', 'USA', 'Male', 1966, 2),
('Scott Kelly', 'USA', 'Male', 1964, 4),
('Kjell Lindgren', 'USA', 'Male', 1973, 2),
('Anne McClain', 'USA', 'Female', 1979, 1),
('Sunita Williams', 'USA', 'Female', 1965, 3),
('Story Musgrave', 'USA', 'Male', 1935, 6),
('Yuri Gagarin', 'Russia', 'Male', 1934, 1),
('Gherman Titov', 'Russia', 'Male', 1935, 1),
('Alexei Leonov', 'Russia', 'Male', 1934, 2),
('Valentina Tereshkova', 'Russia', 'Female', 1937, 1),
('Valery Polyakov', 'Russia', 'Male', 1942, 2),
('Fyodor Yurchikhin', 'Russia', 'Male', 1959, 5),
('Sergey Prokopyev', 'Russia', 'Male', 1975, 2),
('Oleg Artemyev', 'Russia', 'Male', 1970, 3),
('Anna Kikina', 'Russia', 'Female', 1984, 1),
('Dmitry Petelin', 'Russia', 'Male', 1983, 1),
('Thomas Pesquet', 'France', 'Male', 1978, 2),
('Samantha Cristoforetti', 'Italy', 'Female', 1977, 2),
('Alexander Gerst', 'Germany', 'Male', 1976, 2),
('Andreas Mogensen', 'Denmark', 'Male', 1976, 2),
('Luca Parmitano', 'Italy', 'Male', 1976, 2),
('Jean-François Clervoy', 'France', 'Male', 1958, 3),
('Christer Fuglesang', 'Sweden', 'Male', 1957, 2),
('Pedro Duque', 'Spain', 'Male', 1963, 2),
('Helen Sharman', 'UK', 'Female', 1963, 1),
('Tim Peake', 'UK', 'Male', 1972, 1),
('Koichi Wakata', 'Japan', 'Male', 1963, 5),
('Akihiko Hoshide', 'Japan', 'Male', 1968, 3),
('Soichi Noguchi', 'Japan', 'Male', 1965, 3),
('Takao Doi', 'Japan', 'Male', 1954, 2),
('Naoko Yamazaki', 'Japan', 'Female', 1970, 1),
('Rakesh Sharma', 'India', 'Male', 1949, 1),
('Kalpana Chawla', 'India', 'Female', 1962, 2),
('Chris Hadfield', 'Canada', 'Male', 1959, 3),
('David Saint-Jacques', 'Canada', 'Male', 1970, 1),
('Marc Garneau', 'Canada', 'Male', 1949, 3),
('Julie Payette', 'Canada', 'Female', 1963, 2),
('Yang Liwei', 'China', 'Male', 1965, 1),
('Liu Yang', 'China', 'Female', 1978, 1),
('Zhai Zhigang', 'China', 'Male', 1966, 2),
('Jing Haipeng', 'China', 'Male', 1966, 3),
('Chen Dong', 'China', 'Male', 1978, 2),
('Hazzaa Al Mansoori', 'UAE', 'Male', 1983, 1),
('Sultan Al Neyadi', 'UAE', 'Male', 1981, 2),
('Rayyanah Barnawi', 'Saudi Arabia', 'Female', 1988, 1),
('Ali Al Qarni', 'Saudi Arabia', 'Male', 1992, 1),
('Katya Echazarreta', 'Mexico', 'Female', 1995, 1),
('Marcos Pontes', 'Brazil', 'Male', 1963, 1),

('Yi So-yeon', 'South Korea', 'Female', 1978, 1),
('Mark Shuttleworth', 'South Africa', 'Male', 1973, 1),

('Frank De Winne', 'Belgium', 'Male', 1961, 2),
('Roberta Bondar', 'Canada', 'Female', 1945, 1),
('Janice Voss', 'USA', 'Female', 1956, 5),
('Piers Sellers', 'UK', 'Male', 1955, 3),
('Michael Foale', 'UK/USA', 'Male', 1957, 6),
('Ko San', 'South Korea', 'Male', 1976, 0),
('Charles Bolden', 'USA', 'Male', 1946, 4),
('Eileen Collins', 'USA', 'Female', 1956, 4),
('Ronald McNair', 'USA', 'Male', 1950, 2),
('Judith Resnik', 'USA', 'Female', 1949, 2),
('Mae Jemison', 'USA', 'Female', 1956, 1),
('Guion Bluford', 'USA', 'Male', 1942, 4),
('Fred Haise', 'USA', 'Male', 1933, 2),
('Ken Mattingly', 'USA', 'Male', 1936, 3),
('Jack Swigert', 'USA', 'Male', 1931, 1),
('Gene Cernan', 'USA', 'Male', 1934, 3),
('Harrison Schmitt', 'USA', 'Male', 1935, 1),
('Charles Duke', 'USA', 'Male', 1935, 1),
('Alan Bean', 'USA', 'Male', 1932, 2),
('David Scott', 'USA', 'Male', 1932, 3),
('James Irwin', 'USA', 'Male', 1930, 1),
('Jack Lousma', 'USA', 'Male', 1936, 2),
('Boris Volynov', 'Russia', 'Male', 1934, 2),
('Vladimir Komarov', 'Russia', 'Male', 1927, 2),
('Svetlana Savitskaya', 'Russia', 'Female', 1948, 2),
('Claude Nicollier', 'Switzerland', 'Male', 1944, 4),
('Umberto Guidoni', 'Italy', 'Male', 1954, 2),
('Reinhard Furrer', 'Germany', 'Male', 1940, 1),
('Mamoru Mohri', 'Japan', 'Male', 1948, 2),
('Guy Laliberté', 'Canada', 'Male', 1959, 1),
('Nie Haisheng', 'China', 'Male', 1964, 3),
('Hazzaa Al Mansoori', 'UAE', 'Male', 1983, 1),
('Sultan Al Neyadi', 'UAE', 'Male', 1981, 2),
('Rayyanah Barnawi', 'Saudi Arabia', 'Female', 1988, 1),
('Ali Al Qarni', 'Saudi Arabia', 'Male', 1992, 1),
('André Kuipers', 'Netherlands', 'Male', 1958, 2);

-----------------------------------------------------------------------






SELECT COUNT(*)
FROM Missions;


--’ N
DROP TABLE Mission_Crew;


USE master;
DROP DATABASE Space_Missions;


DECLARE @Roles TABLE (Role NVARCHAR(50));
INSERT INTO @Roles VALUES
('Commander'), ('Pilot'), ('Mission Specialist'),
('Flight Engineer'), ('Scientist'), ('Engineer');

-- توزيع أساسي: ضمان مشاركة كل رائد فضاء في 3 مهمات
;WITH CrewBase AS (
    SELECT 
        M.Mission_id,
        A.Astronaut_id,
        (SELECT TOP 1 Role FROM @Roles ORDER BY NEWID()) AS Role
    FROM Astronauts A
    CROSS APPLY (
        SELECT TOP 3 Mission_id 
        FROM Missions M
        JOIN Agencies AG ON M.Agency_id = AG.Agency_id
        WHERE M.Mission_type IN (
            'Manned', 'Lunar Mission', 'Planetary Exploration',
            'Space Station', 'Rover', 'Sample Return', 'Deep Space Mission'
        )
        AND (
            A.Nationality = AG.Country
            OR (AG.Country = 'International' AND A.Nationality IN 
                ('USA','Russia','France','Germany','Italy','Japan','Canada','UK','Spain','Belgium','Netherlands','Sweden','Denmark'))
            OR (AG.Country = 'ESA' AND A.Nationality IN 
                ('France','Germany','Italy','Spain','Belgium','Netherlands','Sweden','Denmark'))
        )
        ORDER BY NEWID()
    ) M
)
INSERT INTO Mission_Crew (Mission_id, Astronaut_id, Role)
SELECT Mission_id, Astronaut_id, Role
FROM CrewBase;


INSERT INTO Mission_Crew (Mission_id, Astronaut_id, Role)
SELECT
    M.Mission_id,
    A.Astronaut_id,
    (SELECT TOP 1 Role FROM @Roles ORDER BY NEWID()) AS Role
FROM Missions M
JOIN Agencies AG ON M.Agency_id = AG.Agency_id
CROSS APPLY (
    SELECT TOP (ABS(CHECKSUM(NEWID())) % 4 + 1) Astronaut_id
    FROM Astronauts
    WHERE Nationality = AG.Country
       OR (AG.Country = 'International' AND Nationality IN 
           ('USA','Russia','France','Germany','Italy','Japan','Canada','UK','Spain','Belgium','Netherlands','Sweden','Denmark'))
       OR (AG.Country = 'ESA' AND Nationality IN 
           ('France','Germany','Italy','Spain','Belgium','Netherlands','Sweden','Denmark'))
    ORDER BY NEWID()
) A
WHERE M.Mission_type IN (
    'Manned', 'Lunar Mission', 'Planetary Exploration',
    'Space Station', 'Rover', 'Sample Return', 'Deep Space Mission'
)
AND NOT EXISTS (
    SELECT 1 FROM Mission_Crew MC
    WHERE MC.Mission_id = M.Mission_id
    AND MC.Astronaut_id = A.Astronaut_id
);




