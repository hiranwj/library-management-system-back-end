CREATE TABLE member(
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(200) NOT NULL,
    contact VARCHAR(11) NOT NULL
);

CREATE TABLE book(
     isbn VARCHAR(17) PRIMARY KEY,
     title VARCHAR(50) NOT NULL,
     author VARCHAR(50) NOT NULL,
     copies INT NOT NULL
);

INSERT INTO member VALUES (UUID(), 'Hiran', 'Colombo', '055-1245638'),
                          (UUID(), 'Kasun', 'Panadura', '071-1234567'),
                          (UUID(), 'Ruwan', 'Kalutara', '071-7894561'),
                          (UUID(), 'Dasun','Badulla', '078-7531595'),
                          (UUID(), 'Pubudu', 'Horana', '074-1245638');

INSERT INTO book VALUES ('978-1-56619-909-0', 'Application Architecture', 'Microsoft', '5'),
                        ('978-1-56619-909-1', 'Clean Code', 'Robert Cecil', '7'),
                        ('978-1-56619-909-3', 'EcmaScript Specification 2022', 'Ecma Body', '5'),
                        ('978-1-56619-909-4', 'Head First Servlets and JSP', 'Bryan Basham', '9'),
                        ('978-1-56619-909-5', 'Master OOPs Concepts in Java', 'Vikas Rajput', '2');

CREATE TABLE issue_note (
    id INT AUTO_INCREMENT PRIMARY KEY ,
    date DATE NOT NULL ,
    member_id VARCHAR(36) NOT NULL ,
    CONSTRAINT FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE issue_item (
    issue_id INT NOT NULL ,
    isbn VARCHAR(17) NOT NULL ,
    CONSTRAINT PRIMARY KEY (issue_id, isbn) ,
    CONSTRAINT FOREIGN KEY (issue_id) REFERENCES issue_note(id) ,
    CONSTRAINT FOREIGN KEY (isbn) REFERENCES book(isbn)
);