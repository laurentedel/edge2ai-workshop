DROP TABLE if exists sensors;
CREATE TABLE sensors (
 sensor_id INT,
 sensor_ts TIMESTAMP,
 sensor_0 DOUBLE,
 sensor_1 DOUBLE,
 sensor_2 DOUBLE,
 sensor_3 DOUBLE,
 sensor_4 DOUBLE,
 sensor_5 DOUBLE,
 sensor_6 DOUBLE,
 sensor_7 DOUBLE,
 sensor_8 DOUBLE,
 sensor_9 DOUBLE,
 sensor_10 DOUBLE,
 sensor_11 DOUBLE,
 is_healthy INT,
 PRIMARY KEY (sensor_ID, sensor_ts)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');


DROP TABLE if exists RefData_GeoLocation;
CREATE TABLE if not exists RefData_GeoLocation (
 sensor_id INT,
 city STRING,
 lat DOUBLE,
 lon DOUBLE,
 PRIMARY KEY (sensor_ID)
)
PARTITION BY HASH PARTITIONS 16
STORED AS KUDU
TBLPROPERTIES ('kudu.num_tablet_replicas' = '1');


INSERT INTO RefData_GeoLocation VALUES (1,"Geneva",46.195602,6.148113), (2,"Zürich",47.366667,8.55), (3,"Basel",47.558395,7.573271), (4,"Bern",46.916667,7.466667), (5,"Lausanne",46.533333,6.666667), (6,"Lucerne",47.083333,8.266667), (7,"Lugano",46.009279,8.955576), (8,"Sankt Fiden",47.43162,9.39845), (9,"Chur",46.856753,9.526918), (10,"Schaffhausen",47.697316,8.634929), (11,"Fribourg",46.79572,7.154748), (12,"Neuchâtel",46.993089,6.93005), (13,"Tripon",46.270839,7.317785), (14,"Zug",47.172421,8.517445), (15,"Frauenfeld",47.55993,8.8998), (16,"Bellinzona",46.194902,9.024729), (17,"Aarau",47.389616,8.052354), (18,"Herisau",47.38271,9.27186), (19,"Solothurn",47.206649,7.516605), (20,"Schwyz",47.027858,8.656112), (21,"Liestal",47.482779,7.742975), (22,"Delémont",47.366429,7.329005), (23,"Sarnen",46.898509,8.250681), (24,"Altdorf",46.880422,8.644409), (25,"Stansstad",46.97731,8.34005), (26,"Glarus",47.04057,9.068036), (27,"Appenzell",47.328414,9.409647), (28,"Saignelégier",47.255435,6.994608), (29,"Affoltern am Albis",47.281224,8.45346), (30,"Cully",46.488301,6.730109), (31,"Romont",46.696483,6.918037), (32,"Aarberg",47.043835,7.27357), (33,"Scuol",46.796756,10.305946), (34,"Fleurier",46.903265,6.582135), (35,"Unterkulm",47.30998,8.11371), (36,"Stans",46.95805,8.36609), (37,"Lichtensteig",47.337551,9.084078), (38,"Yverdon-les-Bains",46.777908,6.635502), (39,"Boudry",46.953019,6.83897), (40,"Balsthal",47.31591,7.693047), (41,"Dornach",47.478042,7.616417), (42,"Lachen",47.19927,8.85432), (43,"Payerne",46.82201,6.93608), (44,"Baden",47.478029,8.302764), (45,"Bad Zurzach",47.589169,8.289621), (46,"Tafers",46.814829,7.218519), (47,"Haslen",47.369308,9.367519), (48,"Echallens",46.642498,6.637324), (49,"Rapperswil-Jona",47.228942,8.833889), (50,"Bulle",46.619499,7.056743), (51,"Bülach",47.518898,8.536967), (52,"Sankt Gallen",47.43639,9.388615), (53,"Wil",47.460507,9.04389), (54,"Zofingen",47.289945,7.947274), (55,"Vevey",46.465264,6.841168), (56,"Renens",46.539894,6.588096), (57,"Brugg",47.481527,8.203014), (58,"Laufenburg",47.559248,8.060446), (59,"La Chaux-de-Fonds",47.104417,6.828892), (60,"Andelfingen",47.594829,8.679678), (61,"Dietikon",47.404446,8.394984), (62,"Winterthur",47.50564,8.72413), (63,"Thun",46.751176,7.621663), (64,"Le Locle",47.059533,6.752278), (65,"Bremgarten",47.352604,8.329955), (66,"Tiefencastel",46.660138,9.57883), (67,"Saint-Maurice",46.218257,7.003196), (68,"Cernier",47.057356,6.894757), (69,"Ostermundigen",46.956112,7.487187), (70,"Estavayer-le-Lac",46.849125,6.845805), (71,"Frutigen",46.58782,7.64751), (72,"Muri",47.270428,8.3382), (73,"Murten",46.92684,7.110343), (74,"Rheinfelden",47.553587,7.793839), (75,"Gersau",46.994189,8.524996), (76,"Schüpfheim",46.951613,8.017235), (77,"Saanen",46.489557,7.259609), (78,"Olten",47.357058,7.909101), (79,"Domat/Ems",46.834827,9.450752), (80,"Münchwilen",47.47788,8.99569), (81,"Horgen",47.255924,8.598672), (82,"Willisau",47.119362,7.991459), (83,"Rorschach",47.477166,9.485434), (84,"Morges",46.511255,6.495693), (85,"Interlaken",46.683872,7.866376), (86,"Sursee",47.170881,8.111132), (87,"Küssnacht",47.085571,8.442057), (88,"Weinfelden",47.56571,9.10701), (89,"Pfäffikon",47.365728,8.78595), (90,"Meilen",47.270429,8.643675), (91,"Langnau",46.93936,7.78738), (92,"Kreuzlingen",47.650512,9.175038), (93,"Nidau",47.129167,7.238464), (94,"Igis",46.945308,9.57218), (95,"Ilanz",46.773071,9.204486), (96,"Einsiedeln",47.12802,8.74319), (97,"Wangen",47.231995,7.654479), (98,"Hinwil",47.29702,8.84348), (99,"Hochdorf",47.168408,8.291788), (100,"Thusis",46.697524,9.440202), (101,"Lenzburg",47.384048,8.181798), (102,"Dielsdorf",47.480247,8.45628), (103,"Mörel-Filet",46.355548,8.044112), (104,"Münster-Geschinen",46.491704,8.272063), (105,"Martigny",46.101915,7.073989), (106,"Brig-Glis",46.3145,7.985796), (107,"Davos",46.797752,9.82702), (108,"Uster",47.352097,8.716687), (109,"Altstätten",47.376433,9.554989), (110,"Courtelary",47.179369,7.072954), (111,"Porrentruy",47.415327,7.075221);
