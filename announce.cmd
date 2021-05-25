Usage example: !announce
Requirements: Uses multiple $awaitedCommand's, requires them all in order to execute correctly.
Variables: AnnouncementTitle (value: 0), AnnouncementBody (value: 0)
Command language: BDScript

Command trigger: !announce
Code:
$onlyPerms[managemessages;Missing permissions: `MANAGE_MESSAGES`]
$onlyBotPerms[managechannels;Missing permissions: `MANAGE_CHANNELS`]
$suppressErrors $nomention $deletecommand
$awaitFunc[AnnounceTitle;$authorID]
What is the title of your announcement?

Command trigger: $awaitedCommand[AnnounceTitle;]
Code:
$botListHide
$setUserVar[AnnouncementTitle;$message;$authorID]
$nomention $suppressErrors $deletecommand
$awaitFunc[AnnounceBody;$authorID]
$clear[2;$botID;no]
Enter your announcement message below:

Command trigger: $awaitedCommandError[AnnounceTitle]
Code:
$suppressErrors $botListHide $nomention
Something went wrong, try again later.

Command trigger: $awaitedCommand[AnnounceBody;]
Code:
$botListHide
$setUserVar[AnnouncementBody;$message;$authorID]
$nomention $suppressErrors $deletecommand
$awaitFunc[AnnounceChannel;$authorID]
$clear[2;$botID;no]
Mention the channel you want to use below:

Command trigger: $awaitedCommandError[AnnounceBody]
Code:
$suppressErrors $botListHide $nomention
Something went wrong, try again later.

Command trigger: $awaitedCommand[AnnounceChannel;]
Code:
$botListHide
$nomention $suppressErrors $deletecommand
$clear[2;$botID;no]
$useChannel[$mentionedChannels[1;yes]]
$authorIcon[$userAvatar[$authorID]]
$author[$username[$authorID]#$discriminator[$authorID]]
$title[$getUserVar[AnnouncementTitle;$authorID]]
$description[$getUserVar[AnnouncementBody;$authorID]]
$addTimestamp
$footer[ID: $authorID]
$channelSendMessage[$channelID;Your announcement has been sent.]

Command trigger: $awaitedCommandError[AnnounceChannel]
Code:
$suppressErrors $botListHide $nomention
Something went wrong, try again later.

