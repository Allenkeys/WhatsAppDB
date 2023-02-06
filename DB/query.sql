USE WhatsApp;

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