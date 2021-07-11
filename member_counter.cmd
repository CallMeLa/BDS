Usage example: {prefix}setmembercounter {voice channel ID}, {prefix}setmembercounter off
Requirements: Requires 1 variable with "off" value, uses 1 command and the onJoined/onLeave callbacks. Use {prefix}setmembercounter followed by a voice channel ID that you wish to use as your counter.
Variables: MemberCounter (value: off)
Command language: BDScript Unstable

Command trigger: {prefix}setmembercounter
Code:
$nomention $suppressErrors[Invalid channel ID] $deletecommand
$onlyPerms[managechannels;You cannot use this command.]
$onlyBotPerms[managechannels;I am missing the `MANAGE_CHANNELS` permission.]
$if[$message==off]
$setServerVar[MemberCounter;off;$guildID]
Member counter channel has been disabled.
$else
$onlyIf[$isNumber[$noMentionMessage[1]]==true;Invalid channel ID]
$onlyIf[$charCount[$noMentionMessage[1]]==18;Invalid channel ID]
$setServerVar[MemberCounter;$noMentionMessage[1];$guildID]
Member counter channel has been set.
$endif

Command trigger: $onJoined
Code:
$nomention $botListHide $suppressErrors
$if[$getServerVar[MemberCounter;$guildID]!=off]
$modifyChannel[$getServerVar[MemberCounter;$guildID];$numberSeparator[$membersCount] Users;!unchanged;!unchanged;!unchanged;!unchanged]
$endif

Command trigger: $onLeave
Code:
$nomention $botListHide $suppressErrors
$if[$getServerVar[MemberCounter;$guildID]!=off]
$modifyChannel[$getServerVar[MemberCounter;$guildID];$numberSeparator[$membersCount] Users;!unchanged;!unchanged;!unchanged;!unchanged]
$endif
