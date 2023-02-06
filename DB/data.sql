INSERT INTO Users(UserName, PhoneNumber, Bio) VALUES
	('Gray', '08160961446', 'Tea or Coffea'),
	('Dark', '08160956645', 'Busy'),
	('Brown', '08160961447', 'I am new here'),
	('Gray', '08160961445', 'Open to business');

UPDATE Users
SET UserName ='Corleone'
WHERE users.UserID = 4;

INSERT INTO ContactOwners(ContactOwnerID) VALUES
	(1),
	(2),
	(3),
	(4);

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

INSERT INTO Groups(AdminID, GroupName, GroupDescription) VALUES
	(1, 'Bezao 3.0', 'Stay jiggy and cee-sharp'),
	(2, 'Fotra', 'Updates on football transfer news with Don Fabrizio');

INSERT INTO GroupMembers(GroupId, MemberID) VALUES
	(1, 1),
	(1, 2),
	(1, 4),
	(2, 2),
	(2, 3),
	(2, 1);

INSERT INTO Chats(ChatTimeStamp, TextField, SenderID, RecepientID, MultiRecipientID) VALUES
	(GETDATE(), 'Hello', 1, 3, NULL),
	(GETDATE(), 'How are you?', 3, 1, NULL),
	(GETDATE(), 'Gray just sent a message', 3, 2, 1),
	(GETDATE(), 'Gray welcome back', 2, 1, NULL),
	(GETDATE(), 'Share this message to atleast 10 people or you will die', 4, 2, 2);
    