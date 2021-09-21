$c[------------------------------------------------NEW COMMAND--------------------------------------------------------------]
$c[Command trigger: {prefix}afk]
$c[Language: BDScript]
$c[Variables: UserOldNickname, AFK, AFKMSG]
$c[Set the "AFK" variable value to 0]
$nomention $suppressErrors $deletecommand
$setUserVar[UserOldNickname;$nickname[$authorID];$authorID]
$if[$serverOwner[$guildID]!=$authorID]
$changeUsernameWithID[$authorID;[AFK] $nickname[$authorID]]
$endif
<@$authorID> is AFK $message
$setUserVar[AFK;1;$authorID]
$setUserVar[AFKMSG;AFK **$message**;$authorID]
$deleteIn[5s]
$c[Made with ❤ by github.com/CallMeLa]


$c[------------------------------------------------NEW COMMAND--------------------------------------------------------------]
$c[Command trigger: $alwaysReply or a-Z command triggers]
$c[Language: BDScript 2]
$c[Variables: UserOldNickname, AFK, AFKMSG, Prefix]
$c[Set the "AFK" variable value to 0]
$suppressErrors $nomention
$if[$getUserVar[AFK;$authorID]==1]
$c[NOTE: Optionally replace "$getServerVar[Prefix;$guildID]" with your bots prefix instead of using a variable]
$if[$checkContains[$message;$getServerVar[Prefix;$guildID]afk]==false]
$if[$serverOwner[$guildID]!=$authorID]
$changeUsernameWithID[$authorID;$getUserVar[UserOldNickname;$authorID]] $endif
<@$authorID> welcome back!
$setUserVar[AFK;0;$authorID]
$deleteIn[5s] $endif $endif
$if[$checkContains[$message;@]]
$if[$getUserVar[AFK;$mentioned[1;no]]==1]
$deletecommand
<@$mentioned[1;no]> is $getUserVar[AFKMSG;$mentioned[1;no]]
$endif $endif
$c[Made with ❤ by github.com/CallMeLa]
