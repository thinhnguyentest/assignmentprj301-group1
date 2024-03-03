--CREATE DATABASE BookOrders;
--USE BookOrders;

CREATE TABLE Authors (
    AuthorId INT IDENTITY PRIMARY KEY,
    [Name] NVARCHAR(255) NOT NULL,
	BirthDate DATE,
    Bio NVARCHAR(1000)
);

CREATE TABLE Publishers (
    PublisherId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    DateEstablished DATE
);

CREATE TABLE Books (
    BookId INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
	Genre NVARCHAR(255) DEFAULT 'UNKNOW',
    [Description] NVARCHAR(4000),
    Quantity INT,
    Price DECIMAL(10,2),
    AuthorId INT,
    PublisherId INT,
    FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId),
    FOREIGN KEY (PublisherId) REFERENCES Publishers(PublisherId)
);

CREATE TABLE ImageStoring (
    BookId INT,
    FilePath VARCHAR(100),
    FOREIGN KEY (BookId) REFERENCES Books(BookId)
);

CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(255) NOT NULL UNIQUE,
    [Password] VARCHAR(255) NOT NULL,
	[Name] NVARCHAR(255),
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(255) NOT NULL,
    [Address] VARCHAR(255),
    [Role] VARCHAR(50),
    IsActive BIT,
);

CREATE TABLE Discounts (
    DiscountId INT IDENTITY PRIMARY KEY,
    DiscountCode VARCHAR(255) NOT NULL,
    DiscountAmount DECIMAL(10,2) DEFAULT 0,
	DiscountPercent INT DEFAULT 0,
    Quantity INT,
    StartDate DATE DEFAULT GETDATE(),
    EndDate DATE
);

CREATE TABLE ShippingMethods (
    ShippingMethodId INT IDENTITY PRIMARY KEY,
    [Name] NVARCHAR(255) NOT NULL,
    Cost DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderId INT IDENTITY PRIMARY KEY,
    OrderDate DATETIME DEFAULT GETDATE(),
    OrderAmount DECIMAL(10,2),
    UserId INT,
    ShippingMethodId INT,
    FOREIGN KEY (UserId) REFERENCES Users(UserId),
    FOREIGN KEY (ShippingMethodId) REFERENCES ShippingMethods(ShippingMethodId)
);

CREATE TABLE OrderDetails (
    OrderDetailId INT IDENTITY PRIMARY KEY,
    OrderId INT,
    BookId INT,
    Quantity INT,
    Price DECIMAL(10,2),
    DiscountId INT,
    FOREIGN KEY (DiscountId) REFERENCES Discounts(DiscountId),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (BookId) REFERENCES Books(BookId)
);

CREATE TABLE Payments (
    PaymentId INT IDENTITY PRIMARY KEY,
    OrderId INT UNIQUE,
    PaymentType VARCHAR(255) NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(10,2),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);



