---
layout: page
title: xwMOOC 모형
subtitle: "캐글 - 전자상거래 옷 리뷰"
author:
    name: xwMOOC
    url: https://www.facebook.com/groups/tidyverse/
    affiliation: Tidyverse Korea
date: "2018-11-22"
output:
  html_document: 
    toc: yes
    toc_float: true
    highlight: tango
    code_folding: show
    number_section: true
    self_contained: true
editor_options: 
  chunk_output_type: console
---




# 캐글 데이터셋 {#kaggle-datasets}

[Women's e-commerce cloting reviews](https://www.kaggle.com/nicapotato/womens-ecommerce-clothing-reviews) 데이터를 바탕으로 텍스트 데이터를 예측모형에 Feature로 넣어 예측력을 향상시키는 방안을 살펴보자.

## 데이터 사전 {#data-dictionary}

캐글 [Women's e-commerce cloting reviews](https://www.kaggle.com/nicapotato/womens-ecommerce-clothing-reviews) 데이터는 총 11개 변수로 구성되어 있고 관측점이 23,486개로 구성되어 있다.
**Recommended IND**를 라벨 목표변수로 두고 예측모형을 구축해보자.

- Clothing ID: Integer Categorical variable that refers to the specific piece being reviewed.
- Age: Positive Integer variable of the reviewers age.
- Title: String variable for the title of the review.
- Review Text: String variable for the review body.
- Rating: Positive Ordinal Integer variable for the product score granted by the customer from 1 Worst, to 5 Best.
- Recommended IND: Binary variable stating where the customer recommends the product where 1 is recommended, 0 is not - recommended.
- Positive Feedback Count: Positive Integer documenting the number of other customers who found this review positive.
- Division Name: Categorical name of the product high level division.
- Department Name: Categorical name of the product department name.
- Class Name: Categorical name of the product class name.



```r
library(tidyverse)
library(janitor)

cloth_dat <- read_csv("data/Womens Clothing E-Commerce Reviews.csv")

cloth_dat %>% 
  clean_names() %>% 
  sample_n(100) %>% 
  DT::datatable()
```

<!--html_preserve--><div id="htmlwidget-2efb1ed5b63ddd110d83" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-2efb1ed5b63ddd110d83">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"],[22870,14945,10130,14697,9606,11077,5033,15630,2716,19982,5696,5286,5267,9328,8558,19735,75,16357,4981,11201,14915,4299,3242,14907,18465,10595,19077,10786,20844,13526,22553,9994,5221,10833,3655,13023,7550,20988,5071,14393,19828,18119,10153,14924,6893,2792,7484,19237,5923,2212,6080,16952,7970,12570,1196,1391,18569,6152,14028,8942,14328,14629,6319,3127,15377,9884,16328,11072,23427,2812,13729,11571,12973,7140,19315,10663,499,10686,22895,16066,3918,17370,20536,4980,15818,18661,8981,21801,15265,22433,13995,6122,22697,15518,2066,14643,855,10719,13921,15121],[1091,867,820,898,872,831,1095,981,1022,873,1075,895,1035,940,873,490,845,1087,1110,558,828,1081,937,984,440,1009,452,1038,1097,909,1098,1110,1099,1110,912,1078,829,1078,868,862,875,1087,820,1117,1077,491,116,862,867,1052,828,1095,1025,862,1110,946,1034,862,621,862,862,1084,938,835,1088,1115,1081,1092,854,869,868,835,871,891,1078,1083,1078,1002,895,1068,460,1049,872,1110,1110,838,940,1121,864,291,863,860,1087,1099,1072,332,895,867,1110,828],[39,34,42,47,31,49,29,62,38,45,49,51,36,42,54,42,48,63,38,27,31,62,36,47,45,22,62,57,65,25,51,45,62,30,28,41,26,51,41,29,41,64,39,34,35,50,63,45,50,26,27,28,44,34,38,43,59,55,46,60,26,49,44,29,24,26,32,27,42,39,44,35,36,27,49,40,36,91,41,34,29,31,43,55,50,41,22,29,26,28,26,26,45,35,59,40,30,40,57,25],["Just ok for mw","Wanted to love...","Inconsistent all the way around","Crazy long , but pretty","Perfect summer top","Better in person","Cute dress","Stiff, thin, unflattering","Love these jeans!","Unique top","Beautiful fabric but not for the busty","Great poncho","Love them","Love this cozy sweater","Fun","Love this romper","Very very cute but a lot of fabric",null,"Elegant sundress","Great basic!","Nautical style!","Funny armholes",null,"Basic with a twist","Soooooo soft!","Sweet and romantic little piece","Terrace robe","Stylist","A great transitional piece","Luxurious","Shapeless tent",null,"I don't get it...","New favorite dress","Comfortable but boxy shape","Dainty and darling","Perfect buttondown","Soft and comfortable","Great tee!","Very soft and cute design","Great tank if....","Huge and shapeless","So unflattering....nothing like picture","Love it!","Super feminine. love!","Casual layering piece","Beautiful","Everyone needs this top!","Beautiful!","Sooo comfortable!",null,"Perfect lbd","Stylish and comfortable","Well made, however, too large for me.","Huge","This sweater is short in length","A must buy!","Comfortable flattering top","Drop-dead gorgeous",null,"Love","Cozy winter party dress","Great cardigan","Very cute",null,"Elegant and warm coat","Great dress!","Does not look good in person- strawberry shortcake","Sheer shirt","Green is a gorgeous color","Pretty, lightweight shirt for summer but huge","Maybe swing is for me!",null,"**great for broad shouldered women**",null,null,"Cute concept, fits weird",null,null,"Versatile summer staple",null,"Looking forward to wearing these fancy pants!",null,"Special piece","Beautiful dress","Oversized","Really fun &amp; cozy","A wrinkled mess","Sherbrooke peplum top","Beautiful print and well made",null,"Stunning","Not for broad shoulders",null,"A bit big","Springtime!","Cute!!",null,null,"Favorite shirt"],["I love the pattern, but the color was not great on my skin tone. i tried on the regular size and it wasn't great. teh cut could work, but overall, i didn't feel like it was enough for me to order the petite to see, and i sometimes do. in a tall darker toned person, this would be gorgeous. what i like the most is the color pattern in the print, and shimmer.","An odd top.\r\nfor my curvy figure (34g), the seam did not enhance, but rather made me look wider.\r\nthe material is...interesting. foam-like is all i can think to describe it. the fabric and design are not as elegant looking in person.","I saw this blouse in the store a few weeks ago and thought it was really pretty- great colors and fun beading around the wrists &amp; hem. went online to order the petite size and when it arrived i literally couldn't believe it was the same shirt! it was so washed out compared to the one in the store and the petite size is very short (and i'm only 5 feet tall so that's saying something!). the neckline is very wide and open- not even sure what kind of bra wouldn't show?? sadly i wasted the shipping c","Love the material (more natural fiber than synthetic), the pattern, and the colors. also, it is cozy! the one con is that it is really big and crazy-long. so long, that it may be a show-stopper. on the fence about that.","I love this top! it's the perfect lightweight top for summer and the details are so feminine and pretty. the fit is extremely flattering. the arm holes are not too large (i.e. do not have to worry about exposing bra). i think you can dress it up with heels, wear it casually with shorts, &amp; also pairs perfectly with kimonos. i'm 5'4, 130 # and i took my usual retailer size in this, size small.","I probably would have never purchased this blouse is i had only seen it online. but i was at our local store looking for something else and spotted it hanging all the way on the other end of the store. a salesperson encouraged me to try it on and it is beautiful! it can easily be dressed up or down. you can tie the bow in multiple ways or leave it hanging. it is sheer but the pattern obscures the transparency so no camisole is needed. it embraces the 70's vibe in a modern way. i absolutely love","Well made dress. cute pleats - though a few didn't lie perfectly flat. it was a little too long for me (i'm 5'1) especially in the torso/straps area. also the armholes were a little large. fits tts","I was hoping that this would be a nice neutral layering staple but it simply leaves a lot to be desired. it fits tts, length is fine...the inside is some, but the outside darker material is stiff and cheap (kinda canvas feeling?). the material is super stiff which makes it flare out like like a tent in a super unflattering way. it also is on the thinnish side - it looks in the model shot like it would be a little thicker and warm. this is definitely going back.","This is my second pair of these jeans (i ruined the first pair and immediately ordered a replacement). wear them all the time. i did go up one size to get a better fit (i don't exactly have slim thighs--ha!), but other than that, they are pretty perfect!","I love, love, love this top! the cutout pattern in front is such a unique look and is a great way to add some fun to your usual t-shirt and jeans look. it's well made and the fit is great. i got it in petite s which worked great length-wise.","This dress is very beautiful - great fabric and colors - but it looked terrible on me because i have large breasts. i am 32dd and this dress made me look pregnant. if you have the right body type it would be a great breezy summer dress. i'm sad because i can't wear it:(","I love this poncho because it's the perfect weight and it is softer than i thought it would be. i will get a lot of use out of it. getting it on sale made it even better.","I just received these jeans. love them. i usually wear a 29- i ordered a 30 and they fit great. they are too long- will need to be hemmed. but the fit is great. the material is soft. lovely. great buy.","Cozy and nice quality. great fit and runs true to size. could wear this every day","Hi, i bought this top for my daughter. she absolutely loves it. the fabric is very substantial. it flows really nice. if i was younger i would buy one for myself. lol","Bought the blue romper and love it to bits! definitely a summer staple. i'm 5'4\", 105 lbs and generally consider myself proportioned, but curvy on the bottom, and the xs fit perfectly. many rompers have really short inseams, but this one is a relatively conservative 4-5\" so i feel comfortable and can dress it up or down. i've worn it a few times and received tons of compliments. it's super comfortable, forgiving, and flattering. i originally purchased it in black in pxs and ps, because at the ti","I am so drawn to baby doll and boxy shirts so i immediately tried this on in the store. i am petite and only 5'2\", so usually shirts with a lot of fabric swallow me whole but this one was still cute. there is a lot more fabric than the picture lets on, but i think it is still super cute and flattering. i would definitely check the size chart and read comments to see if someone with your same size description has recommended a specific size for your body type. i am petite and weigh about 110 lbs","I'm 5'8\" and a 2/xs and this fit well in size 2, waist was actually a bit loose. unfortunately the waist hit at least 2\" too high -- on my ribcage. not cute or flattering. that was the only flaw. would be perfect on someone about 5'6\". otherwise the dress looked exactly as pictured. love the boho vibe of this dress, the lace, sleeve length, and cotton material. could easily be dressed up or down. the style feels a little edgy - not too sweet. i am so sad to return this.","I'm 5'4 with an hourglass shape. i love this dress. it drapes nicely, the material won't be hot for summer and the color is perfect for my olive complexion.","The shirt fits true to size. the length of the top is great: not too short (won't show your midrift when you raise your arms) not too long (this is a shirt not a dress). this is a great top for a casual day in jeans or a flirty day with skirt to dress it up.","Love this top! cloth &amp; stone makes excellent quality clothes that are durable and have unique details. this top can go with many different looks and i can't wait to take it out for a spin!\n\ni bought the medallion crops to go with this top and it is an awesome combo, i would definitely check it out!","In general, if you were a fan of the turtleneck swing dress, you'll love the overall fit (tts) and fabric of this. the patterns/colors are also great! my issue was the armholes...they are a bit too large and the opening comes a little too far forward which makes it a little unflattering in the underarm area. i may reconsider when it goes on sale, but it's a pass for now.","I love the fit of this sweater. i recently had a baby and am a little self-conscious of my stomach area. the sweater, in my usual size s, hides my problem area without being big and boxy. the weave seems like it will be prone to snags, so i'll have to be careful.","Wasn't too sure about this jacket when i got it in the mail - seemed a little boxy on - maybe a smaller size would've worked better but i want to be able to layer. however, i'm keeping it because it's versatile, i love the contrast of the front/back and the buttons on the sleeve (which actually button and un-button, meaning they aren't just for show and the sleeves can be easily rolled up). a great basic jacket with some neat details.","These pants are amazingly soft and comfortable. they can be worn with cute flats and a dressier top/accessories to work or with a simple tee or tank with tennies for running errands or lounging around. these are great for multiple seasons. i'm 5'2 so they are a little long but the ruched ankle makes that look by \"by design\".","My local retailer had one of these skirts in store, presumably a return. i was so excited when i found out that it was in my size! i'm 5'7 and usually a 2 or 4 at retailer and bought the 2 for reference. the skirt is made of a heavy fabric and the pockets are lined with paisley fabric! the seams look really sturdy and the skirt moves well. it's very cute and super easy to wear. i styled it with brown boots, an retailer belt and a white button down. great for spring/summer xx","Absolutely perfect for summer. great weight, lovely soft lining. love pockets in any robe. sleeve length is perfect. actually flattering, if you consider robes such a thing. i love it!","These pilcro jeans are so very cute. i usually wait for a sale to purchase the pilco jeans, but i didn't want to chance them not being available in my size. the pilco jeans seems to sell out fast. the cotton material is very soft but not sloppy. you will love the embroidery down the side of the leg. they do run a bit big. i purchased them in one size smaller for a slimmer fit. i would suggest one size up if you like them more baggy.","Love it ! ...although i had to purchase it in 3 sizes before finding the right one. it does run large. i normally take a l or el ... but a medium in this had the perfect drape ! i am 5'11\" and 185 lbs and it is very flattering ! a perfect piece to be worn as a dress or as a tunic over skinny pants ... can be as sophisticated or casual as you choose to make it with accessories !","This sweater is very warm yet light. the pink color is very cute, and the buttons are detailed very nicely! it hangs a bit low under the arms, and definitely tightens at the wrist. i ordered the xs size, and i find that i am unable to push the sleeves up. this is so beautiful and has a subtle uniqueness.","I tried this on in the store and it was huge. i couldn't try on a smaller size because they only had a 2 and 4. i tried on my usual size 12. i don't think the embroidery is as pretty in person either. definitely not worth the price.","This is a great dress!  very different and light but cute details","I know this is supposed to be a loose, flowy fit which is exactly the style i love. however, this is beyond tent-like. i'm 40 weeks pregnant and i can probably fit two of me in my normal size small. fabric is very thin and pattern looks like drab wallpaper. huge bummer, especially after seeing a few 5-stars.","I had only planned to check out this dress at the store but ended up buying it then and there! not a deal breaker but there were extra threads hanging from some parts of the dress. it made me a bit concern that the stitching would unravel during wear. so far, so good! i wish they had paid more attention to little details like that.","I was pleased with the fabric and lace, and the arms fit me nicely. the only problem was that the bottom of the sweater was very boxy and not flattering. i am having the sides taken in to fix.","I love the dress overall, however, found it a tad snug in the bust area. overall, a beautiful dress to own.","I almost bought this tank online, but decided to wait. once i saw it in the store, i knew i had to have it. i bought it in the ivory color, which is perfect. the gold details are subtle, and so pretty. i don't find it too sheer, as some of the other reviews have stated. the cut is so flattering, and it is easy to wear to work when paired with a cardigan.","Cute dress. i say true to size - but keep in mind it is loose and flowy and i purchased in my usual size medium and it fits perfectly. it's lined so there is no need for a slip. very comfortable and cool. i am 5'6\" and it is 3\" above knee. i paired it with the gemline lariat turquoise necklace and have already received several compliments and my day is only 1/2 over!\r\na great priced dress which holds true to retailer's quality and uniqueness of items offered.","I was hesitant to buy but this tee is easy, light, and fun to wear.  the fabric is light but not see through in the slightest.  the construction is perfect.  it is tts for an oversized tee.","The material is so soft and i really like the design (i got the map one). as others mentioned, sleeves are quite short, almost morel like a muscle tee than a t-shirt, but i don't mind. looks really cute under a cardigan for fall too.","The detail and design is gorgeous on the tank. my issue however is that the yellow is pretty bright. the website makes it look like a butter yellow but it is actually a lemon yellow. i do not care for that shade and would definitely limit what i paired it with. bummer!","I have a pair of mih jeans that are the only jeans i own that i absolutely love. everything about them. this jumper looked versatile, useful and fun, so i splurged during the 25% off dress sale.\n\nmy experience with mih is that the sizing runs true, or european, and thus small. i ordered this in a medium and it is gargantuan as well as virtually shapeless. it looked horrible from every angle: front, back and sides. i cannot imagine it having more fit even in a smaller size.\n\nthe fabric is nice, p","I agree with the other reviewers, this top is completely disappointing in every way, i could not believe it was the same top i pulled from the bag. where to begin,.......\r\nit runs really big\r\nit's short and boxy, not at all like it appears on the model, this must be pinned a lot in this picture.\r\ncolors are completely dull in person, i really think this picture was lightened a great deal.\r\nfabric feels cheap and stiff\r\nlining is stuff and poorly sewn.\r\ni haven't one positive thing to say about t","This is such a unique piece and could be dressed up or down. i can see myself wearing this with skinny jeans and a tee and adding a statement necklace or wearing over a dress. i tend to get hot so i like how light weight this is even though it is lined. it is of excellent quality but may run slightly small (or at least smaller than other items i have purchased through retailer). the drape is extremely flattering and i think that would be true for every figure. my favorite feature is the oversized","First i definitely understand why most reviewers either adore or hate this dress. luckily for me it worked in my favor although i will point out the downsides too. (1) it runs small. the only reason i was able to fit my usual size is because i have a tiny bust and have been working to tone up. but still i had to maneuver to get the sidezip up. i would size up but....(2) being that this dress runs small it appears more fitted on top as if it were a fit and flare or bustier which i like. (3) you h","This is great, lightweight top layer that's just right for the little evening chill in the summer when the sun goes down, or on a breezy day. it's sheer, so it requires a bottom layer. the medium fits a little tighter across the shoulders and arms for me than it shows on the model, which i like.","I ordered this as a gift and may order myself one. it is so comfortable and pretty.","I am a short frame with broad shoulders and a large chest which means peplum tops typically look horribly unflattering on my frame. not this top! the cut is very flattering due to the lower peplum. not too much fabric to add to the waistline, truly a perfect fit. if this top came in any other colors, i would buy them all.","I love this top! it is sheer, so wear a cami, but it so pretty, i will wear it a lot! a winner for sure.","These pants are so comfortable and cute!! you can dress them up or down!","Great shirt. very soft and comfortable. the elastic on top to keep it off shoulders is not too tight--just tight enough. the colors are pretty. it's give a rustic city vibe. love!","This dress is perfect for anyone with an hour glass shape,it is true to size, i am 5'3 and 125b the 2 petite fit perfectly. the fabric has a little give to it so if you have hips and a chest it will stretch a little without feeling tight and dress sinches in the waist creating a beautiful silhouette. it's the structure of this dress that makes it elegant and sexy. this dress is so figure flattering, i could not believe how many complements i've received on it.","The fit of these jeans are so great! they look syllish and feel great at the same time. this brand does a fabulous job of creating a jean that feels like you can wear them dressed up and casual. a+","This is a very nice top, however, it was too large for me. i ordered a medium and needed a small. i am 5'9\",145 lbs.i will try again with a small.","I am 5'-7\" and 135 lbs, i bought a medium petite as i wanted the dress to hit at my knees, instead of midi. this dress is easily 2 sizes bigger than expected. the pattern was not flattering on my although i'm sure it would be for others. i was happy with the length...","I have been wanting this sweater and decided to order. when i received it, there was no tag on the product. it was not in a typical clear bag from retailer and it wasn't packaged nicely. it came from reno, nv. most products i order do not get shipped from there. it is short, and i'm 5'1\". most clothes that are short fit me with no problem. this sweater might hit me at the waist, or maybe shorter. i think the color is nice and the sweater is soft but not what i wanted. i am going to return it","Just received my second pair of pilcro legging jeans; having bought them last year as well. great for work, girls night out, date night. so comfortable, with lots of stretch; fortunately they hold their shape and don't stretch out. they feel like pjs, but are nice enough for work. my pair from last year have held up well (color-wise), however some of the leg seam stitching unraveled-- hence the reason for 4 stars in quality. hopefully, these will fare better.\n\nregardless, i highly recommend!","I love this top! i have all 4 colors in size large. i'm 5'9 170 lbs with a large bust. it's a loose fit that is very flattering. do not dry i wash in cold water and hang dry. first one i bought i dried and it shrunk quick a bit. if you are tall, size up.","When i tried on this dress my husband's jaw dropped to the ground. it is so unique and so beautiful on. however the cut of the fabric fit oddly on me so i am exchanging for a small with fingers crossed. i am a size 6, 5'8\" and the medium just felt a little boxy over the middle section. my six year old son said that it was the most beautiful dress he had ever seen. buy this!","Great fit, the fabric is supple and of good quality; has a fasionable look to it but is also very very comfortable. can't beat that!","Someone else mentioned that this fit like a grandpa sweater and they were absolutely right. it's definitely loose fitting, but it's really cute and well made. i usually get a medium size in tops/sweaters but, after reading the other reviews, i ordered the small and i'm so glad i did - it's the perfect casual cardigan. i wish it came in more colors!","I bought this shift dress for a \"black &amp; plaid\" nye event, and it fit the bill perfectly for a cold winter's night. looks great with tights and boots, has pockets, and dresses up nicely. i like a good shift at this point in the holiday season -- leaves room for that last bit of seasonal eating and drinking. looking forward to wearing this through the winter months.","Great cardigan. love the tie on the back of the collar. excited i was able to get the blue on sale. definitely runs big, but the small fits me well!","I loved this top when i tried it on in the store. i was very close to buying, but i knew my sister would want, so i moved on. it is a great fitting top. i am 5'7, 125lbs, and the small fit perfectly. i do question how well this top will fit petite people.","I absolutely love this dress! it's great for business casual. it's also such a great color for the transition into fall.","Love this coat! beautiful pattern and thick enough to keep you warm with a lining inside. i am short so i got the petite and it fits perfectly in the arms and overall length. i read other comments about the button being too low but i didn't find this to be true. i liked the lower button as it allows you to show some of what you have underneath.","This is one of the best things i've ever purchased at retailer. it's comfortable, stylish, and flattering. i ordered it in black, and i'm now ordering the green as well. i usually wear small in the dolan line, and this is no exception. i am 5'2\", 135 lbs, athletic build, and the regular small fits perfectly.","This dress looks amazing on-line. in person the arm ruffles are much larger and stick out, and the dress at the bottom makes you look like strawberry shortcake. too much all over ruffling at the chest and is not flattering. pattern is dizzying in person. \r\n\r\nvery thin multi layer dress. should be better material and quality for this price. save your money and shipping.","What drew me to this shirt was the beautiful silver and gold embroidery on the front. the shirt was folded at the store, which makes sense because if it were hung it up, fewer people would try it on. this shirt is sheer from the front and more sheer in the back. this is what bugs me about so many \"clothes\" that are made these days: they are so cheaply made, so thin with cloth, that you are forced to layer with a camisole or something else in order to wear it in public. i can't wear sheer clothes","I purchased this in the green color, and in person it does have a little bit of blue in it so it's a very flattering color. the blouse has a simple shape but the details are what makes this an interesting piece. it looks as good under a suit as it does with jeans and a leather jacket. fits tts.","The previous reviewer was right on with her review, including that the shirt is a bit darker in color irl. i'm writing this review to emphasize how large this shirt runs. i'm typically a small in shirts, usually a 4 and occasionally a 6 if it's a very fitted style. i'm 5'5\", 125lbs, 34b, and i went with the xs in this, and it is huge on me. i really like it though, so i'm considering reordering in an xxs, i've never worn an xxs. i'm starting to get frustrated with inconsistent sizing, especially","I love swing dresses but they never seem to work out for me. however, lately i have been trying on swing tops like this one and they are super scores! i love this top! in my store, they had a rack of test materials where they don't have the full line but they have a look at some online features or clothes that are very new releases. this was on the rack. i knew it wasn't my size but i tried it on anyway and i am absolutely in love. i am waiting for a sale (as always) but i am going to get this i","The shape is flattering on my postpartum body. even though the material is stretchy cotton and the shirt fits well across my shoulders and chest, the swing shape hides my stomach area. the material doesn't seem particularly breathable, so you might want to avoid wearing it in really hot, humid weather; but for my summers in the pacific northwest, it'll be fine.","After reading previous reviews i definitely had to give this a try since i have broader shoulders than the average woman. my regular size (small) was not available anymore so i went with medium and i have to say it worked out well. the small would have not given me the slouchy factor that the medium gives me. this top definitely has no problem staying \"off the shoulder\" since i have broad shoulders it doesn't completely come off me. loving the boho-chic vibe of this!",null,"This dress fits like a dream and looks gorgeous on. i'm sure it will be a go to for many occasions.","The fun colors drew me to this but it sure fit weird. the top was fine but it became a bit tent-like in the waist. the material doesn't feel great either.",null,"Absolutely beautiful, i am extremely happy with this purchase. i bought this top a couple of months ago and have worn it many times. initially, i was a little apprehensive to order due to some of the other reviews but i found that this top is very figure flattering. it is very soft and warm and i am positive it will be in my wardrobe for quite a few years to come. i am almost sad that i will have to put it away for the season soon.","Great summer pants. real wide leg. fit perfect even my muscular thighs. run a little roomy right of the rack but stretch out terribly. in my regular size, they start falling off after few hours of wear. long. dragging on the floor on my 5'7 frame.","One of my first rompers, it's super cute. i need to get used to the puffy sleeves but my husband also really likes it and he's definitely got an opinion about these things.","These pants are awesome! very light weight and will be great for spring/summer. now if only the sunshine will get here and melt away all of this snow!\n\ni also purchased the top pictured on the model, it is super cute with this outfit and can work with so many different looks. check it out!\n\nthey run big, i would definitely consider sizing down or ordering two sizes to try on.","So beautiful! fabric hangs great, lovely detail, fits well and feels great","This is such a pretty dress. it will look beautiful in the summer with a tan and lace up sandals for a very effortless look. fits very fitted in the top and loose throughout yet still slimming. i am petite 5'2 about 105 pounds and for reference i went with the xxsp. it looks expensive and well made and the yellow color is stunning and cheery. the yellow will look beautiful on darker skin tones as well as lighter skin tones who have a warm undertone. if you are on the fence order it and you won't","This lacey dress fits well and is very comfortable.","This shirt fit really really big! i ordered an xl but think i could get away with a l, if not a medium. sadly, it's going back :( otherwise, it's high quality and a beautiful design.","When i tell people i invested in a \"horse sweater\" i don't get a lot of encouraging comments, but when they see it they understand. so cute, different, and cozy for cold days (winter is long where i live). really works as both a sweater and as a coat.","I love anything orange- when i saw this coat online, i ordered it as i loved all the features. the features of the coat are fun- however the coat came all bunched up in the package. i let it hang for a couple of days but the wrinkles were awful and even steaming and an iron would not take the creases away. i tried the coat on - the buckles were poorly made. i ended up returning this jacket.","Fits great, comfortable!","I love this design so much and it is very well made. i also like the adjustable shoulder straps and that the cups are not padded cups. i think that makes it look less like a bra and more like a bathing suit. only con is that it seems to run small.","This t shirt is huge. i am 5' tall, size xs and i am swimming in this xs. i'm trying a size down. it is meant to be oversized but this is extreme.","I'm in love with this top! looks just like it does in the photos, except the colors are maybe a little more vibrant. it's definitely boxy, so you may not like it if boxy isn't your thing, but i think the pattern placement really works with the boxy shape. i usually wear a small in tops and the xs/s fits great. it's also machine wash and tumble dry which is a plus (although i haven't washed it yet). unique, chic, and effortless...order before it's gone!","This was pretty to look at: nice weight, lining, colors. i tried it on and whoa. ridiculously bad. i have broad shoulders and a small waist and this accentuated the broadness of my shoulders and eliminated any hint of shape below that. the model photo looks great, so i imagine this will look great on anyone with slim shoulders and narrow hips. definitely not for me, though...","Love this dress. had to exchange it because it runs a little small. i got the right size and it is beautiful.","I really loved the colors in this dress and was looking for a long sleeve dress. this style may just be big fitting but the sleeves were way too long and the dress was just shapeless on me. i usually wear a small or a size 4 in clothing and the size small in this dress was way too big. the x-small may have been a better fit but this dress was on backorder and i just received it right before we are going on a trip. there's no time to order the x-small but maybe i can look at it again when we retu","I saw these shorts while leaving the store and immediately went back to the register to add them to my wardrobe. they fit me true to other cartionnier clothing. i'm 5'7\" 126 lbs and took a size 6. there is a significant amount of stretch in them, but do not grow as the day goes on. the colors are bright and fun without looking juvenile.","I am going to disagree with reviewers who say this runs small. i found it very short and wide. that being said, it is meant to be cropped. i ordered a size small and it fit perfectly, albeit a little short. for reference, i am usually a size 6/medium in retailer shirts and dresses.","This is a really cute sweater. it's thick enough to keep you warm, but it just didn't look right on me. it made me look frumpy.","I love this dress! good for work or social occasions. flowy fabric, and not boxy. the length is perfect, not too short.  i can't wait to wear it. picture is accurate as to color.","Best part: covers my bum. perfect for teaching, casual girls' night or casual date night.  my only complaint is there aren't other colors. awful decision. i would have purchased at least 5 of these at the right price."],[4,3,3,5,5,4,5,2,5,5,3,5,5,5,5,5,5,4,5,5,5,4,5,4,5,5,5,5,5,5,1,5,3,5,4,4,5,5,5,4,4,2,1,5,4,5,5,5,5,5,5,5,5,5,3,3,5,5,5,5,5,4,5,5,5,5,5,1,2,5,4,5,5,5,5,5,2,5,5,5,4,5,5,5,4,3,5,1,5,5,4,5,3,5,4,5,5,4,5,5],[1,0,0,1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,1],[0,0,0,0,2,0,14,11,0,3,1,0,0,0,3,2,5,0,1,0,5,3,2,1,2,3,1,1,1,3,2,0,1,1,0,7,0,0,0,0,2,2,4,0,1,0,0,0,0,4,0,0,0,0,1,1,2,2,10,0,0,1,0,1,1,2,0,1,65,0,5,17,1,0,0,1,1,0,0,5,0,1,0,19,0,7,0,1,0,1,2,0,0,0,4,8,0,2,0,0],["General Petite","General Petite","General Petite","General","General","General Petite","General Petite","General Petite","General Petite","General","General Petite","General","General","General","General","General Petite","General Petite","General","General","Initmates","General","General Petite","General","General","Initmates","General Petite","Initmates","General Petite","General","General","General","General","General","General","General Petite","General","General","General","General","General Petite","General","General","General Petite","General","General","Initmates","Initmates","General","General Petite","General","General","General","General","General Petite","General","General","General Petite","General","General Petite","General Petite","General","General","General Petite","General Petite","General Petite","General","General Petite","General Petite","General Petite","General","General","General","General","General","General Petite","General","General","General","General Petite","General Petite","General","General Petite","General Petite","General","General Petite","General Petite","General","General","General","Initmates","General","General","General Petite","General Petite","General Petite","General","General","General","General","General"],["Dresses","Tops","Tops","Tops","Tops","Tops","Dresses","Jackets","Bottoms","Tops","Dresses","Tops","Bottoms","Tops","Tops","Bottoms","Tops","Dresses","Dresses","Intimate","Tops","Dresses","Tops","Jackets","Intimate","Bottoms","Intimate","Bottoms","Dresses","Tops","Dresses","Dresses","Dresses","Dresses","Tops","Dresses","Tops","Dresses","Tops","Tops","Tops","Dresses","Tops","Jackets","Dresses","Intimate","Intimate","Tops","Tops","Bottoms","Tops","Dresses","Bottoms","Tops","Dresses","Tops","Bottoms","Tops","Intimate","Tops","Tops","Dresses","Tops","Tops","Dresses","Jackets","Dresses","Dresses","Tops","Tops","Tops","Tops","Tops","Tops","Dresses","Dresses","Dresses","Bottoms","Tops","Bottoms","Bottoms","Bottoms","Tops","Dresses","Dresses","Tops","Tops","Jackets","Tops","Intimate","Tops","Tops","Dresses","Dresses","Dresses","Bottoms","Tops","Tops","Dresses","Tops"],["Dresses","Knits","Blouses","Fine gauge","Knits","Blouses","Dresses","Jackets","Jeans","Knits","Dresses","Fine gauge","Jeans","Sweaters","Knits","Pants","Blouses","Dresses","Dresses","Layering","Blouses","Dresses","Sweaters","Jackets","Lounge","Skirts","Sleep","Jeans","Dresses","Fine gauge","Dresses","Dresses","Dresses","Dresses","Fine gauge","Dresses","Blouses","Dresses","Knits","Knits","Knits","Dresses","Blouses","Outerwear","Dresses","Layering","Sleep","Knits","Knits","Pants","Blouses","Dresses","Jeans","Knits","Dresses","Sweaters","Jeans","Knits","Lounge","Knits","Knits","Dresses","Sweaters","Blouses","Dresses","Outerwear","Dresses","Dresses","Knits","Knits","Knits","Blouses","Knits","Fine gauge","Dresses","Dresses","Dresses","Skirts","Fine gauge","Pants","Shorts","Pants","Knits","Dresses","Dresses","Blouses","Sweaters","Outerwear","Knits","Swim","Knits","Knits","Dresses","Dresses","Dresses","Shorts","Fine gauge","Knits","Dresses","Blouses"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>x1<\/th>\n      <th>clothing_id<\/th>\n      <th>age<\/th>\n      <th>title<\/th>\n      <th>review_text<\/th>\n      <th>rating<\/th>\n      <th>recommended_ind<\/th>\n      <th>positive_feedback_count<\/th>\n      <th>division_name<\/th>\n      <th>department_name<\/th>\n      <th>class_name<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[1,2,3,6,7,8]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


## 데이터 전처리 {#data-dictionary-preprocessing}

캐글 옷 리뷰 데이터에서 텍스트 관련 변수(`Title`, `Review`)를 빼고 전통적인 사각형 데이터프레임을 생성한다.
텍스트는 별도로 빼서 **DTM**을 만들어 결합시킨다. 텍스트 Feature를 모형설계행렬로 반영한 후 예측모형 알고리즘을 돌려 예측모형 정확도를 향상시킨다.

<img src="fig/kaggle-cloth-review.png" alt="텍스트" width="100%" />

### 텍스트 빼고 전처리 {#data-dictionary-preprocessing-no-text}


```r
cloth_dat <- cloth_dat %>% 
  clean_names() %>% 
  filter(complete.cases(.)) %>% 
  rename(y = recommended_ind)

cloth_df <- cloth_dat %>% 
  mutate(y = factor(y, levels=c(1,0), labels=c("yes", "no"))) %>% 
  mutate_if(is.character, as.factor) %>% 
  select(y, age, title, review_text, division_name, department_name, class_name) %>% 
  mutate(class = fct_lump(class_name, 9)) %>% 
  select(y, age, division = division_name, department = department_name, class)
```

### 텍스트 전처리 {#data-dictionary-preprocessing-with-text}

캐글 옷 리뷰 데이터에서 텍스트 관련 변수(`Title`, `Review`)를 별도 구성하여 텍스트를 DTM으로 변환시킨 후에 예측모형 구축헤 활용한다.


```r
library(tm)
library(text2vec)
library(SnowballC)
library(tidytext)

cloth_dat %>% 
  # unnest_tokens(output=word, input = title) %>% 
  # anti_join(get_stopwords()) %>% 
  cast_dtm(review_text, term, count)
```


# 예측모형 {#data-predictive-model}


## 텍스트 제외 예측모형 {#data-predictive-model}


```r
# 2. 예측모형 -----
## 2.1. 훈련/시험 데이터 분할 ------
library(caret)

xy_index <- createDataPartition(cloth_df$y, times =1, p=0.5, list=FALSE)

train_df <- cloth_df[xy_index, ]
test_df  <- cloth_df[-xy_index, ]

## 2.2. 모형 개발/검증 데이터셋 준비 ------
cv_folds <- createMultiFolds(train_df$y, k = 5, times = 1)

cv_cntrl <- trainControl(method = "repeatedcv", number = 5,
                         sampling = "down",
                         summaryFunction = twoClassSummary,
                         classProbs = TRUE,
                         repeats = 1, index = cv_folds)


## 2.2. 모형 개발/검증 데이터셋 준비 ------
library(doSNOW)
# 실행시간
start.time <- Sys.time()

cl <- makeCluster(4, type = "SOCK")
registerDoSNOW(cl)

cloth_glm   <- train(y ~ ., data = train_df, 
                    method = "glm",
                    family = "binomial",
                    metric='Sens',
                    trControl = cv_cntrl, 
                    tuneLength = 7)

cloth_rf   <- train(y ~ ., data = train_df, 
                    method = "ranger",
                    metric='Sens',
                    num.tree = 100,
                    importance = "permutation",
                    trControl = cv_cntrl, 
                    tuneLength = 7)


stopCluster(cl)

total.time <- Sys.time() - start.time
total.time
```

```
Time difference of 24.993 secs
```

```r
# 3. 예측모형 성능 -----
## GLM
glm_pred_df <- predict(cloth_glm, newdata=test_df, type="prob") %>%
  tbl_df %>% 
  mutate(class = factor(ifelse(yes > no, "yes", "no"), levels = c("yes", "no")),
         prob  = yes)

confusionMatrix(glm_pred_df$class, test_df$y)
```

```
Confusion Matrix and Statistics

          Reference
Prediction  yes   no
       yes 3262  609
       no  4781 1178
                                          
               Accuracy : 0.4517          
                 95% CI : (0.4418, 0.4616)
    No Information Rate : 0.8182          
    P-Value [Acc > NIR] : 1               
                                          
                  Kappa : 0.034           
 Mcnemar's Test P-Value : <2e-16          
                                          
            Sensitivity : 0.4056          
            Specificity : 0.6592          
         Pos Pred Value : 0.8427          
         Neg Pred Value : 0.1977          
             Prevalence : 0.8182          
         Detection Rate : 0.3318          
   Detection Prevalence : 0.3938          
      Balanced Accuracy : 0.5324          
                                          
       'Positive' Class : yes             
                                          
```

```r
## randomForest
rf_pred_df <- predict(cloth_rf, newdata=test_df) %>% 
  tbl_df %>% 
  rename(class = value)

confusionMatrix(rf_pred_df$class, test_df$y)
```

```
Confusion Matrix and Statistics

          Reference
Prediction  yes   no
       yes 3757  768
       no  4286 1019
                                          
               Accuracy : 0.4859          
                 95% CI : (0.4759, 0.4958)
    No Information Rate : 0.8182          
    P-Value [Acc > NIR] : 1               
                                          
                  Kappa : 0.0212          
 Mcnemar's Test P-Value : <2e-16          
                                          
            Sensitivity : 0.4671          
            Specificity : 0.5702          
         Pos Pred Value : 0.8303          
         Neg Pred Value : 0.1921          
             Prevalence : 0.8182          
         Detection Rate : 0.3822          
   Detection Prevalence : 0.4603          
      Balanced Accuracy : 0.5187          
                                          
       'Positive' Class : yes             
                                          
```


