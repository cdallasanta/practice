[] Users should be able to upload and download their files/photos from any device.
[] Users should be able to share files or folders with other users.
  how to handle folders -> document db
[] Our service should support automatic synchronization between devices, i.e., after updating a file on one device, it should get synchronized on all devices.
  push updates vs pull updates
[] The system should support storing large files up to a GB.
[] ACID-ity is required. Atomicity, Consistency, Isolation and Durability of all file operations should be guaranteed.
[] Our system should support offline editing. Users should be able to add/delete/modify files while offline, and as soon as they come online, all their changes should be synced to the remote servers and other online devices.
[] The system should support snapshotting of the data, so that users can go back to any version of the files.

questions:
  do I need to plan for payment
  file size limits
  persissions (editing vs just viewing, can they copy or download?)
  files ever expire?
  How many users/day, how many files read/written per day, how long to store data?
  Two users working on the same file at the same time? Sharepoint vs Google Drive
  
notes:
  FS dbs location-based probably

500M total users
100M daily active users (DAU)
3 devices/user
100KB file size, 200 files/user

100B files -> 10 PB
1M users/minute


Document (meta data):
  id
  userId
  path
  lat/long
  users_with_permission
  folderId
  lastUpdated

Folder:
  id
  userId
  users_with_permission

User:
  name, email, password

uploadFile(appKey, userId, content, path = None, parentFolder = None)
shareFile(appKey, userId, path, newUser)
accessFile(appKey, userId, path)

Push vs pull updates:
  Pull would be manually triggered, could lead to out of date data on user end, but easier on servers
  Push would be necessary, especially as users are working on the same document

offline:
  On signin, take documents with different "Last Updated" and send to server
  What to do when server version is different than last checkout