-- Thêm dữ liệu cho Authors
INSERT INTO Authors ([Name], BirthDate, Bio)
VALUES 
    (N'Paulo Coelho', '1939-01-01', N'Paulo Coelho sinh năm 1947 tại Rio de Janeiro (Brazil) trong một gia đình trung lưu. Năm 1970, ông bỏ dở việc học để lên đường du lịch qua nhiều nơi thuộc châu Mỹ, châu u và Bắc Phi trước khi trở về Brazil và kết hôn với vợ, họa sĩ Christina Oiticica. Sau chuyến hành hương năm 1986, Coelho quyết định từ bỏ sự nghiệp sáng tác lời ca khúc đang rất thành công để quay lại theo đuổi giấc mơ văn chương thời trẻ. Nhà giả kim (1988) đã đưa ông trở thành tên tuổi được biết đến trên toàn thế giới.'),
    (N'FRANCES HODGSON BURNETT', NULL, N'Author of The Little Princess'),
    (N'HARUKI MURAKAMI', NULL, N'Japanese author of Norwegian Wood'),
    (N'HIGASHINO KEIGO', NULL, N'Japanese author known for The Devotion of Suspect X'),
    (N'JOSÉ MAURO DE VASCONCELOS', NULL, N'Brazilian author of My Sweet Orange Tree'),
    (N'NIGEL WARBURTON', NULL, N'Author of A Little History of Philosophy'),
    (N'DIANA WYNNE JONES', NULL, N'British author of fantasy novels including Howl''s Moving Castle'),
    (N'JANE AUSTEN', NULL, N'English novelist known for Pride and Prejudice'),
    (N'KAWABATA YASUNARI', NULL, N'Đẹp và buồn'),
	(N'VŨ BẰNG', NULL, N'Đang cập nhật'),
    (N'ĐĂNG HOÀNG GIANG', NULL, N'Đang cập nhật'),
    (N'NEIL GAIMAN', NULL, N'Đang cập nhật'),
    (N'LƯU TỪ HÂN', NULL, N'Đang cập nhật'),
    (N'DALE CARNEGIE', NULL, N'Đang cập nhật'),
    (N'CARL SAGAN', NULL, N'Đang cập nhật'),
    (N'KHALED HOSSEINI', NULL, N'Đang cập nhật'),
    (N'CARL GUSTAV JUNG', NULL, N'Đang cập nhật'),
    (N'SIGMUND FREUD', NULL, N'Đang cập nhật'),
	('J.R.R. Tolkien', '1892-01-03', 'English writer, poet, and philologist best known for his fantasy works The Hobbit and The Lord of the Rings'),
	('Jane Austen', '1775-12-16', 'English novelist known for her wit, social commentary, and romantic novels'),
	('Harper Lee', '1926-04-28', 'American novelist who wrote the Pulitzer Prize-winning novel To Kill a Mockingbird'),
	('F. Scott Fitzgerald', '1896-09-24', 'American novelist known for his novels depicting the Jazz Age'),
	('Douglas Adams', '1952-03-11', 'English science fiction writer, humorist, dramatist, and screenwriter'),
	('Mary Shelley', '1797-08-31', 'English novelist, playwright, and short story writer, famous for her Gothic novel Frankenstein'),
	('J.D. Salinger', '1919-01-01', 'American novelist, short story writer, and teacher best known for his novel The Catcher in the Rye'),
	('Gabriel Garcia Marquez', '1927-03-06', 'Colombian novelist, journalist, and short-story writer, known for his magical realist novels and stories'),
	('Markus Zusak', '1975-06-23', 'Australian writer known for his young adult novels, including The Book Thief'),
	('Ralph Ellison', '1914-03-01', 'American novelist, essayist, literary critic, and scholar best known for his novel Invisible Man')

-- Thêm dữ liệu cho Publishers
INSERT INTO Publishers (Name, DateEstablished)
VALUES 
    (N'AlphaBook', '2023-01-01'),
    (N'NXB Kim Đồng', '2022-05-10'),
    (N'NXB Trẻ', '2024-12-15'),
    (N'Hội Nhà Văn', '2020-03-10'),
	(N'Hà Nội', '2022-03-10'),
	(N'Phụ Nữ', '2021-03-10'),
	(N'Thế Giới', '2020-03-10'),
	('HarperCollins', '1817-01-01'),
	('Penguin Classics', '1946-01-01'),
	('Harper Perennial', '1980-01-01'),
	('Scribner', '1870-01-01'),
	('Pan Books', '1944-01-01'),
	('Little, Brown and Company', '1837-01-01'),
	('Penguin Random House', '2013-01-01'),
	('Knopf Books for Young Readers', '1952-01-01'),
	('Random House', '1925-01-01')
	
