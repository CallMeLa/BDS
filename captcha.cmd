Usage example: Set verify role, set verify channel, type "verify" in the verify channel to be verified. Configure to your liking.
Requirements: $alwaysReply type of callback. (a-Z triggers will work also).
Variables: VerifyChannel (value = 0), VerifyRole (value = 0), UserCaptcha (value = 0)



Command trigger: {prefix}setverchannel
Command language: BDScript Unstable
Code:
$nomention $suppressErrors $deletecommand
$onlyAdmin[You cannot use this command.]
$onlyIf[$noMentionMessage[1]!=;Usage: `{prefix}setverchannel channel ID`]
$onlyIf[$isNumber[$noMentionMessage[1]]==true;Invalid channel ID]
$onlyIf[$charCount[$noMentionMessage[1]]==18;Invalid channel ID]
$setServerVar[VerifyChannel;$noMentionMessage[1];$guildID]
Verification channel has been set to <#$noMentionMessage[1]>.



Command trigger: {prefix}setverify
Command language: BDScript Unstable
Code:
$nomention $suppressErrors $deletecommand
$onlyAdmin[You cannot use this command.]
$onlyIf[$noMentionMessage[1]!=;Usage: `{prefix}setverify roleID`]
$onlyIf[$isNumber[$noMentionMessage[1]]==true;Invalid role ID]
$onlyIf[$charCount[$noMentionMessage[1]]==18;Invalid role ID]
$setServerVar[VerifyRole;$noMentionMessage[1];$guildID]
Verification role now bound to <@&$noMentionMessage[1]>



Command trigger: $alwaysReply (alternatively use "v" as a command trigger)
Command language: BDScript 2
Code:
$deletecommand $suppressErrors
$if[$getServerVar[VerifyRole;$guildID]!=0]
$if[$getServerVar[VerifyChannel;$guildID]!=0]
$if[$channelID==$getServerVar[VerifyChannel;$guildID]]
$if[$toLowercase[$message]==verify]
$onlyIf[$isBot[$authorID]==false;Bots cannot be verified.]
$onlyBotPerms[manageroles;I am missing the `MANAGE_ROLES` permission.]
$if[$isUserDMEnabled[$authorID]==true]
$setUserVar[UserCaptcha;$randomText[Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;1;2;3;4;5;6;7;8;9;0;z;y;x;w;v;u;t;s;r;q;p;o;n;m;l;k;j;i;h;g;f;e;d;c;b;a]$randomText[1;2;3;4;5;6;7;8;9;0;Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z]$randomText[1;2;3;4;5;6;7;8;9;0;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A]$randomText[1;2;3;4;5;6;7;8;9;0;a;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p;q;r;s;t;u;v;w;x;y;z;z;y;x;w;v;u;t;s;r;q;p;o;n;m;l;k;j;i;h;g;f;e;d;c;b;a]$random[10;99]$randomText[Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;1;2;3;4;5;6;7;8;9;0;a;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p;q;r;s;t;u;v;z;y;x;w;v;u;t;s;r;q;p;o;n;m;l;k;j;i;h;g;f;e;d;c;b;a;w;x;y;z]$randomText[1;2;3;4;5;6;7;8;9;0;a;b;c;d;e;f;g;h;i;j;k;l;z;y;x;w;v;u;t;s;r;q;p;o;n;m;l;k;j;i;h;g;f;e;d;c;b;a;m;n;o;p;q;r;s;t;u;v;w;x;y;z;Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z];$authorID]
$dm[$authorID]
$title[Captcha 1.0.1]
$description[Enter the following code in the [**$serverName[$guildID]**\]($getServerInvite[$guildID]) server to verify:

`$randomText[Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;1;2;3;4;5;6;7;8;9;0;z;y;x;w;v;u;t;s;r;q;p;o;n;m;l;k;j;i;h;g;f;e;d;c;b;a]$randomText[1;2;3;4;5;6;7;8;9;0;Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z]$randomText[1;2;3;4;5;6;7;8;9;0;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A]$randomText[1;2;3;4;5;6;7;8;9;0;a;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p;q;r;s;t;u;v;w;x;y;z;z;y;x;w;v;u;t;s;r;q;p;o;n;m;l;k;j;i;h;g;f;e;d;c;b;a]$random[10;99]$randomText[Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z;1;2;3;4;5;6;7;8;9;0;a;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p;q;r;s;t;u;v;z;y;x;w;v;u;t;s;r;q;p;o;n;m;l;k;j;i;h;g;f;e;d;c;b;a;w;x;y;z]$randomText[1;2;3;4;5;6;7;8;9;0;a;b;c;d;e;f;g;h;i;j;k;l;z;y;x;w;v;u;t;s;r;q;p;o;n;m;l;k;j;i;h;g;f;e;d;c;b;a;m;n;o;p;q;r;s;t;u;v;w;x;y;z;Z;Y;X;W;V;U;T;S;R;Q;P;O;N;M;L;K;J;I;H;G;F;E;D;C;B;A;A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z]`]
$else
$title[Captcha 1.0.1]
$description[**Please enable direct messages to continue:**

`User Settings > Privacy & Safety > Allow direct messages from server members.`

`Right click (long press) server icon > Privacy Settings > Allow direct messages from server members.`]
$image[https://cdn.discordapp.com/attachments/826394340804657185/855120435758891061/Screenshot_1758.png]
$endif $endif $endif $endif $endif
$if[$getServerVar[VerifyRole;$guildID]!=0]
$if[$getServerVar[VerifyChannel;$guildID]!=0]
$if[$channelID==$getServerVar[VerifyChannel;$guildID]]
$if[$getUserVar[UserCaptcha;$authorID]!=0]
$onlyIf[$isBot[$authorID]==false;<@$authorID> Bots cannot be verified.]
$onlyBotPerms[manageroles;I am missing the `MANAGE_ROLES` permission.]
$if[$message==$getUserVar[UserCaptcha;$authorID]]
$giveRole[$authorID;$getServerVar[VerifyRole;$guildID]]
<@$authorID> has successfully been verified.
$setUserVar[UserCaptcha;0;$authorID]
$else
<@$authorID> Incorrect Captcha code, please try again.
$endif $endif $endif $endif $endif



