Use WhatsApp;
CREATE TABLE Users
(
	UserID INT PRIMARY KEY IDENTITY(1,1),
	UserName VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(50) NOT NULL,
	Bio VARCHAR(255)
);

INSERT INTO Users(UserName, PhoneNumber, Bio) VALUES
	('Gray', '08160961446', 'Tea or Coffea'),
	('Dark', '08160956645', 'Busy'),
	('Brown', '08160961447', 'I am new here'),
	('Gray', '08160961445', 'Open to business');

UPDATE Users
SET UserName ='Corleone'
WHERE users.UserID = 4;

CREATE TABLE ContactOwners
(
	ContactOwnerID INT PRIMARY KEY NOT NULL,
	FOREIGN KEY(ContactOwnerID) REFERENCES Users(UserId)
)

INSERT INTO ContactOwners(ContactOwnerID) VALUES
	(1),
	(2),
	(3),
	(4);

CREATE TABLE Contact
(
	OwnerID INT NOT NULL,
	FriendID INT NOT NULL,
	FOREIGN KEY(OwnerID) REFERENCES ContactOwners(ContactOwnerID),
	FOREIGN KEY(FriendID) REFERENCES Users(UserID),
);


INSERT INTO Contact(OwnerID, FriendID) VALUES
	(1,2),
	(1,3),
	(1,4),
	(2,1),
	(2,3),
	(2,4),
	(3,2),
	(3,4),
	(4,3);



CREATE TABLE Groups
(
	GroupId INT PRIMARY KEY IDENTITY(1,1),
	AdminID INT NOT NULL,
	GroupName VARCHAR(50) NOT NULL,
	GroupDescription VARCHAR (255),
	FOREIGN KEY(AdminID) REFERENCES Users(UserID),
);

INSERT INTO Groups(AdminID, GroupName, GroupDescription) VALUES
	(1, 'Bezao 3.0', 'Stay jiggy and cee-sharp'),
	(2, 'Fotra', 'Updates on football transfer news with Don Fabrizio');

CREATE TABLE GroupMembers
(
	GroupId INT NOT NULL,
	MemberID INT NOT NULL,
	FOREIGN KEY(GroupId) REFERENCES Groups(GroupID),
	FOREIGN KEY(MemberID) REFERENCES Users(UserID),
);

INSERT INTO GroupMembers(GroupId, MemberID) VALUES
	(1, 1),
	(1, 2),
	(1, 4),
	(2, 2),
	(2, 3),
	(2, 1);

CREATE TABLE Chats
(
	ChatID int PRIMARY KEY IDENTITY(1,1),
	ChatTimeStamp DATETIME NOT NULL,
	TextField VARCHAR(MAX) NOT NULL,
	SenderID INT NOT NULL,
	RecepientID INT NOT NULL,
	MultiRecipientID INT,
	FOREIGN KEY(SenderID) REFERENCES Users(UserID),
	FOREIGN KEY(RecepientID) REFERENCES Users(UserID),
	FOREIGN KEY(MultiRecipientID) REFERENCES Groups(GroupID),
)

INSERT INTO Chats(ChatTimeStamp, TextField, SenderID, RecepientID, MultiRecipientID) VALUES
	(GETDATE(), 'Hello', 1, 3, NULL),
	(GETDATE(), 'How are you?', 3, 1, NULL),
	(GETDATE(), 'Gray just sent a message', 3, 2, 1),
	(GETDATE(), 'Gray welcome back', 2, 1, NULL),
	(GETDATE(), 'Share this message to atleast 10 people or you will die', 4, 2, 2);

SELECT Chats.ChatTimeStamp, Chats.SenderID, Users.UserName AS [Sender's Name], Users.PhoneNumber, Chats.TextField, 
Chats.RecepientID, U.UserName AS [Recepient's Name], U.PhoneNumber,
groups.GroupName
FROM chats
INNER JOIN users ON chats.SenderID = users.UserID
INNER JOIN users U ON chats.RecepientID = U.UserID
LEFT JOIN groups ON chats.MultiRecipientID = groups.GroupId;

SELECT ContactOwners.*, U.UserName AS [Owner's Name], Contact.FriendID, Users.UserName, Users.PhoneNumber, Users.Bio FROM Contact
INNER JOIN ContactOwners ON ContactOwners.ContactOwnerID = Contact.OwnerID
INNER JOIN Users U on Contact.OwnerID = U.UserID
INNER JOIN Users on Contact.FriendID = Users.UserID;

SELECT Groups.GroupId, Groups.GroupName, Groups.GroupDescription, Groups.AdminID, U.UserName AS [Admin Name], GroupMembers.MemberID, Users.UserName as Members, Users.PhoneNumber 
FROM GroupMembers
INNER JOIN Users ON GroupMembers.MemberID = Users.UserID
INNER JOIN Groups ON GroupMembers.GroupID = Groups.GroupID
INNER JOIN Users U ON Groups.AdminID = U.UserID;