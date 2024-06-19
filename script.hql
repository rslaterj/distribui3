CREATE TABLE ventas (nombre STRING, cantidad INT)
PARTITIONED BY (id_tienda INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

ALTER TABLE ventas ADD
PARTITION(id_tienda=1);
ALTER TABLE ventas ADD
PARTITION(id_tienda=2);

INSERT INTO TABLE ventas
PARTITION(id_tienda=1)
VALUES
    ("producto1", 26),
    ("producto2", 18),
    ("producto3", 84),
    ("producto1", 31),
    ("producto2", 46),
    ("producto3", 48),
    ("producto1", 21),
    ("producto2", 33),
    ("producto3", 3);

INSERT INTO TABLE ventas
PARTITION(id_tienda=2)
VALUES
    ("producto1", 51),
    ("producto2", 8),
    ("producto3", 82),
    ("producto1", 18),
    ("producto2", 60),
    ("producto3", 23),
    ("producto1", 16),
    ("producto2", 2),
    ("producto3", 39);