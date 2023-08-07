-- tạo database
create database if not exists PHP_Labs;
use PHP_Labs;
-- tạo bảng

create table if not exists users (
	id INT PRIMARY KEY AUTO_INCREMENT,
	avatar VARCHAR(150) NOT NULL,
	name NVARCHAR(100) NOT NULL, -- tiếng việt
	email VARCHAR(100) NOT NULL UNIQUE,
    student_code VARCHAR(100) NOT NULL UNIQUE,
    gender BIT,
    birthday DATE,
    address NVARCHAR(500),
    course NVARCHAR(100) --khoa hoc
);

-- bài viết, thông báo
create table if not exists posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    image VARCHAR(5000) NOT NULL,
    title NVARCHAR(100) NOT NULL,
    content NVARCHAR(5000) NOT NULL,
    created_at DATETIME NOT NULL -- ngày tạo
);

-- lịch học, lịch thi
create table if not exists schedules (
    id INT PRIMARY KEY AUTO_INCREMENT,
    room NVARCHAR(100) NOT NULL, -- phòng
    day DATE NOT NULL, -- ngày học
    time NVARCHAR(100) NOT NULL, -- ca học
    course_name NVARCHAR(100) NOT NULL, -- mã môn
    class_name NVARCHAR(100) NOT NULL, -- mã lớp
    teacher_name NVARCHAR(100) NOT NULL, -- tên giảng viên
    address NVARCHAR(100) NOT NULL, -- địa điểm
    type BIT NOT NULL, -- 0: học, 1: thi
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

insert into users (avatar, name, email, student_code, gender, birthday, address, course) values ('https://robohash.org/estquotempora.png?size=50x50&set=set1', 'Dunstan', 'dheffernan0@blogspot.com', 'PS23331', 1, '2023-06-09', '534 Havey Drive', 'LTMT');
insert into users (avatar, name, email, student_code, gender, birthday, address, course) values ('https://robohash.org/aliquidcupiditatequi.png?size=50x50&set=set1', 'Philippe', 'pmcgarel1@cnet.com', 'PS24142', 0, '2023-07-30', '39564 Merchant Alley', 'LTMT');
insert into users (avatar, name, email, student_code, gender, birthday, address, course) values ('https://robohash.org/voluptatemvoluptatibusnon.png?size=50x50&set=set1', 'Linnet', 'lpattemore2@yolasite.com', 'PS12344', 0, '2023-04-22', '35 Loeprich Court', 'LTMT');
insert into users (avatar, name, email, student_code, gender, birthday, address, course) values ('https://robohash.org/ipsamcommodibeatae.png?size=50x50&set=set1', 'Olivie', 'osiaskowski3@hc360.com', 'PS12345', 0, '2023-04-05', '31852 Maywood Center', 'LTMT');
insert into users (avatar, name, email, student_code, gender, birthday, address, course) values ('https://robohash.org/quiautemsequi.png?size=50x50&set=set1', 'Agnes', 'ameasor4@deviantart.com', 'PS24413', 1, '2023-01-22', '6929 Washington Road', 'LTMT');

insert into posts (image, title, content, created_at) values ('https://scontent.fsgn4-1.fna.fbcdn.net/v/t39.30808-6/364773968_775350577930977_919362056076814472_n.jpg?stp=dst-jpg_p843x403&_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=6-vwifFf9u8AX_pW-zr&_nc_ht=scontent.fsgn4-1.fna&oh=00_AfBvhiqxIWz65Ly6ZusHDkt2HewBu0mlm61wxLrZzBLI3w&oe=64D4C01E','Chann3', 'CHẮC CHẮN YÊU LÀ ĐÂY: SƠN TÙNG M-TP CHÍNH THỨC QUAY TRỞ LẠI HAPPY BEE 13. 
Sơn Tùng M-TP xác nhận sẽ có mặt tại Happy Bee 13 và biểu diễn tại 3 cơ sở Cần Thơ, Đà Nẵng, TP HCM', '2023-09-10');
insert into posts (image, title, content, created_at) values ('https://scontent.fsgn13-4.fna.fbcdn.net/v/t39.30808-6/363420125_773043148161720_2924513650582670481_n.jpg?stp=dst-jpg_p843x403&_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=Sq7eTzg9jFAAX9qg5HK&_nc_ht=scontent.fsgn13-4.fna&oh=00_AfDsL4UxxezlxrNDHfVCVUqTiPMVqYCoh565oOYotYASYg&oe=64D54DBE','Dinhnt', 'LINE-UP "VẠN NGƯỜI MÊ" GÓP MẶT TẠI HAPPY BEE 13 TP.HCM. 
Đắm chìm trong không gian âm nhạc cùng những ngôi sao hàng đầu: Sơn Tùng M-TP, Rapper Đen, B Ray, HIEUTHUHAI, Tăng Duy Tân, Masew, MC Hoàng Rapper', '2023-09-10');
insert into posts (image, title, content, created_at) values ('https://scontent.fsgn13-2.fna.fbcdn.net/v/t39.30808-6/364789131_772786701520698_6487804484452724944_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=rU5ZUa7N3r8AX_9d96C&_nc_ht=scontent.fsgn13-2.fna&oh=00_AfB94w4Hn1zlE5QBj6AyV-fkccZJoMKh6StjlloIBcn5OA&oe=64D628E6','Vunlps', 'ĐẾM NGƯỢC CHỈ CÒN 01 NGÀY ĐẾN LỄ KHAI GIẢNG TÂN SINH VIÊN K19.3.2. Tân sinh viên K19.3.2, are you ready??', '2023-08-02');
insert into posts (image, title, content, created_at) values ('https://scontent.fsgn3-1.fna.fbcdn.net/v/t39.30808-6/364176217_771290238337011_4298462421758210368_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=jjVSF9zMG00AX9Wj5Pf&_nc_ht=scontent.fsgn3-1.fna&oh=00_AfCiuLIexhunZ4KD4v1KdmJ4vSrAFOz4Bj5XgF8GVoNVIQ&oe=64D636ED', 'Tholps'
, 'MINIGAME: CHỤP HÌNH "CỰC XINH" – NHẬN QUÀ “CỰC XỊN”. Đối tượng tham gia: Đặc quyền dành riêng cho Tân sinh viên 2K5', '2022-08-02');
insert into posts (title, content, created_at) values ('https://scontent.fsgn4-1.fna.fbcdn.net/v/t39.30808-6/364773968_775350577930977_919362056076814472_n.jpg?stp=dst-jpg_p843x403&_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=6-vwifFf9u8AX_pW-zr&_nc_ht=scontent.fsgn4-1.fna&oh=00_AfBvhiqxIWz65Ly6ZusHDkt2HewBu0mlm61wxLrZzBLI3w&oe=64D4C01E',
 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2023-03-17');
insert into posts (title, content, created_at) values ('https://scontent.fsgn4-1.fna.fbcdn.net/v/t39.30808-6/364773968_775350577930977_919362056076814472_n.jpg?stp=dst-jpg_p843x403&_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=6-vwifFf9u8AX_pW-zr&_nc_ht=scontent.fsgn4-1.fna&oh=00_AfBvhiqxIWz65Ly6ZusHDkt2HewBu0mlm61wxLrZzBLI3w&oe=64D4C01E',
 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', '2023-07-01');
insert into posts (title, content, created_at) values ('https://scontent.fsgn4-1.fna.fbcdn.net/v/t39.30808-6/364773968_775350577930977_919362056076814472_n.jpg?stp=dst-jpg_p843x403&_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=6-vwifFf9u8AX_pW-zr&_nc_ht=scontent.fsgn4-1.fna&oh=00_AfBvhiqxIWz65Ly6ZusHDkt2HewBu0mlm61wxLrZzBLI3w&oe=64D4C01E',
 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '2022-12-26');
insert into posts (title, content, created_at) values ('https://scontent.fsgn4-1.fna.fbcdn.net/v/t39.30808-6/364773968_775350577930977_919362056076814472_n.jpg?stp=dst-jpg_p843x403&_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=6-vwifFf9u8AX_pW-zr&_nc_ht=scontent.fsgn4-1.fna&oh=00_AfBvhiqxIWz65Ly6ZusHDkt2HewBu0mlm61wxLrZzBLI3w&oe=64D4C01E',
 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2023-02-12');
insert into posts (title, content, created_at) values ('https://scontent.fsgn4-1.fna.fbcdn.net/v/t39.30808-6/364773968_775350577930977_919362056076814472_n.jpg?stp=dst-jpg_p843x403&_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=6-vwifFf9u8AX_pW-zr&_nc_ht=scontent.fsgn4-1.fna&oh=00_AfBvhiqxIWz65Ly6ZusHDkt2HewBu0mlm61wxLrZzBLI3w&oe=64D4C01E',
 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2022-08-10');
insert into posts (title, content, created_at) values ('https://scontent.fsgn4-1.fna.fbcdn.net/v/t39.30808-6/364773968_775350577930977_919362056076814472_n.jpg?stp=dst-jpg_p843x403&_nc_cat=105&ccb=1-7&_nc_sid=0debeb&_nc_ohc=6-vwifFf9u8AX_pW-zr&_nc_ht=scontent.fsgn4-1.fna&oh=00_AfBvhiqxIWz65Ly6ZusHDkt2HewBu0mlm61wxLrZzBLI3w&oe=64D4C01E',
 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2022-07-19');





insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Port Lincoln', '2022-10-24', '11:29 AM', 'Regrant', 'Coendou prehensilis', 'Theodore Moulson', '85845 Canary Crossing', 1, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ("P408", '2023-01-14', '8:28 PM', 'Zoolab', 'unavailable', 'Cherise Cansdale', '38 Burrows Place', 0, 3);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Perm', '2023-01-25', '10:54 PM', 'It', 'Cacatua tenuirostris', 'Fidelity Deares', '45 Transport Avenue', 0, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('El Reno', '2022-10-19', '4:55 PM', 'Kanlam', 'Pseudalopex gymnocercus', 'Dyan Isaac', '2297 Nelson Court', 1, 3);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ("T1102", '2023-06-16', '6:52 PM', 'Daltfresh', 'Zosterops pallidus', 'Faydra Barth', '16154 Mcguire Trail', 0, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Tres Arroyos', '2022-07-27', '9:44 AM', 'Temp', 'Gyps bengalensis', 'Melisse Harower', '4 Milwaukee Drive', 1, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Shreveport', '2022-08-07', '7:15 AM', 'Hatity', 'Deroptyus accipitrinus', 'Say Liversidge', '1 Monica Crossing', 0, 3);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Napakiak', '2022-11-03', '10:45 AM', 'Treeflex', 'Erinaceus frontalis', 'Veriee Dayce', '591 Jenna Junction', 1, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Kar Kar Island', '2023-02-11', '2:39 PM', 'Stronghold', 'unavailable', 'Shandy Cockerham', '6 Roth Trail', 1, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Bragança', '2023-03-17', '6:58 PM', 'Trippledex', 'Ardea golieth', 'Antony Sommerlin', '268 Crowley Alley', 1, 3);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Khon Kaen', '2023-02-08', '2:05 PM', 'Sonair', 'Pseudocheirus peregrinus', 'Hally Veare', '4434 Union Road', 1, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Tetebedi', '2022-07-24', '1:29 AM', 'Subin', 'Streptopelia senegalensis', 'Lance Biggs', '140 Pond Alley', 0, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Bakersfield', '2023-02-13', '4:43 PM', 'Tresom', 'Coluber constrictor', 'Roseanna Orgen', '7579 Esker Terrace', 0, 3);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('São Borja', '2022-09-21', '10:27 PM', 'Span', 'Varanus sp.', 'Manda Benjafield', '59 Elmside Circle', 1, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Wellington', '2023-06-27', '6:12 PM', 'Flowdesk', 'Phoenicopterus chilensis', 'Odette Giuroni', '59 Portage Parkway', 1, 2);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Atbara', '2022-08-12', '8:34 AM', 'Andalax', 'Canis latrans', 'Esteban Chipman', '4905 Superior Pass', 0, 3);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Hamilton', '2022-11-14', '1:21 PM', 'Prodder', 'Myiarchus tuberculifer', 'Emelen Leebetter', '787 Homewood Circle', 1, 3);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Sandringham Station', '2023-01-12', '6:39 AM', 'Sub-Ex', 'Lama guanicoe', 'Niko Fantin', '0751 Michigan Place', 0, 3);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Arthur''s Town', '2022-10-25', '10:36 PM', 'Vagram', 'Anathana ellioti', 'Kin Eede', '8280 Riverside Crossing', 1, 3);
insert into schedules (room, day, time, course_name, class_name, teacher_name, address, type, user_id) values ('Nizhny Novgorod', '2023-04-28', '6:04 PM', 'Tres-Zap', 'Anastomus oscitans', 'Virgil Di Giacomettino', '1055 Buhler Parkway', 0, 2);