-- Thêm dữ liệu cho Books
INSERT INTO Books (Title, Genre, [Description], Quantity, Price, AuthorId, PublisherId)
VALUES 
    (N'Nhà Giả Kim', 'Mystery', N'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người. ', 30, 67000, 1, 4),
    (N'Hippie – Những kẻ lãng du', 'Mystery', N'Hippie – Những kẻ lãng du đưa ta đến với những con người hoàn toàn xa lạ, với những mục đích khác nhau nhưng cùng hướng đến vùng đất xa xôi Nepal trên con đường mòn hippie huyền thoại.', 30, 127000, 1, 4),
    (N'ALEPH', 'Mystery', N'Thông tin chi tiết sản phẩm đang được cập nhật', 30, 84000, 1, 4),
    (N'Công chúa nhỏ', 'Fiction', N'Description for Công chúa nhỏ', 100, 45000, 2, 4),
    (N'Phía sau nghi can X', 'Mystery', N'Description for Phía sau nghi can X', 80, 110000, 4, 2),
    (N'Những chuyện lạ ở Tokyo', 'Fiction', N'Description for Những chuyện lạ ở Tokyo', 120, 78000, 3, 3),
    (N'Điều kì diệu của tiệm tạp hóa Namiya', 'Fantasy', N'Description for Điều kì diệu của tiệm tạp hóa Namiya', 90, 97000, 4, 4),
    (N'Cây cam ngọt của tôi', 'Fiction', N'Description for Cây cam ngọt của tôi', 110, 47000, 5, 3),
    (N'Kafka bên bờ biển', 'Fiction', N'Description for Kafka bên bờ biển', 70, 85000, 3, 1),
    (N'Rừng Nauy', 'Non-Fiction', N'Description for Rừng Nauy', 85, 132000, 3, 3),
    (N'Lược sử Triết học', 'Non-Fiction', N'Description for Lược sử Triết học', 95, 155000, 6, 1),
    (N'Kiêu hãnh và định kiến', 'Fiction', N'Description for Kiêu hãnh và định kiến', 75, 79000, 8, 2),
    (N'Lâu đài trên mây', 'Fantasy', N'Description for Lâu đài trên mây', 100, 91000, 7, 3),
    (N'Đẹp và buồn', 'Fiction', N'Description for Đẹp và buồn', 110, 112000, 9, 1),
	(N'MIẾNG NGON HÀ NỘI', 'Cooking', N'Miếng Ngon Hà Nội là một cuốn sách về ẩm thực Việt Nam.', 50, 45000, 10, 5),
    (N'ĐẠI DƯƠNG ĐEN', 'Adventure', N'Cuộc phiêu lưu đầy thách thức giữa đại dương bao la và không gian huyền bí.', 30, 65000, 11, 4),
    (N'BẠCH DẠ HÀNH', 'Fiction', N'Truyện về tình yêu, mạo hiểm, và sức mạnh của tình bạn trong thời kỳ chiến tranh.', 40, 55000, 4, 6),
    (N'ĐIỀM LÀNH', 'Mystery', N'Cuộc truy lùng tội phạm và giải mã bí ẩn xung quanh những sự kiện kỳ lạ.', 60, 78000, 12, 7),
    (N'TAM THỂ 2 - KHU RỪNG ĐEN TỐI', 'Fantasy', N'Bắt đầu từ nơi cuốn sách đầu tiên kết thúc, hành trình tiếp tục vào khu rừng đen tối.', 25, 110000, 13, 7),
    (N'TAM THỂ', 'Fantasy', N'Trận chiến giữa các phe phái để bảo vệ hay chiếm lấy sức mạnh Tam Thể.', 35, 100000, 13, 1),
    (N'TAM THỂ 3 - TỬ THẦN SỐNG MÃI', 'Fantasy', N'Phần kết của loạt truyện Tam Thể, với sự hấp dẫn và bất ngờ đầy kịch tính.', 20, 115000, 13, 2),
    (N'ĐẮC NHÂN TÂM', 'Self-Help', N'Sách nổi tiếng về cách tương tác xã hội và phát triển bản thân.', 80, 30000, 14, 7),
    (N'VŨ TRỤ', 'Science', N'Khám phá vũ trụ qua góc nhìn khoa học và phiêu lưu.', 45, 88000, 15, 7),
    (N'NGƯỜI ĐUA DIỀU', 'Biography', N'Câu chuyện có thật về sự nghiệp và cuộc đời của một người đua diều nổi tiếng.', 55, 52000, 16, 7),
    (N'CON NGƯỜI VÀ BIỂU TƯỢNG', 'Philosophy', N'Nghiên cứu về ý thức con người và tầm ảnh hưởng của biểu tượng trong xã hội.', 40, 42000, 17, 7),
    (N'NGHIÊN CỨU PHÂN TÂM HỌC', 'Psychology', N'Cuộc thám hiểm sâu sắc vào lĩnh vực phân tâm học và tâm lý học hành vi.', 30, 48000, 18, 7),
	('The Lord of the Rings: The Fellowship of the Ring', 'Fantasy', 'The first book in the epic trilogy...', 50, 25.99, 19, 8),
	('Pride and Prejudice', 'Romance', 'A witty social commentary...', 40, 19.99, 20, 8),
	('To Kill a Mockingbird', 'Historical Fiction', 'Explores themes of racial...', 35, 14.99, 21, 9),
	('The Great Gatsby', 'Jazz Age Literature', 'Captures the decadence...', 25, 17.99,22, 10),
	('The Hitchhikers Guide to the Galaxy', 'Science Fiction Comedy', 'A humorous journey...', 20, 12.99, 23, 11),
	('Frankenstein', 'Gothic Fiction', 'Tells the story of Victor...', 15, 16.99, 24, 9),
	('The Catcher in the Rye', 'Coming-of-Age', 'Follows the story of Holden...', 10, 13.99, 25, 12),
	('One Hundred Years of Solitude', 'Magical Realism', 'Explores the history...', 30, 22.99, 26, 13),
	('The Book Thief', 'Historical Fiction', 'Narrated by Death, the story...', 20, 18.99, 27, 14),
	('Invisible Man', 'Social Criticism', 'Tells the story of an unnamed...', 15, 19.99, 28, 15);
	select * from ImageStoring

