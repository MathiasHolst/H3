DROP USER IF EXISTS system_admin;
CREATE USER system_admin IDENTIFIED BY '1q2w3e4¤#"!';
GRANT ALL PRIVILEGES ON *.* TO system_admin;

DROP USER IF EXISTS gæst;
CREATE USER gæst IDENTIFIED BY '';
GRANT SELECT ON instrumentavler.* TO gæst;