
INSERT INTO F15C2_auth VALUES (1, 'view');
INSERT INTO F15C2_auth VALUES (2, 'edit');
INSERT INTO F15C2_auth VALUES (3, 'null');

INSERT INTO F15C2_lab VALUES (1, 'ESL', 'Environmental Sciences Laboratory');
INSERT INTO F15C2_lab VALUES (2, 'SISL', 'Signal & Information Sciences Laboratory');
INSERT INTO F15C2_lab VALUES (3, 'SGL', 'Space & Geophysics Laboratory');

INSERT INTO F15C2_status VALUES 
    (1, 'Entered', 'The RFE has been created but has not yet been submitted for approval.');
INSERT INTO F15C2_status VALUES 
    (2, 'Submitted', 'The RFE has been submitted to the Lab System Administrator for approval.');
INSERT INTO F15C2_status VALUES 
    (3, 'Returned', 'The RFE has been returned for further information or clarification. Once Submitted again, it will follow the same routing as an Entered RFE.');
INSERT INTO F15C2_status VALUES 
    (4, 'Recalled', 'The requestor has recalled an RFE that has not yet reached final approval. Once Submitted again, it will follow the same routing as an Entered RFE.');
INSERT INTO F15C2_status VALUES 
    (5, 'Rejected', 'The RFE has been rejected and cannot be implemented.');
INSERT INTO F15C2_status VALUES 
    (6, 'SA Approved', 'The Lab System Administrator has approved the RFE; it has been submitted for Lab Director approval.');
INSERT INTO F15C2_status VALUES 
    (7, 'LD Approval', 'The Lab Director has approved the RFE; it has been submitted for Network Security Panel approval.');
INSERT INTO F15C2_status VALUES 
    (8, 'CH Approval', 'The Lab Director has approved the RFE; it has been submitted to the Chairperson of Security Panel approval.');
INSERT INTO F15C2_status VALUES 
    (9, 'Final Approved', 'The Executive Director's Office has given final approval for the RFE and it may be implemented.');

INSERT INTO F15C2_emp VALUES
    (1, 'SMITH', 'smith@gmail.com', 'A207', '5120090392', 'A', '17-DEC-1980', 'Y', 'N', 'N', 'N');
INSERT INTO F15C2_emp VALUES
    (2, 'ALLEN', 'allen@gmail.com', 'A701', '5122390562', 'A', '17-FEB-1990', 'N', 'Y', 'N', 'N');
INSERT INTO F15C2_emp VALUES
    (3, 'WARD', 'mard@icloud.com', 'A705', '5122387562', 'A', '28-JAN-2000', 'N', 'N', 'Y', 'N');
INSERT INTO F15C2_emp VALUES
    (4, 'JONES', 'jones@gmail.com', 'B205', '5129037321', 'A', '02-JUL-2010', 'N', 'N', 'N', 'Y');
INSERT INTO F15C2_emp VALUES
    (4, 'MARTIN', 'martin@gmail.com', 'B705', '5129029481', 'I', '02-JUL-2010', 'N', 'N', 'N', 'Y');