INSERT INTO ImageStoring (BookId, FilePath)
VALUES
(1, 'https://bizweb.dktcdn.net/100/363/455/products/nhagiakimnew03.jpg'),
(2, 'https://bizweb.dktcdn.net/100/363/455/products/hippiee1703493625775.jpg'),
(3, 'https://bizweb.dktcdn.net/100/363/455/products/aleph-01.jpg'),
(4, 'https://bizweb.dktcdn.net/100/363/455/products/congchuanho.jpg'),
(5, 'https://bizweb.dktcdn.net/100/363/455/products/phiasaunghicanxnew01.jpg'),
(6, 'https://bizweb.dktcdn.net/100/363/455/products/nhungchuyenlaotokyo01e17023545.jpg'),
(8, 'https://bizweb.dktcdn.net/100/363/455/products/caycamngotcuatoi01.jpg'),
(7, 'https://bizweb.dktcdn.net/100/363/455/products/dieukydieucuatiemtaphoanamiya0.jpg'),
(9, 'https://bizweb.dktcdn.net/100/363/455/products/kafkabenbobien001.jpg'),
(10, 'https://bizweb.dktcdn.net/100/363/455/products/rungnauy004.jpg'),
(11, 'https://bizweb.dktcdn.net/100/363/455/products/luocsutriethoc01.jpg'),
(12, 'https://bizweb.dktcdn.net/100/363/455/products/kieuhanhvadinhkien02.jpg'),
(13, 'https://bizweb.dktcdn.net/100/363/455/products/laudaitrenmay02.jpg'),
(14, 'https://bizweb.dktcdn.net/100/363/455/products/depvabuon01.jpg'),
(15, 'https://bizweb.dktcdn.net/100/363/455/products/miengngonhanoi1.jpg'),
(16, 'https://bizweb.dktcdn.net/100/363/455/products/daiduongdenbiamem011.jpg'),
(17, 'https://bizweb.dktcdn.net/100/363/455/products/bachdahanh.jpg'),
(18, 'https://bizweb.dktcdn.net/100/363/455/products/diemlanhnhungloitientrituyetdi.jpg'),
(19, 'https://bizweb.dktcdn.net/100/363/455/products/tamthe2khurungdentoi01.jpg'),
(20, 'https://bizweb.dktcdn.net/100/363/455/products/tamthe01.jpg?v=1705552096000'),
(21, 'https://bizweb.dktcdn.net/100/363/455/products/tamthe3tuthansongmaibia.jpg'),
(22, 'https://bizweb.dktcdn.net/100/363/455/products/dacnhantam03.jpg'),
(23, 'https://bizweb.dktcdn.net/100/363/455/products/vutru.jpg'),
(24, 'https://bizweb.dktcdn.net/100/363/455/products/nguoiduadieunew01.jpg'),
(25, 'https://bizweb.dktcdn.net/100/363/455/products/connguoivabieutuongscaled.jpg'),
(26, 'https://bizweb.dktcdn.net/100/363/455/products/nghiencuuphantamhocbia.jpg');


