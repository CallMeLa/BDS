$c[Add this code to your $alwaysReply or a-Z command triggers. BDScript 2.]
$nomention $suppressErrors $httpGet[https://callmela.github.io/badwords-json/badwords.json]
$if[$checkContains[$replaceText[$replaceText[$replaceText[$replaceText[$replaceText[$toLowercase[$message];?;;-1];.;;-1];,;;-1];-;;-1]; ;;-1];$httpResult]==true]
<@$authorID> please avoid using those words. $deletecommand $endif
$c[Made with ❤ by github.com/CallMeLa]
