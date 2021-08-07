Usage example: !setchannelcategory, !create, !delete, !rename.
Requirements: Must have 2 !create commands.
Variables: VCCategory (value: 0), VCUser (value: 0), CustomVCName (value: 0).
Command language: BDScript (BDScript 2 for both !create commands).
Notes: Can change 'voice' to 'text' in !create commands to allow custom text channels instead, 'VC' stands for Voice Channel, use category ID's for the !setchannelcategory command.


Command trigger: !setchannelcategory
Code:
$nomention $suppressErrors
$onlyPerms[managechannels;You cannot use this command.]
$if[$message==off]
$setServerVar[VCCategory;0;$guildID]
Disabled custom VC commands.
$else
$if[$message!=]
$if[$isNumber[$message]==true]
$setServerVar[VCCategory;$message;$guildID]
Custom VC category has been set.
$else
Please enter a category ID.
$endif
$else
Please enter a category ID.
$endif $endif


Command trigger: !create
Code:
$nomention $suppressErrors
$onlyBotPerms[managechannels;I am missing the `MANAGE_CHANNELS` permission.]
$onlyIf[$getServerVar[VCCategory;$guildID]!=0;Custom VC commands are disabled.]
$onlyIf[$getUserVar[VCUser;$authorID]==0;You already have a custom VC.]
$createChannel[$nickname's VC;voice;$getServerVar[VCCategory;$guildID]]
<@$authorID> your custom VC has been created.


Command trigger: !create
Code:
$nomention $suppressErrors $replyIn[2s]
$onlyBotPerms[managechannels;]
$onlyIf[$getServerVar[VCCategory;$guildID]!=0;]
$onlyIf[$getUserVar[VCUser;$authorID]==0;]
$setUserVar[VCUser;$findChannel[$nickname's VC];$authorID]


Command trigger: !delete
Code:
$nomention $suppressErrors
$onlyIf[$getServerVar[VCCategory;$guildID]!=0;Custom VC commands are disabled.]
$onlyIf[$getUserVar[VCUser;$authorID]!=0;You don't have a custom VC.]
$onlyBotPerms[managechannels;I am missing the `MANAGE_CHANNELS` permission.]
$deleteChannels[$getUserVar[VCUser;$authorID]]
$setUserVar[VCUser;0]
<@$authorID> your voice channel has been deleted.


Command trigger: !rename
Code:
$nomention $suppressErrors
$onlyBotPerms[managechannels;I am missing the `MANAGE_CHANNELS` permission.]
$onlyIf[$getServerVar[VCCategory;$guildID]!=0;Custom VC commands are disabled.]
$onlyIf[$getUserVar[VCUser;$authorID]!=0;You don't have a custom voice channel.]
$onlyIf[$message!=;You must enter a valid name.]
$modifyChannel[$getUserVar[VCUser;$authorID];$message; ;no;!unchanged]
$setUserVar[CustomVCName;$message;$authorID]
<@$authorID> your voice channels name has been changed.
$cooldown[10m;Please wait **%time%**]