INSERT INTO Users (Username, [Password], [Name], Email, Phone, [Address], [Role], IsActive)
VALUES
('admin', 'admin', 'tuan', 'admin@example.com', '987-654-3210', 'AdminAddress', 'admin', 1),
('user1', 'password123', 'User name', 'user1@example.com', '123-456-7890', 'Address1', 'user', 1),
('user2', 'pass456', 'John Doe', 'john.doe@example.com', '555-123-4567', '123 Main St', 'user', 1),
('user3', 'securePass', 'Jane Smith', 'jane.smith@example.com', '555-987-6543', '456 Oak St', 'user', 1),
('user4', 'randomPass', 'Alice Johnson', 'alice.johnson@example.com', '555-555-5555', '789 Pine St', 'user', 1),
('user5', 'strongPass', 'Bob Anderson', 'bob.anderson@example.com', '555-333-4444', '101 Elm St', 'user', 1),
('user6', 'testPass', 'Emily Brown', 'emily.brown@example.com', '555-777-8888', '202 Maple St', 'user', 1),
('user7', 'dummyPass', 'David Wilson', 'david.wilson@example.com', '555-222-1111', '303 Birch St', 'user', 1),
('user8', 'secure123', 'Sophie Miller', 'sophie.miller@example.com', '555-666-9999', '404 Cedar St', 'user', 1),
('user9', 'pass1234', 'Michael Taylor', 'michael.taylor@example.com', '555-444-3333', '505 Oakwood St', 'user', 1),
('user10', 'passwordABC', 'Olivia Davis', 'olivia.davis@example.com', '555-888-7777', '606 Pineview St', 'user', 1),
('user11', 'adminPass123', 'Christopher Lee', 'christopher.lee@example.com', '555-555-1234', '707 Walnut St', 'user', 1),
('user12', 'qwertyPass', 'Isabella Hall', 'isabella.hall@example.com', '555-123-5678', '808 Cedarwood St', 'user', 1),
('user13', 'userPass', 'Daniel Adams', 'daniel.adams@example.com', '555-987-6542', '909 Birchwood St', 'user', 1),
('user14', 'pass4567', 'Grace Turner', 'grace.turner@example.com', '555-111-2222', '1010 Maplewood St', 'user', 1),
('user15', 'securePass1', 'Aiden Turner', 'aiden.turner@example.com', '555-333-5555', '1111 Pineview St', 'user', 1),
('user16', 'randomPass2', 'Sophia Garcia', 'sophia.garcia@example.com', '555-777-1111', '1212 Elmwood St', 'user', 1),
('user17', 'strongPass3', 'Ethan Hill', 'ethan.hill@example.com', '555-999-8888', '1313 Cedarwood St', 'user', 1),
('user18', 'testPass123', 'Emma White', 'emma.white@example.com', '555-444-6666', '1414 Birchwood St', 'user', 1),
('user19', 'dummyPass456', 'Carter Harris', 'carter.harris@example.com', '555-666-4444', '1515 Walnutwood St', 'user', 1),
('user20', 'secure1234', 'Madison King', 'madison.king@example.com', '555-222-3333', '1616 Pine St', 'user', 1),
('user21', 'pass12345', 'Liam Turner', 'liam.turner@example.com', '555-777-2222', '1717 Oak St', 'user', 1),
('user22', 'passwordABC1', 'Chloe Martinez', 'chloe.martinez@example.com', '555-111-7777', '1818 Birch St', 'user', 1),
('user23', 'adminPass789', 'Mason Rodriguez', 'mason.rodriguez@example.com', '555-444-1111', '1919 Cedar St', 'user', 1),
('user24', 'qwertyPass12', 'Lily Cooper', 'lily.cooper@example.com', '555-888-4444', '2020 Elm St', 'user', 1),
('user25', 'userPass123', 'Caleb Hill', 'caleb.hill@example.com', '555-333-2222', '2121 Pineview St', 'user', 1),
('user26', 'pass45678', 'Ava Taylor', 'ava.taylor@example.com', '555-666-3333', '2222 Cedarwood St', 'user', 1),
('user27', 'securePass12', 'Noah Allen', 'noah.allen@example.com', '555-222-4444', '2323 Walnutwood St', 'user', 1),
('user28', 'randomPass234', 'Avery Phillips', 'avery.phillips@example.com', '555-444-5555', '2424 Maplewood St', 'user', 1),
('user29', 'strongPass456', 'Harper Turner', 'harper.turner@example.com', '555-888-6666', '2525 Oakwood St', 'user', 1),
('user30', 'testPass456', 'Jackson Lewis', 'jackson.lewis@example.com', '555-111-3333', '2626 Pine St', 'user', 1),
('user31', 'dummyPass789', 'Aria Johnson', 'aria.johnson@example.com', '555-333-7777', '2727 Birch St', 'user', 1),
('user32', 'secure12345', 'Elijah Turner', 'elijah.turner@example.com', '555-666-2222', '2828 Cedar St', 'user', 1),
('user33', 'pass123456', 'Zoe Scott', 'zoe.scott@example.com', '555-999-4444', '2929 Elm St', 'user', 1),
('user34', 'passwordABC123', 'Grayson White', 'grayson.white@example.com', '555-444-7777', '3030 Pineview St', 'user', 1),
('user35', 'adminPass345', 'Scarlett Allen', 'scarlett.allen@example.com', '555-777-1111', '3131 Oak St', 'user', 1),
('user36', 'qwertyPass1234', 'Logan Harris', 'logan.harris@example.com', '555-222-6666', '3232 Birch St', 'user', 1),
('user37', 'userPass1234', 'Paisley Turner', 'paisley.turner@example.com', '555-666-3333', '3333 Cedar St', 'user', 1),
('user38', 'pass456789', 'Henry Phillips', 'henry.phillips@example.com', '555-111-4444', '3434 Walnutwood St', 'user', 1),
('user39', 'securePass12345', 'Aubrey Cooper', 'aubrey.cooper@example.com', '555-444-2222', '3535 Maplewood St', 'user', 1),
('user40', 'randomPass345', 'Riley Lewis', 'riley.lewis@example.com', '555-888-3333', '3636 Oakwood St', 'user', 1),
('user41', 'strongPass567', 'Mia Taylor', 'mia.taylor@example.com', '555-333-1111', '3737 Pine St', 'user', 1),
('user42', 'testPass567', 'Liam Davis', 'liam.davis@example.com', '555-777-6666', '3838 Elm St', 'user', 1),
('user43', 'dummyPass1234', 'Aria Johnson', 'ariabs.johnson@example.com', '555-999-5555', '3939 Cedar St', 'user', 1),
('user44', 'secure123456', 'Ethan Turner', 'ethan.turner@example.com', '555-222-4444', '4040 Oak St', 'user', 1),
('user45', 'pass1234567', 'Ava White', 'ava.white@example.com', '555-444-8888', '4141 Birch St', 'user', 1),
('user46', 'passwordABC234', 'Noah Allen', 'noah.allen@example.com', '555-888-1111', '4242 Cedarwood St', 'user', 1),
('user47', 'qwertyPass5678', 'Olivia Lewis', 'olivia.lewis@example.com', '555-111-6666', '4343 Walnut St', 'user', 1),
('user48', 'userPass2345', 'Jackson Hill', 'jackson.hill@example.com', '555-666-4444', '4444 Pineview St', 'user', 1),
('user49', 'pass4567890', 'Sophia Martinez', 'sophia.martinez@example.com', '555-333-2222', '4545 Oakwood St', 'user', 1),
('user50', 'randomPass4567', 'Liam Turner', 'liam.turner@example.com', '555-777-5555', '4646 Cedar St', 'user', 1),
('user51', 'strongPass789', 'Emma Phillips', 'emma.phillips@example.com', '555-111-7777', '4747 Elm St', 'user', 1),
('user52', 'testPass789', 'Mason Cooper', 'mason.cooper@example.com', '555-444-6666', '4848 Pine St', 'user', 1),
('user53', 'dummyPass5678', 'Chloe Turner', 'chloe.turner@example.com', '555-888-3333', '4949 Oak St', 'user', 1),
('user54', 'secure1234567', 'Liam Davis', 'liam.davis@example.com', '555-333-4444', '5050 Birch St', 'user', 1),
('user55', 'pass12345678', 'Ava Hill', 'ava.hill@example.com', '555-777-5555', '5151 Cedarwood St', 'user', 1),
('user56', 'passwordABC345', 'Noah White', 'noah.white@example.com', '555-999-1111', '5252 Walnutwood St', 'user', 1),
('user57', 'qwertyPass7890', 'Olivia Martinez', 'olivia.martinez@example.com', '555-444-6666', '5353 Maplewood St', 'user', 1),
('user58', 'userPass3456', 'Jackson Harris', 'jackson.harris@example.com', '555-666-3333', '5454 Oakwood St', 'user', 1),
('user59', 'pass45678901', 'Sophia Phillips', 'sophia.phillips@example.com', '555-111-4444', '5555 Pineview St', 'user', 1),
('user60', 'randomPass5678', 'Liam Turner', 'liam.turner@example.com', '555-777-6666', '5656 Elm St', 'user', 1),
('user61', 'strongPass8901', 'Emma Cooper', 'emma.cooper@example.com', '555-333-2222', '5757 Cedar St', 'user', 1),
('user62', 'testPass8901', 'Mason Turner', 'mason.turner@example.com', '555-666-4444', '5858 Birch St', 'user', 1),
('user63', 'dummyPass6789', 'Chloe Harris', 'chloe.harris@example.com', '555-999-7777', '5959 Walnut St', 'user', 1),
('user64', 'secure12345678', 'Liam Davis', 'liam.davis@example.com', '555-444-1111', '6060 Pine St', 'user', 1),
('user65', 'pass123456789', 'Ava Hill', 'ava.hill@example.com', '555-777-5555', '6161 Oak St', 'user', 1),
('user66', 'passwordABC456', 'Noah White', 'noah.white@example.com', '555-999-6666', '6262 Cedarwood St', 'user', 1),
('user67', 'qwertyPass9012', 'Olivia Martinez', 'olivia.martinez@example.com', '555-444-3333', '6363 Walnutwood St', 'user', 1),
('user68', 'userPass4567', 'Jackson Harris', 'jackson.harris@example.com', '555-666-4444', '6464 Maplewood St', 'user', 1),
('user69', 'pass456789012', 'Sophia Phillips', 'sophia.phillips@example.com', '555-111-5555', '6565 Pineview St', 'user', 1),
('user70', 'randomPass6789', 'Liam Turner', 'liam.turner@example.com', '555-777-8888', '6666 Elm St', 'user', 1),
('user71', 'strongPass90123', 'Emma Cooper', 'emma.cooper@example.com', '555-333-6666', '6767 Cedar St', 'user', 1),
('user72', 'testPass90123', 'Mason Turner', 'mason.turner@example.com', '555-666-9999', '6868 Birch St', 'user', 1),
('user73', 'dummyPass7890', 'Chloe Harris', 'chloe.harris@example.com', '555-999-4444', '6969 Walnut St', 'user', 1),
('user74', 'secure123456789', 'Liam Davis', 'liam.davis@example.com', '555-444-8888', '7070 Pine St', 'user', 1),
('user75', 'pass1234567890', 'Ava Hill', 'ava.hill@example.com', '555-777-3333', '7171 Oak St', 'user', 1),
('user76', 'passwordABC567', 'Noah White', 'noah.white@example.com', '555-999-5555', '7272 Cedarwood St', 'user', 1),
('user77', 'qwertyPass0123', 'Olivia Martinez', 'olivia.martinez@example.com', '555-444-7777', '7373 Walnutwood St', 'user', 1),
('user78', 'userPass5678', 'Jackson Harris', 'jackson.harris@example.com', '555-666-5555', '7474 Maplewood St', 'user', 1),
('user79', 'pass5678901', 'Sophia Phillips', 'sophia.phillips@example.com', '555-111-6666', '7575 Pineview St', 'user', 1),
('user80', 'randomPass7890', 'Liam Turner', 'liam.turner@example.com', '555-777-1111', '7676 Elm St', 'user', 1),
('user81', 'strongPass01234', 'Emma Cooper', 'emma.cooper@example.com', '555-333-8888', '7777 Cedar St', 'user', 1),
('user82', 'testPass01234', 'Mason Turner', 'mason.turner@example.com', '555-666-1111', '7878 Birch St', 'user', 1),
('user83', 'dummyPass8901', 'Chloe Harris', 'chloe.harris@example.com', '555-999-6666', '7979 Walnut St', 'user', 1),
('user84', 'secure1234567890', 'Liam Davis', 'liam.davis@example.com', '555-444-1111', '8080 Pine St', 'user', 1),
('user85', 'pass12345678901', 'Ava Hill', 'ava.hill@example.com', '555-777-4444', '8181 Oak St', 'user', 1),
('user86', 'passwordABC6789', 'Noah White', 'noah.white@example.com', '555-999-2222', '8282 Cedarwood St', 'user', 1),
('user87', 'qwertyPass12345', 'Olivia Martinez', 'olivia.martinez@example.com', '555-444-5555', '8383 Walnutwood St', 'user', 1),
('user88', 'userPass6789', 'Jackson Harris', 'jackson.harris@example.com', '555-666-9999', '8484 Maplewood St', 'user', 1),
('user89', 'pass6789012', 'Sophia Phillips', 'sophia.phillips@example.com', '555-111-7777', '8585 Pineview St', 'user', 1),
('user90', 'randomPass8901', 'Liam Turner', 'liam.turner@example.com', '555-777-6666', '8686 Elm St', 'user', 1),
('user91', 'strongPass123456', 'Emma Cooper', 'emma.cooper@example.com', '555-333-2222', '8787 Cedar St', 'user', 1),
('user92', 'testPass123456', 'Mason Turner', 'mason.turner@example.com', '555-666-4444', '8888 Birch St', 'user', 1),
('user93', 'dummyPass012345', 'Chloe Harris', 'chloe.harris@example.com', '555-999-7777', '8989 Walnut St', 'user', 1),
('user94', 'secure12345678901', 'Liam Davis', 'liam.davis@example.com', '555-444-1111', '9090 Pine St', 'user', 1),
('user95', 'pass123456789012', 'Ava Hill', 'ava.hill@example.com', '555-777-5555', '9191 Oak St', 'user', 1),
('user96', 'passwordABC789', 'Noah White', 'noah.white@example.com', '555-999-6666', '9292 Cedarwood St', 'user', 1),
('user97', 'qwertyPass23456', 'Olivia Martinez', 'olivia.martinez@example.com', '555-444-3333', '9393 Walnutwood St', 'user', 1),
('user98', 'userPass78901', 'Jackson Harris', 'jackson.harris@example.com', '555-666-4444', '9494 Maplewood St', 'user', 1),
('user99', 'pass78901234', 'Sophia Phillips', 'sophia.phillips@example.com', '555-111-5555', '9595 Pineview St', 'user', 1),
('user100', 'randomPass90123', 'Liam Turner', 'liam.turner@example.com', '555-777-8888', '9696 Elm St', 'user', 1);

INSERT INTO Discounts (DiscountCode, DiscountAmount, DiscountPercent, Quantity, StartDate, EndDate)
VALUES
('DISCOUNT1', 5.00, NULL, 10, '2024-01-01', '2024-02-01'),
('DISCOUNT2', NULL, 15, 20, '2024-02-15', '2024-03-15');

INSERT INTO ShippingMethods ([Name], Cost)
VALUES
('Standard Shipping', 5.99),
('Express Shipping', 12.99);

INSERT INTO Orders (UserId, ShippingMethodId)
VALUES
(1, 1),
(2, 2);

INSERT INTO OrderDetails (OrderId, BookId, Quantity, Price, DiscountId)
VALUES
(1, 1, 2, 29.99, 1),
(2, 3, 1, 24.99, 2);

INSERT INTO Payments (OrderId, PaymentType, Amount)
VALUES
(1, 'Credit Card', 65.97),
(2, 'PayPal', 24.99);

--select * from Users

