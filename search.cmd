$c["Usage: Enter a search engine and search query."]
$c[Variables = none]
$c[Language = BDScript 2]
$c[Command trigger = {Prefix}search]
$c["Code below, edit to your liking:"]
$nomention $suppressErrors
$onlyIf[$checkContains[$toLowercase[$message[1]];steam;google;spotify;twitch;soundcloud;github]==true;Missing search engine]
$onlyIf[$replaceText[$message;$message[1];;1]!=;Missing search query]
$if[$toLowercase[$message[1]]==steam]
$authorIcon[https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Breezeicons-apps-48-steam.svg/1024px-Breezeicons-apps-48-steam.svg.png]
$author[$username searched for: $replaceText[$message;$message[1];;1]]
$description[[Click here for the search results\](https://store.steampowered.com/search/?term=$replaceText[$replaceText[$message;$message[1];;1]; ;+;-1])]
$image[https://image.thum.io/get/auth/11091-RandomBot/nomention/https://store.steampowered.com/search/?term=$replaceText[$replaceText[$message;$message[1];;1]; ;+;-1]]
$elseif[$toLowercase[$message[1]]==google]
$authorIcon[https://news-cdn.softpedia.com/images/news2/the-new-google-logo-is-a-lesson-in-modern-design-490648-3.jpg]
$author[$username searched for: $replaceText[$message;$message[1];;1]]
$description[[Click here for the search results\](https://www.google.com/search?q=$replaceText[$replaceText[$message;$message[1];;1]; ;%20;-1])]
$image[https://image.thum.io/get/auth/11091-RandomBot/nomention/https://www.google.com/search?q=$replaceText[$replaceText[$message;$message[1];;1]; ;%20;-1]]
$elseif[$toLowercase[$message[1]]==spotify]
$authorIcon[https://www.abagarecords.com/files/social-icons/spotify.png]
$author[$username searched for: $replaceText[$message;$message[1];;1]]
$description[[Click here for the search results\](https://open.spotify.com/search/$replaceText[$replaceText[$message;$message[1];;1]; ;%20;-1])]
$image[https://image.thum.io/get/auth/11091-RandomBot/nomention/https://open.spotify.com/search/$replaceText[$replaceText[$message;$message[1];;1]; ;%20;-1]]
$elseif[$toLowercase[$message[1]]==twitch]
$authorIcon[https://www.shareicon.net/data/2015/10/04/111738_twitch_512x512.png]
$author[$username searched for: $replaceText[$message;$message[1];;1]]
$description[[Click here for the search results\](https://www.twitch.tv/search?term=$replaceText[$replaceText[$message;$message[1];;1]; ;%20;-1])]
$image[https://image.thum.io/get/auth/11091-RandomBot/nomention/https://www.twitch.tv/search?term=$replaceText[$replaceText[$message;$message[1];;1]; ;%20;-1]]
$elseif[$toLowercase[$message[1]]==soundcloud]
$authorIcon[https://cdn0.iconfinder.com/data/icons/free-social-media-set/24/soundcloud-512.png]
$author[$username searched for: $replaceText[$message;$message[1];;1]]
$description[[Click here for the search results\](https://soundcloud.com/search?q=$replaceText[$replaceText[$message;$message[1];;1]; ;%20;-1])]
$image[https://image.thum.io/get/auth/11091-RandomBot/nomention/https://soundcloud.com/search?q=$replaceText[$replaceText[$message;$message[1];;1]; ;%20;-1]]
$elseif[$toLowercase[$message[1]]==github]
$authorIcon[https://cdn4.iconfinder.com/data/icons/iconsimple-logotypes/512/github-512.png]
$author[$username searched for: $replaceText[$message;$message[1];;1]]
$description[[Click here for the search results\](https://github.com/search?q=$replaceText[$replaceText[$message;$message[1];;1]; ;+;-1])]
$image[https://image.thum.io/get/auth/11091-RandomBot/nomention/https://github.com/search?q=$replaceText[$replaceText[$message;$message[1];;1]; ;+;-1]]
$else
$title[Failed to search]
$description[Usage: `search google weather forecast`
Arguments: `steam`, `google`, `spotify`, `twitch`, `soundcloud`, `github`]
$endif
$cooldown[10s;No spamming, please wait %time% before searching again.]
$c[Made with ❤ by github.com/CallMeLa]
